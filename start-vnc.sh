#!/usr/bin/env sh

DEFAULT_DISPLAY=:1
# Check if DISPLAY environment variable is set
if [ -z "$DISPLAY" ]; then
    echo "Warning: DISPLAY environment variable is not set, exporting $DEFAULT_DISPLAY." >&2
    export DISPLAY=$DEFAULT_DISPLAY
fi

# Check if x11vnc is installed
if ! command -v x11vnc >/dev/null 2>&1; then
    echo "Error: x11vnc is not installed or not in PATH." >&2
    exit 1
fi

# Check if Xvfb is installed
if ! command -v Xvfb >/dev/null 2>&1; then
    echo "Error: Xvfb is not installed or not in PATH." >&2
    exit 1
fi

echo "DISPLAY=$DISPLAY"
Xvfb "$DISPLAY" -screen 0 1920x1080x24 &
x11vnc -display "$DISPLAY" -bg -nopw -xkb -forever

exec "$@"
