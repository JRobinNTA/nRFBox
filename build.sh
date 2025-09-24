#!/usr/bin/env bash

# -------------------------
# Arduino-CLI ESP32 Builder
# -------------------------

SKETCH="nRFBox/nRFBox.ino"   # change if needed
VENDOR="esp32:esp32"     # hardcoded vendor/platform
EXTRA_FLAGS="-zmuldefs"  # always applied
PARTITION_SCHEME="huge_app"

# Menu of available boards
BOARDS=(
  "esp32"
  "esp32s2"
  "esp32s3"
  "esp32c3"
  "esp32c5"
  "esp32c6"
)

# If no argument passed, show menu
if [ -z "$1" ]; then
    echo "Select ESP32 board to build for:"
    for i in "${!BOARDS[@]}"; do
        echo "  $((i+1)). ${BOARDS[$i]}"
    done
    read -rp "Enter choice [1-${#BOARDS[@]}]: " choice

    # Basic validation
    if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "${#BOARDS[@]}" ]; then
        echo "Invalid choice!"
        exit 1
    fi

    BOARD="${BOARDS[$((choice-1))]}"
else
    BOARD="$1"
fi

FQBN="$VENDOR:$BOARD"

# Compile
echo "Compiling $SKETCH for board: $FQBN"
arduino-cli compile \
    --fqbn "$FQBN" \
    --build-property "compiler.c.elf.extra_flags=$EXTRA_FLAGS" \
    --board-options "PartitionScheme=$PARTITION_SCHEME" \
    "$SKETCH"

