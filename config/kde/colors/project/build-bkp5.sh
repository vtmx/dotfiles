#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

script_dir=$(pwd)
base_file="Base.colors"

main() {
  # Verifica se o arquivo base existe
  [[ ! -f "${script_dir}/${base_file}" ]] && exit_error "Error: File ${base_file} not exist" 

  # Pega os valores de [Colors] com ele
  # grep -ozP '(?=\[Colors\])\n[\s\S]*?(?=\n\[|\z)' Base.colors

  # Pega os valores de [Colors] sem ele
  # grep -ozP '(?<=\[Colors\]\n)[\s\S]*?(?=\n\[|\z)' Base.colors
  colors=$(grep -ozP '(?<=\[Colors\]\n)[\s\S]*?(?=\n\[|\z)' "${base_file}" | tr '\0' '\n')

  # Criar o array associativo de atributos e valores
  declare -A attributes

  while read -r par; do
    attributes["${par#*=}"]="${par%=*}"
  done <<< "$colors"

  content=$(cat "${base_file}")
  tempfile="tempfile.txt"
  echo "${content}" > "${tempfile}"
  

  atributos=()
  valores=()
  while read -r par; do
    atributo+=("${par#*=}")
    valor+=("${par%=*}")
    sed "s/\$atributo/$valor/g" "${base_file}" > "${tempfile}"
  done <<< "$colors"


  # Imprimir o array associativo de atributos e valores
  # for value in "${!attributes[@]}"; do
  #   echo -n "${attributes[$value]}" 
  #   echo -n "="
  #   echo -n "${value}"
  #   echo ""
  #   shade=\$${attributes[$value]}
  #   sed "s/\$shade/$value/g" "${base_file}" > "${tempfile}"
  # done
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

