import cv2
import numpy as np
from picamera2 import Picamera2
from ultralytics import YOLO

CONF_THRESH = 0.5  # minimum keypoint confidence to use in angle calculation

def get_keypoint_position(results, keypoint_num, axis='x'):
    """ 
    Keypoint reference:
        0: nose          5: left_shoulder  10: right_wrist    15: left_ankle
        1: left_eye      6: right_shoulder 11: left_hip       16: right_ankle
        2: right_eye     7: left_elbow     12: right_hip
        3: left_ear      8: right_elbow    13: left_knee
        4: right_ear     9: left_wrist     14: right_knee
    """
    if not 0 <= keypoint_num <= 16:
        raise ValueError("Keypoint number must be between 0 and 16")
    if axis.lower() not in ['x', 'y']:
        raise ValueError("Axis must be 'x' or 'y'")
    keypoint = results[0].keypoints.xyn[0][keypoint_num]
    return keypoint[0].item() if axis.lower() == 'x' else keypoint[1].item()


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

    try:
        # ── Nose position ─────────────────────────────────────────────
        nose_x = get_keypoint_position(results, 0, 'x')
        nose_y = get_keypoint_position(results, 0, 'y')
        print(f"Nose     - X: {nose_x:.3f}  Y: {nose_y:.3f}")

        # ── Arm angles ────────────────────────────────────────────────
        angles = get_arm_angles(results)

        left_str  = f"{angles['left']:.1f}°"  if angles['left']  is not None else "---  (low confidence)"
        right_str = f"{angles['right']:.1f}°" if angles['right'] is not None else "---  (low confidence)"

        print(f"Left elbow angle:  {left_str}")
        print(f"Right elbow angle: {right_str}")
        print("-" * 40)

    except (IndexError, AttributeError):
        print("No person detected in frame")
        print("-" * 40)

    # ── Annotated display ─────────────────────────────────────────────
    annotated_frame = results[0].plot()

    # Overlay arm angles on the video frame
    if angles['left'] is not None:
        cv2.putText(annotated_frame,
                    f"L elbow: {angles['left']:.1f}deg",
                    (10, 60), cv2.FONT_HERSHEY_SIMPLEX,
                    0.7, (0, 255, 128), 2, cv2.LINE_AA)

    if angles['right'] is not None:
        cv2.putText(annotated_frame,
                    f"R elbow: {angles['right']:.1f}deg",
                    (10, 90), cv2.FONT_HERSHEY_SIMPLEX,
                    0.7, (0, 200, 255), 2, cv2.LINE_AA)

    # FPS counter
    inference_time = results[0].speed['inference']
    fps = 1000 / inference_time
    text = f'FPS: {fps:.1f}'
    font = cv2.FONT_HERSHEY_SIMPLEX
    text_size = cv2.getTextSize(text, font, 1, 2)[0]
    text_x = annotated_frame.shape[1] - text_size[0] - 10
    text_y = text_size[1] + 10
    cv2.putText(annotated_frame, text, (text_x, text_y),
                font, 1, (255, 255, 255), 2, cv2.LINE_AA)

    cv2.imshow("Camera", annotated_frame)
    if cv2.waitKey(1) == ord("q"):
        break

cv2.destroyAllWindows()
