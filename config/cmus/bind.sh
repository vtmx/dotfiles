#!/usr/bin/env bash

# remote command
cmus="cmus remote -C"

# unbind
$cmus unbind common ,
$cmus unbind common =
$cmus unbind common -
$cmus unbind common g
$cmus unbind common h
$cmus unbind common l
$cmus unbind common m
$cmus unbind common G
$cmus unbind common right
$cmus unbind common left

# up down
$cmus bind common J win-down 5
$cmus bind common K win-up 5
$cmus bind common G win-bottom
$cmus bind common g win-top

# control
$cmus bind common space player-pause
$cmus bind common ^N player-next
$cmus bind common ^P player-prev

# seek
$cmus bind common l seek +10
$cmus bind common h seek -10
$cmus bind common right seek +5
$cmus bind common left seek -5

# vol
$cmus bind common = vol +5%
$cmus bind common - vol -5% 
$cmus bind common m mute

# settings
$cmus bind common , view settings
