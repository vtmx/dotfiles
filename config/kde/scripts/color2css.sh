#!/usr/bin/env bash

main() {
  local kdeglobals="${HOME}/.config/kdeglobals"

  # Check dependencies
  [[ -f "$kdeglobals" ]] || { echo 'file ~/config/kdeglobals does not exist'; exit 1; }
  [[ $(type kreadconfig5) ]] ||  { echo "kreadconfig5 not found"; exit 1; }

  echo "
/* ColorScheme: $(kreadconfig5 --file $kdeglobals --group General --key ColorScheme) */

:root {
  /* Header */
  $(get_color header-bg Header BackgroundNormal)
  $(get_color header-fg Header ForegroundNormal)
  $(get_color header-inactive-bg 'Header --group Inactive' BackgroundNormal)
  $(get_color header-inactive-fg 'Header --group Inactive' ForegroundNormal)

  /* Window */
  $(get_color window-bg Window BackgroundNormal)
  $(get_color window-fg Window ForegroundNormal)

  /* View */
  $(get_color view-bg View BackgroundNormal)
  $(get_color view-bg-alt View BackgroundAlternate)
  $(get_color view-fg View ForegroundNormal)

  /* Selection */
  $(get_color selection-bg Selection BackgroundNormal)
  $(get_color selection-fg Selection ForegroundNormal)

  /* Complementary */
  $(get_color complementary-bg Complementary BackgroundNormal)
  $(get_color complementary-fg Complementary ForegroundNormal)

  /* Button */
  $(get_color button-bg Button BackgroundNormal)
  $(get_color button-fg Button ForegroundNormal)

  /* Tooltip */
  $(get_color tooltip-bg Tooltip BackgroundNormal)
  $(get_color tooltip-fg Tooltip ForegroundNormal)

  /* Special Texts */
  $(get_color link-fg Window ForegroundLink)
  $(get_color active-fg Window ForegroundLink)
  $(get_color positive-fg Window ForegroundPositive)
  $(get_color neutral-fg Window ForegroundNeutral)
  $(get_color negative-fg Window ForegroundNegative)
  $(get_color visited-fg Window ForegroundVisited)
}
"
}

# $1 class $2 group $3 key
get_color() {
  local color=$(kreadconfig5 --file $kdeglobals --group Colors:${2} --key ${3})

  # If rgb color
  if [[ "$color" =~ ([[:digit:]]{2},){2}[[:digit:]]{2} ]]; then
    echo "--${1}: rgb($color);"
  else
    echo "--${1}: $color;"
  fi
}

update_css() {
  sed -Ei "s/(--${1}: ).*/\1${2};/" "${0%/*}/bootstrap-biglinux.css"
}

main

tput setaf 2; echo "Done"; tput sgr0
