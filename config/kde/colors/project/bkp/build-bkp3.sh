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
  # grep -ozP '(?<=\[Colors\]\n)[\s\S]*?(?=\n\[|\z)' Base.colors | tr '\0' '\n'

  # Ler cada linha do arquivo e armazená-la no array 'lines'
  readarray -t lines < "$base_file"

  # Criar dois arrays para armazenar os atributos e os valores
  declare -a attributes
  declare -a values

  # Percorrer cada linha do arquivo e armazenar os atributos e valores nos arrays correspondentes
  for line in "${lines[@]}"; do
    attribute="$(echo "$line" | cut -d'=' -f1)"
    value="$(echo "$line" | cut -d'=' -f2)"
    attributes+=("$attribute")
    values+=("$value")

    echo "${attribute}=${value}"
  done
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
