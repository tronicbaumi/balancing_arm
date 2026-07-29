import cv2
import numpy as np
import threading
import time
from gpiozero import OutputDevice
from picamera2 import Picamera2
from ultralytics import YOLO

# -- Bit-banged SPI setup ----------------------------------------------
# Replaces spidev to eliminate kernel-driver spurious clock glitches.
# Every edge is produced explicitly in Python - no surprise pulses.
#
# Wiring (same pins as hardware SPI0, so no rewiring needed):
#   GPIO 10 (pin 19) = MOSI  ->  receiver MOSI
#   GPIO 11 (pin 23) = SCLK  ->  receiver SCLK
#   GPIO  8 (pin 24) = CE0   ->  receiver CS
#   GND      (pin 6)         ->  receiver GND
#
# Mode 1: CPOL=0 (clock idle LOW), CPHA=1 (data sampled on falling edge,
#         shifted out on rising edge). MSB first.
#
# Install gpiozero if needed:
#   pip install gpiozero
# ---------------------------------------------------------------------
PIN_MOSI = 10
PIN_SCLK = 11
PIN_CS   = 8

SPI_HALF_PERIOD = 5e-6   # 5 us per half-cycle -> 100 kHz clock

try:
    mosi = OutputDevice(PIN_MOSI, initial_value=False)
    sclk = OutputDevice(PIN_SCLK, initial_value=False)  # idle LOW (CPOL=0)
    cs   = OutputDevice(PIN_CS,   initial_value=True)    # idle HIGH (CS deasserted)
except Exception as e:
    raise SystemExit(
        f"\nFailed to claim GPIO pins {PIN_MOSI}, {PIN_SCLK}, {PIN_CS}: {e}\n"
        "Most likely the kernel SPI driver still owns these pins.\n"
        "Since this script bit-bangs SPI in software, DISABLE hardware SPI:\n"
        "  sudo raspi-config -> Interface Options -> SPI -> No\n"
        "then reboot. (On Pi 5 also ensure 'lgpio' is installed: pip install lgpio)\n"
    )


def _bb_transfer(data: list[int]) -> None:
    """
    Bit-bang SPI Mode 1 (CPOL=0, CPHA=1) transfer.
    data: list of byte values (0-255), MSB first.
    CS is asserted (LOW) for the full transfer then released.

    Mode 1 timing per bit (CPHA=1):
      1. Clock goes HIGH (leading/rising edge) AND data bit placed on MOSI
      2. Half period wait  - MOSI is now stable
      3. Clock goes LOW  (trailing/falling edge) - receiver samples MOSI here
      4. Half period wait
    """
    cs.off()                              # assert CS (active LOW)
    time.sleep(SPI_HALF_PERIOD)           # CS setup time

    for byte in data:
        for bit_pos in range(7, -1, -1):  # MSB first
            # Leading edge: shift data out (CPHA=1)
            mosi.value = (byte >> bit_pos) & 1
            sclk.on()                     # rising edge, data driven out
            time.sleep(SPI_HALF_PERIOD)
            sclk.off()                    # falling edge -> receiver samples
            time.sleep(SPI_HALF_PERIOD)

    cs.on()                               # deassert CS
    mosi.off()                            # return MOSI to idle LOW


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
    """
    while True:
        with _lock:
            lv = _left_val
            rv = _right_val

        left_byte  = lv  & 0xFF          # positive 0...+127 -> 0x00...0x7F
        right_byte = (-rv) & 0xFF        # negative 0...-127 -> 0x00...0x81

        _bb_transfer([left_byte, right_byte])

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
    cv2.putText(annotated_frame, "SPI TX: bit-bang active",
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
cs.on()     # ensure CS deasserted
mosi.off()
sclk.off()
cv2.destroyAllWindows()
