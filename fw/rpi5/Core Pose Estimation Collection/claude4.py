import cv2
import numpy as np
import threading
import time
import serial
from picamera2 import Picamera2
from ultralytics import YOLO

# ── UART setup ────────────────────────────────────────────────────────
# Pi 5 primary UART on 40-pin header:
#   GPIO 14 (pin 8)  = TXD  →  connect to receiver RX
#   GPIO 15 (pin 10) = RXD  →  connect to receiver TX
#   GND      (pin 6)        →  connect to receiver GND
#
# Enable with: sudo raspi-config → Interface Options → Serial Port
#   "Login shell over serial?" → No
#   "Serial port hardware enabled?" → Yes
# The device will appear as /dev/ttyAMA0 (or /dev/serial0 symlink).
# ─────────────────────────────────────────────────────────────────────
SERIAL_PORT = "/dev/ttyAMA0"   # symlink → correct UART regardless of Pi revision
BAUD_RATE   = 115200

uart = serial.Serial(
    port        = SERIAL_PORT,
    baudrate    = BAUD_RATE,
    bytesize    = serial.EIGHTBITS,
    parity      = serial.PARITY_NONE,
    stopbits    = serial.STOPBITS_ONE,
    timeout     = 1,
)

CONF_THRESH = 0.5  # minimum keypoint confidence for angle calculation

# Shared state — written by the vision loop, read by the UART thread
_lock      = threading.Lock()
_left_val  = 0    # 0-127  (positive, sent as-is)
_right_val = 0    # 0-127  (negative, sent as twos-complement signed byte)


# ── UART transmit thread ──────────────────────────────────────────────
def uart_thread():
    """
    Alternates every 100 ms between sending:
      • left  elbow value as a POSITIVE signed byte  (+0  … +127)
      • right elbow value as a NEGATIVE signed byte  (-0  … -127)

    Each transmission is a single signed byte written as a raw byte.
    Signed encoding uses Python's to_bytes with signed=True so the
    receiver can interpret it directly as a signed 8-bit integer:
        left  → int8 range  0 … +127  (0x00 … 0x7F)
        right → int8 range  0 … -127  (0x00 … 0x81)

    The alternating flag flips every iteration so the receiver always
    knows which arm it is getting from the sign of the byte.
    """
    send_left = True   # alternating flag
    while True:
        with _lock:
            lv = _left_val
            rv = _right_val

        if send_left:
            value = lv          # positive: 0 … +127
        else:
            value = -rv         # negative: 0 … -127

        # Pack as a single signed 8-bit byte and transmit
        raw = value.to_bytes(1, byteorder='big', signed=True)
        uart.write(raw)

        send_left = not send_left
        time.sleep(0.1)         # 100 ms interval


# ── Pose maths ────────────────────────────────────────────────────────
def joint_angle(a, b, c):
    """
    Angle at vertex B in the triangle A-B-C.
    a, b, c: numpy (2,) arrays of pixel [x, y] coords.
    Returns degrees in range 0-180.
    """
    ba = a - b
    bc = c - b
    cos_angle = np.dot(ba, bc) / (np.linalg.norm(ba) * np.linalg.norm(bc) + 1e-6)
    return np.degrees(np.arccos(np.clip(cos_angle, -1, 1)))


def angle_to_value(angle_deg):
    """
    Map elbow angle to 0-127.
      180° (straight arm) → 0
       90° (bent arm)     → 127
    Values outside 90-180° are clamped.
    """
    clamped = np.clip(angle_deg, 60.0, 150.0)
    return int(np.interp(clamped, [60.0, 150.0], [0, 127]))


def get_arm_angles(results):
    """
    Returns {'left': float|None, 'right': float|None} elbow angles in degrees.
    None means the required keypoints were below CONF_THRESH.

    Triplets used (COCO indices):
      Left arm:  5 (L shoulder) → 7 (L elbow) → 9  (L wrist)
      Right arm: 6 (R shoulder) → 8 (R elbow) → 10 (R wrist)
    """
    angles = {'left': None, 'right': None}

    if (results[0].keypoints is None
            or len(results[0].keypoints.xy) == 0
            or len(results[0].keypoints.conf) == 0):
        return angles

    kpts_xy   = results[0].keypoints.xy[0].cpu().numpy()    # (17, 2)
    kpts_conf = results[0].keypoints.conf[0].cpu().numpy()  # (17,)

    if (kpts_conf[5] > CONF_THRESH and
            kpts_conf[7] > CONF_THRESH and
            kpts_conf[9] > CONF_THRESH):
        angles['left'] = joint_angle(kpts_xy[5], kpts_xy[7], kpts_xy[9])

    if (kpts_conf[6] > CONF_THRESH and
            kpts_conf[8] > CONF_THRESH and
            kpts_conf[10] > CONF_THRESH):
        angles['right'] = joint_angle(kpts_xy[6], kpts_xy[8], kpts_xy[10])

    return angles


# ── Camera ────────────────────────────────────────────────────────────
picam2 = Picamera2()
picam2.preview_configuration.main.size   = (1280, 720)
picam2.preview_configuration.main.format = "RGB888"
picam2.preview_configuration.align()
picam2.configure("preview")
picam2.start()

# ── Model ─────────────────────────────────────────────────────────────
model = YOLO("yolo11n-pose.pt")

# ── Start UART thread ─────────────────────────────────────────────────
t = threading.Thread(target=uart_thread, daemon=True)
t.start()

# ── Main vision loop ──────────────────────────────────────────────────
font       = cv2.FONT_HERSHEY_SIMPLEX
font_scale = 0.75
thickness  = 2

while True:
    frame   = picam2.capture_array()
    results = model.predict(frame, imgsz=320, verbose=False)

    left_val  = None
    right_val = None
    angles    = {'left': None, 'right': None}

    try:
        angles    = get_arm_angles(results)
        left_val  = angle_to_value(angles['left'])  if angles['left']  is not None else None
        right_val = angle_to_value(angles['right']) if angles['right'] is not None else None

        # Update shared state for UART thread
        with _lock:
            _left_val  = left_val  if left_val  is not None else 0
            _right_val = right_val if right_val is not None else 0

        # Console
        left_str  = f"{angles['left']:6.1f}°  →  +{left_val:3d}"  if left_val  is not None else "  ---  (low confidence)"
        right_str = f"{angles['right']:6.1f}°  →  -{right_val:3d}" if right_val is not None else "  ---  (low confidence)"
        print(f"Left  elbow: {left_str}  [UART +]")
        print(f"Right elbow: {right_str}  [UART -]")
        print("-" * 50)

    except (IndexError, AttributeError):
        print("No person detected in frame")
        print("-" * 50)

    # ── Video overlay ─────────────────────────────────────────────────
    annotated_frame = results[0].plot()

    # Left arm — green
    if left_val is not None:
        cv2.putText(annotated_frame,
                    f"L elbow: {angles['left']:.1f}deg  val: +{left_val}",
                    (10, 50), font, font_scale, (0, 255, 128), thickness, cv2.LINE_AA)

    # Right arm — cyan
    if right_val is not None:
        cv2.putText(annotated_frame,
                    f"R elbow: {angles['right']:.1f}deg  val: -{right_val}",
                    (10, 85), font, font_scale, (0, 200, 255), thickness, cv2.LINE_AA)

    # UART status indicator — bottom-left
    uart_status = "UART TX: active" if uart.is_open else "UART TX: ERROR"
    cv2.putText(annotated_frame, uart_status,
                (10, annotated_frame.shape[0] - 15),
                font, 0.55, (200, 200, 0), 1, cv2.LINE_AA)

    # FPS — top-right
    inference_time = results[0].speed['inference']
    fps       = 1000 / inference_time
    fps_text  = f'FPS: {fps:.1f}'
    text_size = cv2.getTextSize(fps_text, font, 1, thickness)[0]
    cv2.putText(annotated_frame, fps_text,
                (annotated_frame.shape[1] - text_size[0] - 10, text_size[1] + 10),
                font, 1, (255, 255, 255), thickness, cv2.LINE_AA)

    cv2.imshow("Camera", annotated_frame)
    if cv2.waitKey(1) == ord("q"):
        break

# ── Cleanup ───────────────────────────────────────────────────────────
picam2.stop()
uart.close()
cv2.destroyAllWindows()
