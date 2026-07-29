import cv2
import numpy as np
from picamera2 import Picamera2
from ultralytics import YOLO

CONF_THRESH = 0.5  # minimum keypoint confidence to use in angle calculation


def joint_angle(a, b, c):
    """
    Calculate the angle at point B formed by A-B-C.
    a, b, c: numpy arrays of shape (2,) — [x, y] pixel coords
    Returns angle in degrees (0-180).
    """
    ba = a - b
    bc = c - b
    cos_angle = np.dot(ba, bc) / (np.linalg.norm(ba) * np.linalg.norm(bc) + 1e-6)
    return np.degrees(np.arccos(np.clip(cos_angle, -1, 1)))


def angle_to_value(angle_deg):
    """
    Map elbow angle to a 0-127 value.
      180° (arm straight) → 0
       90° (arm bent)     → 127
    Angles outside 90-180 are clamped to the nearest bound.
    """
    clamped = np.clip(angle_deg, 60.0, 150.0)
    return int(np.interp(clamped, [60.0, 150.0], [0, 127]))


def get_arm_angles(results):
    """
    Extract left and right elbow angles from a YOLO results object.

    Uses pixel coordinates (xy) for accurate angle geometry.
    Returns a dict with keys 'left' and 'right', each either a float
    (degrees) or None if any of the three required keypoints are below
    the confidence threshold.

    Keypoint triplets:
      Left arm:  5 (left shoulder) -> 7 (left elbow) -> 9 (left wrist)
      Right arm: 6 (right shoulder) -> 8 (right elbow) -> 10 (right wrist)
    """
    angles = {'left': None, 'right': None}

    # Guard: need at least one detection with keypoints
    if (results[0].keypoints is None
            or len(results[0].keypoints.xy) == 0
            or len(results[0].keypoints.conf) == 0):
        return angles

    # Pull pixel coords and confidence for person 0
    kpts_xy   = results[0].keypoints.xy[0].cpu().numpy()    # shape (17, 2)
    kpts_conf = results[0].keypoints.conf[0].cpu().numpy()  # shape (17,)

    # ── Left arm: shoulder(5) → elbow(7) → wrist(9) ──────────────────
    if (kpts_conf[5] > CONF_THRESH and
            kpts_conf[7] > CONF_THRESH and
            kpts_conf[9] > CONF_THRESH):
        angles['left'] = joint_angle(kpts_xy[5], kpts_xy[7], kpts_xy[9])

    # ── Right arm: shoulder(6) → elbow(8) → wrist(10) ────────────────
    if (kpts_conf[6] > CONF_THRESH and
            kpts_conf[8] > CONF_THRESH and
            kpts_conf[10] > CONF_THRESH):
        angles['right'] = joint_angle(kpts_xy[6], kpts_xy[8], kpts_xy[10])

    return angles


# ── Camera setup ──────────────────────────────────────────────────────
picam2 = Picamera2()
picam2.preview_configuration.main.size = (1280, 720)
picam2.preview_configuration.main.format = "RGB888"
picam2.preview_configuration.align()
picam2.configure("preview")
picam2.start()

# ── Load YOLO11 pose model ────────────────────────────────────────────
model = YOLO("yolo11n-pose.pt")

while True:
    frame = picam2.capture_array()
    results = model.predict(frame, imgsz=320, verbose=False)

    angles    = {'left': None, 'right': None}
    left_val  = None
    right_val = None

    try:
        angles = get_arm_angles(results)

        # Convert angles to 0-127 values
        left_val  = angle_to_value(angles['left'])  if angles['left']  is not None else None
        right_val = angle_to_value(angles['right']) if angles['right'] is not None else None

        # ── Console output ────────────────────────────────────────────
        left_str  = f"{angles['left']:6.1f}°  →  {left_val:3d}"  if left_val  is not None else "  ---  (low confidence)"
        right_str = f"{angles['right']:6.1f}°  →  {right_val:3d}" if right_val is not None else "  ---  (low confidence)"
        print(f"Left  elbow: {left_str}")
        print(f"Right elbow: {right_str}")
        print("-" * 40)

    except (IndexError, AttributeError):
        print("No person detected in frame")
        print("-" * 40)

    # ── Annotated display ─────────────────────────────────────────────
    annotated_frame = results[0].plot()

    font       = cv2.FONT_HERSHEY_SIMPLEX
    font_scale = 0.75
    thickness  = 2

    # Left arm — green
    if left_val is not None:
        cv2.putText(annotated_frame,
                    f"L elbow: {angles['left']:.1f}deg  val: {left_val}",
                    (10, 50), font, font_scale, (0, 255, 128), thickness, cv2.LINE_AA)

    # Right arm — cyan
    if right_val is not None:
        cv2.putText(annotated_frame,
                    f"R elbow: {angles['right']:.1f}deg  val: {right_val}",
                    (10, 85), font, font_scale, (0, 200, 255), thickness, cv2.LINE_AA)

    # FPS — top-right
    inference_time = results[0].speed['inference']
    fps = 1000 / inference_time
    fps_text  = f'FPS: {fps:.1f}'
    text_size = cv2.getTextSize(fps_text, font, 1, thickness)[0]
    cv2.putText(annotated_frame, fps_text,
                (annotated_frame.shape[1] - text_size[0] - 10, text_size[1] + 10),
                font, 1, (255, 255, 255), thickness, cv2.LINE_AA)

    cv2.imshow("Camera", annotated_frame)
    if cv2.waitKey(1) == ord("q"):
        break

cv2.destroyAllWindows()
