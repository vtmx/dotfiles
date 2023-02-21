#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

filebase=$(pwd)"/Base.colors"
colorscheme_dir="${HOME}/.local/share/color-schemes"

main() {
  echo "Geting colorscheme name..."
  filebase_colorscheme_name=$(grep -oP '((?<=ColorScheme=).*)' "${filebase}")

  echo "Geting variables..."
  filebase_vars=$(grep -Poz '(?<=\[Colors\]\n)[\s\S]*?(?=\n\[|\z)' "${filebase}" | tr '\0' '\n')

  echo "Creating tempfile..."
  tempfile="${filebase_colorscheme_name}.colors"
  cp -f "${filebase}" "${tempfile}"

  echo "Replacing vars in file..."
  while read -r line; do
    attribute=("\$${line%=*}")
    value=("${line#*=}")
    sed -i "s/${attribute}/${value}/g" "$tempfile"
  done <<< ${filebase_vars}

  echo "Formating colorscheme file..."
  sed -i '/\[Colors\]/,/^$/d' "${tempfile}"

  # Copy file
  echo "Copying colorscheme file..."
  cp -f "${tempfile}" "${colorscheme_dir}"

  echo "Apllying color scheme..."
  plasma-apply-colorscheme BreezeDark > /dev/null
  plasma-apply-colorscheme "${filebase_colorscheme_name}" > /dev/null
}

check_prerequisites() {
  if ! type entr > /dev/null; then
    exit_error "Command not exist: entr "
  fi

  if ! plasma-apply-colorscheme > /dev/null; then
    exit_error "Command not exist: plasma-apply-colorscheme"
  fi

  if [[ ! -d "${colorscheme_dir}" ]]; then
    exit_error "Dir not exist: ${colorscheme_dir}"
  fi

  if [[ ! -f "${filebase}" ]]; then
    exit_error "File not exist: ${filebase}" 
  fi
}

get_current_colorscheme_name() {
  echo $(plasma-apply-colorscheme --list-schemes | grep current | awk '{print $2}')
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

echo
check_prerequisites
main
exit_success "Colorscheme applyied"

# References
# https://raw.githubusercontent.com/justjokiing/kshift/main/src/kshift
