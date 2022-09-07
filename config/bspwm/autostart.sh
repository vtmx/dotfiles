#!/usr/bin/env bash

xsetroot -cursor_name left_ptr &
pkill -USR1 sxhkd &
sxhkd &
feh --no-fehbg --bg-scale --randomize ~/Pictures/wallpapers/wallhaven/valorant/* &
# picom &
# dunst &
$HOME/.config/polybar/launch.sh &
