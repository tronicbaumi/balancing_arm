# Balancing Arm

A human-arm-pose-controlled dual-motor system. A Raspberry Pi 5 uses computer vision to track a person's elbow angles in real time and sends those values over SPI to a microcontroller bridge, which forwards them over CAN bus to drone ESC boards that spin BLDC motors on a physical balance arm.

---

## System Architecture

```
┌──────────────────────┐        SPI (1 MHz)        ┌──────────────────────┐
│   Raspberry Pi 5     │ ─────────────────────────► │  dsPIC33CK1024MP710  │
│                      │    2-byte frame / 100 ms   │  (CAN/LIN Curiosity) │
│  YOLO11 pose model   │    [left_val, right_val]   │  SPI slave → CAN Tx  │
│  Pi Camera 2.1       │                            └──────────┬───────────┘
└──────────────────────┘                                       │
                                                               │ CAN 2.0
                                             ┌─────────────────┴─────────────────┐
                                             │                                   │
                                    ID 0x001 ▼                          ID 0x002 ▼
                               ┌─────────────────────┐        ┌─────────────────────┐
                               │  dsPIC33CDVC256MP506 │        │  dsPIC33CDVC256MP506 │
                               │  Drone ESC (Node 1) │        │  Drone ESC (Node 2) │
                               │  Sensorless FOC     │        │  Sensorless FOC     │
                               └────────┬────────────┘        └────────┬────────────┘
                                        │                               │
                                   Left Motor                     Right Motor
                                 (Ducted Fan BLDC)             (Ducted Fan BLDC)
```

**Data flow:**
1. Camera captures the user's pose at 1280×720.
2. YOLO11n-pose extracts left/right elbow angles (60°–150° mapped to 0–255).
3. Pi sends a 2-byte SPI frame every 100 ms.
4. Bridge board splits the frame and transmits two CAN messages (ID 0x001, ID 0x002).
5. Each ESC reads its CAN ID, maps the byte to motor speed via `(255 - angle) << 5`, and drives the motor with sensorless FOC.

---

## Repository Structure

```
balancing_arm/
├── fw/
│   ├── rpi5/                   Python vision app (Raspberry Pi 5)
│   ├── ctrlBoard2/             Bridge board firmware (dsPIC33CK — SPI slave / CAN master)
│   └── droneESC/               ESC firmware (dsPIC33CDVC — CAN slave / motor drive)
├── hw/
│   ├── KiCad/                  Custom ESC PCB schematic and layout
│   └── 04-12307-dspic33cdvc-drone-esc-reference-design-Rev2.0/  Altium reference design
├── mec/
│   └── balance/                3D-printable mechanical parts (OpenSCAD + STL + 3MF)
├── doc/                        Datasheets, user guides, motor calculations
└── sw/                         (reserved)
```

---

## Hardware

| Board | MCU | Role |
|---|---|---|
| Raspberry Pi 5 | — | Vision node / SPI master |
| dsPIC33C Touch CAN LIN Curiosity (EV97U97A) | dsPIC33CK1024MP710 | SPI slave → CAN bridge |
| Drone ESC (custom KiCad / Pallas ref design) | dsPIC33CDVC256MP506 | CAN slave / BLDC drive |

**Communication:**

| Link | Protocol | Details |
|---|---|---|
| Pi → Bridge | SPI Mode 1, 1 MHz | 2-byte frame, `[left, right]`, every 100 ms |
| Bridge → ESC | CAN 2.0 standard, DLC=1 | Left arm → ID 0x001, right arm → ID 0x002 |
| ESC → Gate driver | Single-wire UART (DE2) | MCP8021, 9600 baud |

---

## Firmware

### `fw/rpi5/` — Raspberry Pi 5 (Python)

Runs YOLO11n-pose on a live camera feed to extract elbow angles and streams them over SPI.

**Dependencies:**
```
picamera2
ultralytics
opencv-python
spidev
numpy
```

**Run:**
```bash
cd fw/rpi5
source .venv/bin/activate
python "Core Pose Estimation Collection/claude10.py"
```

The script:
- Opens the Pi Camera 2 at 1280×720 RGB.
- Runs `YOLO11n-pose.pt` inference at 320 px input size.
- Computes elbow angles from COCO keypoints (shoulder–elbow–wrist triplets).
- Maps angles to bytes and sends a 2-byte SPI frame (CE0 / GPIO8) every 100 ms.
- Displays an annotated live preview with angle and value overlays.

### `fw/ctrlBoard2/` — Bridge Board Firmware (MPLAB X / XC16)

Project: `dspic33c-touch-can-lin-curiosity-oob-1.0.2`

Receives 2-byte SPI frames as a client and transmits two CAN 2.0 messages.

**Build:** Open `dspic33c-touch-can-lin-curiosity-oob-1.0.2.X` in MPLAB X IDE and build with XC16.

**Key files:**
- `application/application.c` — SPI receive + CAN transmit logic
- `mcc_generated_files/` — MCC Melody peripherals (SPI1, CAN1, TMR1, UART1, ADC)

**DFP:** `dsPIC33CK-MP_DFP v1.13.366`

### `fw/droneESC/` — Drone ESC Firmware (MPLAB X / XC16)

Project: `cdvc_drone_duct_can.X`

Receives a CAN message on its assigned node ID and sets motor speed using sensorless FOC.

**Build:** Open `cdvc_drone_duct_can.X` in MPLAB X IDE and build with XC16.

**Key files:**
- `main.c` — startup, CAN enable, motor start (2000 RPM after 5 s delay)
- `APL_CAN.c` / `APL_CAN.h` — CAN receive and `MCAPI_VelocityReferenceSet()` call
- `mcc_generated_files/motorBench/` — MCAF R9/RC31 sensorless FOC (ATPLL estimator, PI current/speed loops)

**Configure node ID** in `APL_CAN.h`:
```c
#define ARM_CAN_NODE  1   // 1 = left arm (ID 0x001), 2 = right arm (ID 0x002)
```

**Motor parameters (ducted fan):**
- 6-pole BLDC, R = 80.9 mΩ, L = 2.51 µH
- Ke = 5.63 mV/(rad/s), max 24 kRPM, rated 11 A
- 20 kHz PWM, CAN transceiver: ATA6563, gate driver: MCP8021

**DFP:** `dsPIC33CD-MP_DFP v1.2.151`

---

## Hardware Design

### `hw/KiCad/`

Custom ESC PCB (`EVXXXX_02-01243_Drone_ESC_Ref_Design`) with:
- Sheet 2: Inverter gate driver
- Sheet 3: Sense circuits and programming interface
- Sheet 4: CAN interface (ATA6563)

Open with **KiCad 8**.

### `hw/04-12307-.../`

Altium Designer reference design for the dsPIC33CDVC drone ESC. Includes schematic, PCB, and BOM.

---

## Mechanical Design

All parts are in `mec/balance/` as parameterized OpenSCAD files with pre-exported STL and 3MF.

| File | Description |
|---|---|
| `balance.scad` | Center hub — connects two 65 mm arm tubes, 8.1 mm pivot bore |
| `balance_base.scad` | Vertical stand — 80×180 mm base, 160 mm tall, 22 mm bearing pockets |
| `propmount.scad` | Propeller/fan mount — 66 mm fan, 20 mm motor bore, cable routing |

Print at standard FDM settings. Requires an 8–10 mm steel axle and 22 mm bearings.

---

## Tools Required

| Tool | Version | Purpose |
|---|---|---|
| MPLAB X IDE | 6.x | Build and program dsPIC firmware |
| XC16 Compiler | Latest | C compiler for dsPIC33 |
| MCC Melody | Bundled | Peripheral code generation |
| motorBench | R9 / RC31 | FOC motor tuning and code generation |
| X2Cscope | — | Real-time variable watch / oscilloscope over CAN/UART |
| Python | 3.10+ | RPi 5 vision app |
| KiCad | 8 | Custom ESC PCB |
| OpenSCAD | Latest | Mechanical part editing |

---

## Development Branch

Active branch: `develop_can` — CAN integration work.

```
main           ← stable
develop        ← general development
develop_can    ← current (CAN integration)
```
