#!/usr/bin/env python3
# yolo_pose_basic.py — YOLO11 pose on Pi 5 with Camera 2.1

import cv2
from picamera2 import Picamera2
from ultralytics import YOLO
import time

# ── Camera setup ───────────────────────────────────────────
picam2 = Picamera2()
config = picam2.create_preview_configuration(
    main={"format": "RGB888", "size": (640, 640)},
    controls={"FrameRate": 60}
)
picam2.configure(config)
picam2.start()
time.sleep(0.5)     # let sensor settle

# ── Load YOLO pose model ────────────────────────────────────
# Change to "yolov8n-pose.pt" for YOLOv8
model = YOLO("yolo11n-pose.pt")

# ── FPS counter ─────────────────────────────────────────────
fps_start = time.perf_counter()
fps_count = 0
fps_display = 0.0

while True:
    # Capture frame (already RGB from IMX219)
    frame = picam2.capture_array()

    # Run YOLO pose inference
    # verbose=False suppresses per-frame console output
    # imgsz=640 matches our capture resolution
    results = model.predict(
        frame,
        imgsz=640,
        conf=0.5,          # person detection confidence
        verbose=False
    )

    # Get annotated frame with skeleton overlay drawn by Ultralytics
    annotated = results[0].plot()

    # FPS overlay
    fps_count += 1
    elapsed = time.perf_counter() - fps_start
    if elapsed >= 1.0:
        fps_display = fps_count / elapsed
        fps_count = 0
        fps_start = time.perf_counter()

    cv2.putText(annotated,
        f"FPS: {fps_display:.1f}",
        (10, 30), cv2.FONT_HERSHEY_SIMPLEX,
        0.8, (0, 255, 0), 2
    )

    # Display — comment out if headless / SSH
    bgr = cv2.cvtColor(annotated, cv2.COLOR_RGB2BGR)
    cv2.imshow("YOLO Pose — Pi 5 + Camera 2.1", bgr)
    if cv2.waitKey(1) == ord('q'):
        break

picam2.stop()
cv2.destroyAllWindows()