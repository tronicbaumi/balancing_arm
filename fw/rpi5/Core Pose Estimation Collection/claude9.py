import cv2
import numpy as np
import threading
import time
import spidev
from picamera2 import Picamera2
from ultralytics import YOLO

# -- Hardware SPI setup ------------------------------------------------
# Uses the Pi 5 SPI0 peripheral via the spidev kernel driver instead of
# software bit-banging. The controller generates the clock in hardware,
# so timing is precise and CPU load is negligible.
#
# Wiring (SPI0, unchanged from the bit-bang version):
#   GPIO 10 (pin 19) = MOSI  ->  receiver MOSI
#   GPIO 11 (pin 23) = SCLK  ->  receiver SCLK
#   GPIO  7 (pin 26) = CE1   ->  receiver CS   (driven automatically by the driver)
#   GND      (pin 6)         ->  receiver GND
#
# Mode 1: CPOL=0 (clock idle LOW), CPHA=1 (data sampled on the trailing/
#         falling edge). MSB first.
#
# ENABLE hardware SPI (opposite of the bit-bang script):
#   sudo raspi-config -> Interface Options -> SPI -> Yes
#   then reboot. The device appears as /dev/spidev0.1 (bus 0, CE1).
#
# Install spidev if needed:
#   pip install spidev
# ---------------------------------------------------------------------
SPI_BUS      = 0          # SPI0
SPI_DEVICE   = 1          # CE1  -> /dev/spidev0.1
SPI_MODE     = 0b01       # Mode 1: CPOL=0, CPHA=1
SPI_SPEED_HZ = 1_000_000  # 1 MHz clock; lower this if the receiver can't keep up

try:
    spi = spidev.SpiDev()
    spi.open(SPI_BUS, SPI_DEVICE)
    spi.max_speed_hz = SPI_SPEED_HZ
    spi.mode         = SPI_MODE
    spi.bits_per_word = 8
    spi.lsbfirst     = False   # MSB first
except (FileNotFoundError, PermissionError, OSError) as e:
    raise SystemExit(
        f"\nFailed to open /dev/spidev{SPI_BUS}.{SPI_DEVICE}: {e}\n"
        "Hardware SPI is probably not enabled. Enable it with:\n"
        "  sudo raspi-config -> Interface Options -> SPI -> Yes\n"
        "then reboot. (Make sure the spidev package is installed: pip install spidev)\n"
    )


CONF_THRESH = 0.5  # minimum keypoint confidence for angle calculation

# Shared state - written by the vision loop, read by the SPI thread
_lock      = threading.Lock()
_left_val  = 0    # 0-127  (positive, sent as-is)
_right_val = 0    # 0-127  (negative, sent as twos-complement signed byte)


# -- SPI transmit thread -----------------------------------------------
def spi_thread():
    """
    Sends a 2-byte SPI frame every 100 ms:
      byte[0] = left  elbow value as a POSITIVE signed int8 ( 0 ... +127)
      byte[1] = right elbow value as a NEGATIVE signed int8 ( 0 ... -127)

    Both arms are transferred atomically in a single CS-asserted burst.
    spidev.xfer2() holds CE1 LOW for the whole 2-byte block, so the
    receiver sees one contiguous frame per call.
    """
    while True:
        with _lock:
            lv = _left_val
            rv = _right_val

        left_byte  = lv  & 0xFF          # positive 0...+127 -> 0x00...0x7F
        right_byte = (-rv) & 0xFF        # negative 0...-127 -> 0x00...0x81

        # xfer2 keeps CS asserted for the entire block (single burst).
        spi.xfer2([left_byte, right_byte])

        time.sleep(0.1)                  # 100 ms interval


# -- Pose maths --------------------------------------------------------
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
      180deg (straight arm) -> 0
       90deg (bent arm)     -> 127
    Values outside 60-150deg are clamped.
    """
    clamped = np.clip(angle_deg, 60.0, 150.0)
    return int(np.interp(clamped, [60.0, 150.0], [0, 127]))


def get_arm_angles(results):
    """
    Returns {'left': float|None, 'right': float|None} elbow angles in degrees.
    None means the required keypoints were below CONF_THRESH.

    Triplets used (COCO indices):
      Left arm:  5 (L shoulder) -> 7 (L elbow) -> 9  (L wrist)
      Right arm: 6 (R shoulder) -> 8 (R elbow) -> 10 (R wrist)
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


# -- Camera ------------------------------------------------------------
picam2 = Picamera2()
picam2.preview_configuration.main.size   = (1280, 720)
picam2.preview_configuration.main.format = "RGB888"
picam2.preview_configuration.align()
picam2.configure("preview")
picam2.start()

# -- Model -------------------------------------------------------------
model = YOLO("yolo11n-pose.pt")

# -- Start SPI thread --------------------------------------------------
t = threading.Thread(target=spi_thread, daemon=True)
t.start()

# -- Main vision loop --------------------------------------------------
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
        left_str  = f"{angles['left']:6.1f}deg  ->  +{left_val:3d}"  if left_val  is not None else "  ---  (low confidence)"
        right_str = f"{angles['right']:6.1f}deg  ->  -{right_val:3d}" if right_val is not None else "  ---  (low confidence)"
        print(f"Left  elbow: {left_str}  [SPI byte[0]]")
        print(f"Right elbow: {right_str}  [SPI byte[1]]")
        print("-" * 50)

    except (IndexError, AttributeError):
        print("No person detected in frame")
        print("-" * 50)

    # -- Video overlay -------------------------------------------------
    annotated_frame = results[0].plot()

    # Left arm - green
    if left_val is not None:
        cv2.putText(annotated_frame,
                    f"L elbow: {angles['left']:.1f}deg  val: +{left_val}",
                    (10, 50), font, font_scale, (0, 255, 128), thickness, cv2.LINE_AA)

    # Right arm - cyan
    if right_val is not None:
        cv2.putText(annotated_frame,
                    f"R elbow: {angles['right']:.1f}deg  val: -{right_val}",
                    (10, 85), font, font_scale, (0, 200, 255), thickness, cv2.LINE_AA)

    # SPI status indicator - bottom-left
    cv2.putText(annotated_frame, "SPI TX: hardware active",
                (10, annotated_frame.shape[0] - 15),
                font, 0.55, (200, 200, 0), 1, cv2.LINE_AA)

    # FPS - top-right
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

# -- Cleanup -----------------------------------------------------------
picam2.stop()
spi.close()   # release the SPI device
cv2.destroyAllWindows()
