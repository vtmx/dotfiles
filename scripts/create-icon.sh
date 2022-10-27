#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Create icon
#
# Main Categories
# AudioVideo
# Audio
# Video
# Development
# Education
# Game
# Graphics
# Network
# Office
# Settings
# Utility
#
# Reference
# https://wiki.archlinux.org/title/Desktop_entries
#
# Categories
# https://askubuntu.com/questions/674403/when-creating-a-desktop-file-what-are-valid-categories
#
# Check icon
# desktop-file-validate filename.desktop
# -----------------------------------------------------------------------------

create_icon() {
  # df = Desktop File
  declare -A df

  df[type]="Application"
  df[name]="Nome"
  df[version]="1.0"
  df[comment]="Descrição"
  df[path]="/bin/nodejs"
  df[exec]="nodejs"
  df[icon]="/bin/nodejs.png"
  df[terminal]="false"
  df[categories]="Education;Languages;Java;"
  # df[file_path]="/usr/share/applications/${df[name]}.desktop"
  df[file_path]="/tmp/${df[name]}.desktop"

  echo "[Desktop Entry]
Type=${df[type]}
Version=${df[version]}
Name=${df[name]}
Comment=${df[comment]}
Path=${df[path]}
Exec=${df[exec]}
Icon=${df[icon]}
Terminal=${df[terminal]}
Categories=${df[categories]}">"${df[file_path]}"

  if ! desktop-file-validate "${df[file_path]}"; then
    rm -f $tmp_icon_file
    exit 1
  fi
}

create_icon
