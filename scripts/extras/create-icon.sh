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
# References
# https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html
# https://wiki.archlinux.org/title/Desktop_entries
#
# Categories
# https://askubuntu.com/questions/674403/when-creating-a-desktop-file-what-are-valid-categories
#
# Icons
# https://commons.wikimedia.org/wiki/GNOME_Desktop_icons
# https://icon-icons.com/search/icons/gnome+3
#
# Size
# https://specifications.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html
# minimum: 48x48
#
# Command check file
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
