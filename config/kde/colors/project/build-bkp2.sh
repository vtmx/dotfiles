#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

script_dir=$(pwd)

main() {
  check_base_colors
  local current_colorscheme=$(get_current_colorscheme)
}

check_base_colors() {
  if [[ ! -f "${script_dir}/Base.colors" ]]; then
    exit_error "Error: File Base.colors not exist" 
  fi
}

get_current_colorscheme() {
  local current_colorscheme=$(plasma-apply-colorscheme --list-schemes | grep -m1 -E '\s\*\s\w*' | cut -d' ' -f3)
  echo "${current_colorscheme}"
}

exit_success() {
  local message="$1"
  local green="\033[0;32m"
  local color_off="\033[0m"
  echo -e "${green}${message}${color_off}\n"
  exit 0
}

exit_error() {
  local message="$1"
  local red="\033[0;31m"
  local color_off="\033[0m"
  echo -e "${red}${message}${color_off}\n"
  exit 1
}

main
