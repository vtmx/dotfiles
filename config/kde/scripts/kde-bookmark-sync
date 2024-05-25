#!/usr/bin/env bash

awk -F\" '/<bookmark href="file/ {print $2}' < $HOME/.local/share/user-places.xbel > $HOME/.config/gtk-3.0/bookmarks  
