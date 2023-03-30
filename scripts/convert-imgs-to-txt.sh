#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

if ! kdialog -v > /dev/null; then
  exit_error "Command not exist: kdialog"
fi

if ! tesseract -v > /dev/null; then
  exit_error "Command not exist: tesseract"
fi

main() {
  images=$(kdialog --getopenfilename . "Images jpg, png and tiff(*.jpg *.png *.tiff)" --multiple --separate-output);

  echo "Conveting images..."
  while read -r image; do
    image_name=$(echo "${image}" | sed -E 's/\.*.{3}$//g')
    tesseract -l por "${image}" "${image_name}"
  done <<< ${images}

  exit_success "Image converted with success"
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
