#!/usr/bin/env bash

# Exit on any error
set -e

################################################################################
# Determine script’s directory (the location of this .sh file).
# This allows us to reference other files relative to the script’s location.
################################################################################
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "[RUN_APP] Activating virtual environment..."
# Activate the venv using a path relative to this script
source "${SCRIPT_DIR}/venv_hailo_rpi5_dmc/bin/activate"

# If you also need environment variables from setup_env.sh, uncomment:
# echo "[RUN_APP] Sourcing setup_env.sh..."
# source "${SCRIPT_DIR}/setup_env.sh"

echo "[RUN_APP] Running main.py with arguments..."

python "${SCRIPT_DIR}/main.py" \
  --labels-json "${SCRIPT_DIR}/resources/barcode-labels.json" \
  --hef-path    "${SCRIPT_DIR}/resources/yolov11_model_DMC_c.hef" \
  --input       "${SCRIPT_DIR}/resources/video.mp4" \
  --use-frame

echo "[RUN_APP] Done."
