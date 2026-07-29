#!/usr/bin/env python3
# spi_counter.py -- Send an incrementing byte over SPI on Raspberry Pi 5
#
# Wiring (40-pin header, SPI0):
#   GPIO 10 (pin 19) = MOSI  -> receiver MOSI
#   GPIO  9 (pin 21) = MISO  -> (unused, leave open or tie to GND)
#   GPIO 11 (pin 23) = SCLK  -> receiver SCLK
#   GPIO  8 (pin 24) = CE0   -> receiver CS
#   GND      (pin 6)         -> receiver GND
#
# Enable SPI first:
#   sudo raspi-config -> Interface Options -> SPI -> Yes
#
# Install spidev if needed:
#   pip install spidev

import spidev
import time

SPI_BUS    = 0        # /dev/spidev0.x
SPI_DEVICE = 0        # CE0 -> /dev/spidev0.0
SPI_SPEED  = 500000   # 500 kHz
SPI_MODE   = 0b00     # CPOL=0, CPHA=0

spi = spidev.SpiDev()
spi.open(SPI_BUS, SPI_DEVICE)
spi.max_speed_hz = SPI_SPEED
spi.mode         = SPI_MODE

counter = 0

print("Sending incremental values over SPI (Ctrl+C to stop)...")
print("-" * 40)

try:
    while True:
        # xfer2() keeps CS asserted for the whole transfer
        # It expects a list of bytes and returns the MISO bytes received
        response = spi.xfer2([counter])

        print(f"Sent: {counter:3d} (0x{counter:02X})  |  Received: {response[0]:3d} (0x{response[0]:02X})")

        counter = (counter + 1) % 256   # wrap at 255 back to 0
        time.sleep(0.5)                 # send every 500 ms

except KeyboardInterrupt:
    print("\nStopped.")

finally:
    spi.close()