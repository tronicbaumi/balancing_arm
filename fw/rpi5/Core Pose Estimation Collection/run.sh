#!/bin/bash
# run_claude6.sh -- Activate virtual environment and run claude6.py

# Directory where this script lives
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Path to the virtual environment -- adjust if your venv is elsewhere
VENV_DIR="$SCRIPT_DIR/venv"

# Activate the virtual environment
if [ ! -f "$VENV_DIR/bin/activate" ]; then
    echo "ERROR: Virtual environment not found at: $VENV_DIR"
    echo "Create it first with: python3 -m venv venv"
    exit 1
fi

echo "Activating virtual environment: $VENV_DIR"
source "$VENV_DIR/bin/activate"

# Run claude6.py
SCRIPT="$SCRIPT_DIR/claude6.py"

if [ ! -f "$SCRIPT" ]; then
    echo "ERROR: claude6.py not found at: $SCRIPT"
    deactivate
    exit 1
fi

echo "Starting claude6.py ..."
echo "----------------------------------------"
python "$SCRIPT"

# Deactivate venv after script finishes or is interrupted
deactivate
echo "----------------------------------------"
echo "Done. Virtual environment deactivated."
