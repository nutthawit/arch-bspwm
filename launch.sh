#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
TEST_CMD=$(xrandr --listmonitors | wc -l)
if [[ $TEST_CMD == 3 ]]; then
  # if external monitor is connected
  polybar top -c ~/.config/polybar/config-ext.ini &
else
  polybar top -c ~/.config/polybar/config.ini &
fi
