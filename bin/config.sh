#!/usr/bin/env bash

# Basic config in bash

# Check pre-requisites
pre_reqs=(pastel)

for command in ${pre_reqs[@]}; do
  if ! command -v $command &>/dev/null; then
    echo "$(tput setaf 1)error:$(tput sgr0) need $command"
    exit 1
  fi
done

# Declares

# Font
declare -A font=(
  ['family']='BlexMono Nerd Font Medium'
  ['size']=11
)

# Cursor
declare -A cursor=(
  ['color']='#abb2bf'
  ['shape']='block'
  ['blink_interval']=0.5
)

# Padding
declare -A padding=(
  ['x']=8
  ['y']=8
)

# Colors
declare -A color

color['scheme']='dark'

if [[ ${color['scheme']} = 'light' ]]; then
  echo='no light baby'
else
  color['hue']=220
  color['sat']=15
  color['lgt']=70
fi

color['bg']=$(pastel format hex "hsl(${color['hue']} ${color['sat']}% 15%)")
color['fg']=$(pastel format hex "hsl(${color['hue']} ${color['sat']}% 70%)")

color['hue_angle_start']=0
color['hue_angle_limit']=360
color['hue_angle_step']=30
color['hue_angle_current']=${color['hue_angle_start']}

# Rotate wheel
for number in {1..12}; do
  if (( color['hue_angle_current'] > color['hue_angle_limit'] )); then
    (( color['hue_angle_current'] = color['hue_angle_current'] - color['hue_angle_limit'] ))
  fi

  color[$number]=$(pastel format hex "hsl(${color['hue_angle_current']} ${color['sat']}% ${color['lgt']}%)")
  echo ${color['hue_angle_current']}
  (( color['hue_angle_current'] = color['hue_angle_current'] + color['hue_angle_step'] ))
done

color['bg']=${color['bg']}
color['fg']=${color['fg']}
color['selection_bg']='#61afef'
color['selection_fg']='#282c34'

for key in ${!color[@]}; do
  echo "color[$key] = ${color[$key]}"
done

