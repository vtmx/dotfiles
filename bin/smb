#!/usr/bin/env bash

menu() {
  clear
  echo -e "\nDiretório local:  $(pwd)"
  echo -e "Diretório remoto: //fswcorp/cto/SASM/SOFTWARE_CORPORATIVO/_Linux\n"
  echo " g. get"
  echo " p. put"
  echo " q. sair"
  echo
  read -rp "Opção: " option
  echo

  case "${option}" in
  g | get)
    smb "get"
    ;;
  p | put)
    smb "put"
    ;;
  q)
    exit 0
    ;;
  *)
    read -rp "Opção não existe"
    menu "$@"
    ;;
  esac
}

smb() {
  arg=$1
  read -rp "Diretório local (Enter) atual: " dir_local
  read -rp "Diretório remoto: " dir_remote
  read -rsp "Senha: " password
  racf=$USERNAME
  host="//fswcorp/cto/SASM"
  dir_remote="SOFTWARE_CORPORATIVO/_Linux/${dir_remote}"

  # Check if local dir exist
  if [[ "${dir_local}" == "" ]]; then
    dir_local=$(pwd)
  else
    [[ ! -d "${dir_local}" ]] && echo "Diretório local não existe."; exit 1
  fi

  # Get param of command
  [[ "${arg}" == "get" ]] && opt="mget" || opt="mput"

  # Copy
  echo -e "\n\nCopiando...\n"
  if smbclient "${host}" \
    -U "itau/${racf}" \
    --password "${password}" \
    -D "${dir_remote}" \
    -c "prompt; recurse; lcd ${dir_local}; ${opt} *; exit"; then

    if [[ "${arg}" == "get" ]]; then
      exit_success "${dir_remote}" "${dir_local}"
    else
      exit_success "${dir_local}" "${dir_remote}"
    fi
  else
    exit_error "Falha na cópia"
  fi
}

exit_success() {
  local src=$1
  local dist=$2
  local green="\033[0;32m"
  local color_off="\033[0m"
  echo -e "\n${green}Diretório copiado com sucesso${color_off}\n"
  echo "De:   ${src}"
  echo "Para: ${dist}"
  exit 0
}

exit_error() {
  local red="\033[0;31m"
  local color_off="\033[0m"
  echo -e "\n${red}Falha na cópia do diretório${color_off}\n"
  exit 1
}

menu

