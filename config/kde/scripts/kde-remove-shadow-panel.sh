#!/usr/bin/env bash

for WID in $(xwininfo -root -tree | sed '/"Plasma": ("plasmashell" "plasmashell")/!d; s/^  *\([^ ]*\) .*/\1/g'); do
	xprop -id $WID -remove _KDE_NET_WM_SHADOW
done
