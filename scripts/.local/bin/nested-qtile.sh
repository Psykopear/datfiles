#!/bin/sh

HERE=$(dirname $(readlink -f $0))
SCREEN_SIZE=${SCREEN_SIZE:-800x600}
XDISPLAY=:1
LOG_LEVEL=${LOG_LEVEL:-INFO}
if [[ -z PYTHON ]]; then
    PYTHON=python
fi

Xephyr +extension RANDR -screen ${SCREEN_SIZE} ${XDISPLAY} -ac &
XEPHYR_PID=$!
(
  sleep 1
  env DISPLAY=${XDISPLAY} qtile &
  QTILE_PID=$!
  wait $QTILE_PID
  kill $XEPHYR_PID
)
