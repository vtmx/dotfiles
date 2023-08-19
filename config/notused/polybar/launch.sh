#!/usr/bin/env bash

# kill polybar
killall -q polybar

# wait process kill
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# execute polybar
polybar bspwm &
