import cv2
import numpy as np
import threading
import time
import spidev
from picamera2 import Picamera2
from ultralytics import YOLO

# ── SPI setup ─────────────────────────────────────────────────────────
# Pi 5 SPI0 on 40-pin header:
#   GPIO 10 (pin 19) = MOSI  →  connect to receiver MOSI
#   GPIO  9 (pin 21) = MISO  →  (unused here, tie to GND or leave open)
#   GPIO 11 (pin 23) = SCLK  →  connect to receiver SCLK
#   GPIO  8 (pin 24) = CE0   →  connect to receiver CS
#   GND      (pin 6)         →  connect to receiver GND
#
# Enable with: sudo raspi-config → Interface Options → SPI → Yes
# The device will appear as /dev/spidev0.0 (bus 0, device/CE 0).
#
# Protocol used here:
#   Every 100 ms a 2-byte frame is sent:
#     byte[0] = left  elbow value as a POSITIVE signed int8 ( 0 … +127)
#     byte[1] = right elbow value as a NEGATIVE signed int8 ( 0 … -127)
#   The receiver can distinguish arms by sign without needing an
#   alternating scheme — both values arrive atomically in one transfer.
# ─────────────────────────────────────────────────────────────────────
SPI_BUS     = 0       # /dev/spidev0.x
SPI_DEVICE  = 0       # CE0  → /dev/spidev0.0
SPI_SPEED   = 500000  # 500 kHz — plenty for 2-byte frames at 10 Hz
SPI_MODE    = 0b00    # CPOL=0, CPHA=0 (most common)

spi = spidev.SpiDev()
spi.open(SPI_BUS, SPI_DEVICE)
spi.max_speed_hz = SPI_SPEED
spi.mode         = SPI_MODE

CONF_THRESH = 0.5  # minimum keypoint confidence for angle calculation

# Shared state — written by the vision loop, read by the SPI thread
_lock      = threading.Lock()
_left_val  = 0    # 0-127  (positive, sent as-is)
_right_val = 0    # 0-127  (negative, sent as twos-complement signed byte)


# ── SPI transmit thread ───────────────────────────────────────────────
def spi_thread():
    """
    Sends a 2-byte SPI frame every 100 ms:
      byte[0] = left  elbow value as a POSITIVE signed int8 ( 0 … +127)
      byte[1] = right elbow value as a NEGATIVE signed int8 ( 0 … -127)

    Signed encoding:
        left  → int8 range  0 … +127  (0x00 … 0x7F)
        right → int8 range  0 … -127  (0x00 … 0x81)

    Both arms are transferred atomically in a single CS-asserted burst,
    so the receiver always gets a consistent left/right pair.
    spidev.xfer2() keeps CS low for the entire transfer.
    """
    while True:
        with _lock:
            lv = _left_val
            rv = _right_val

        # Encode as signed bytes, then mask to unsigned for spidev
        left_byte  = lv  & 0xFF          # positive 0…+127 → 0x00…0x7F
        right_byte = (-rv) & 0xFF        # negative 0…-127 → 0x00…0x81

        spi.xfer2([left_byte, right_byte])

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
    Values outside 60-150° are clamped.
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

# ── Start SPI thread ──────────────────────────────────────────────────
t = threading.Thread(target=spi_thread, daemon=True)
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

        # Update shared state for SPI thread
        with _lock:
            _left_val  = left_val  if left_val  is not None else 0
            _right_val = right_val if right_val is not None else 0

        # Console
        left_str  = f"{angles['left']:6.1f}°  →  +{left_val:3d}"  if left_val  is not None else "  ---  (low confidence)"
        right_str = f"{angles['right']:6.1f}°  →  -{right_val:3d}" if right_val is not None else "  ---  (low confidence)"
        print(f"Left  elbow: {left_str}  [SPI byte[0]]")
        print(f"Right elbow: {right_str}  [SPI byte[1]]")
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

    # SPI status indicator — bottom-left
    try:
        spi_fd    = spi.fileno()
        spi_open  = spi_fd >= 0
    except Exception:
        spi_open  = False
    spi_status = "SPI TX: active" if spi_open else "SPI TX: ERROR"
    cv2.putText(annotated_frame, spi_status,
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
spi.close()
cv2.destroyAllWindows()
