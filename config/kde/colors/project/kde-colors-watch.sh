#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

main() {
  clear
  filebase=$(pwd)"/Base.colors"

  # Check if filebase exist
  [[ ! -f "${filebase}" ]] && exit_error "Error: File ${filebase} not exist" 

  # Get filebase colorscheme name
  base_colorscheme_name=$(get_base_colorscheme_name "${filebase}")

  # Get attr and values of [Colors]
  filebase_vars=$(grep -ozP '(?<=\[Colors\]\n)[\s\S]*?(?=\n\[|\z)' "${filebase}" | tr '\0' '\n')

  # Create color scheme file
  tempfile="${base_colorscheme_name}.colors"

  # Write color scheme file
  cat "${filebase}" > "${tempfile}"

  # Loop line
  while read -r line; do
    attribute=("\$${line%=*}")
    value=("${line#*=}")
    sed -i "s/${attribute}/${value}/g" "$tempfile"
  done <<< ${filebase_vars}

  # Remove the blocks of variables
  sed -i '/\[Colors\]/,/^$/d' "${tempfile}"

  # Copy file
  echo "Copy colorscheme file..."
  cp -f "${tempfile}" "${HOME}/.local/share/color-schemes"

  # Aplly color scheme
  # plasma-apply-colorscheme "${base_colorscheme_name}"
}

get_base_colorscheme_name() {
  echo $(grep -oP '((?<=ColorScheme=).*)' "${1}")
}

get_current_colorscheme_name() {
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

