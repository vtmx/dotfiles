#!/usr/bin/env bash

menu() {
  clear
  echo -e "\nDiretório local:  $(pwd)"
  echo -e "Diretório remoto: //fswcorp/cto/SASM/SOFTWARE_CORPORATIVO/_Linux\n"
  echo "  g. get"
  echo "  p. put"
  echo " gp. get package"
  echo " pp. put package"
  echo "  q. sair"
  echo
  read -rp "Opção: " option
  echo

  case "${option}" in
  g | get)
    get
    ;;
  p | put)
    put
    ;;
  gp | get_package)
    get_package
    ;;
  pp | put_package)
    put_package
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

get() {
  local racf=$USERNAME
  local dir_local
  local dir_remote
  local password
  read -rp "Diretório local (Enter) atual: " dir_local

  if [[ "${dir_local}" == "" ]]; then
    dir_local=$(pwd)
  else
    if ! [[ -d "${dir_local}" ]]; then
      echo "Diretório local não existe."
      exit 1
    fi
  fi

  read -rp "Diretório remoto: " dir_remote
  dir_remote="/SOFTWARE_CORPORATIVO/_Linux/${dir_remote}"
  read -rsp "Senha: " password

  echo -e "\n\nCopiando...\n"
  if smbclient //fswcorp/cto/SASM -U itau/"${racf}"%"${password}" -c "prompt;recurse;cd ${dir_remote};lcd ${dir_local};mget *;exit"; then
    msg_success "${dir_remote}" "${dir_local}"
  else
    msg_error
  fi
}

put() {
  local racf=$USERNAME
  local dir_local
  local dir_remote
  local password
  read -rp "Diretório local (Enter) atual: " dir_local

  if [[ "${dir_local}" == "" ]]; then
    dir_local=$(pwd)
  else
    if [[ ! -d "${dir_local}" ]]; then
      echo "Diretório local não existe."
      exit 1
    fi
  fi

  read -rp "Diretório remoto: " dir_remote
  dir_remote="/SOFTWARE_CORPORATIVO/_Linux/${dir_remote}"
  read -rsp "Senha: " password

  echo -e "\n\nCopiando...\n"

  if smbclient //fswcorp/cto/SASM -U itau/"${racf}"%"${password}" -c "prompt;recurse;cd ${dir_remote};lcd ${dir_local};mput *;exit"; then
    msg_success "${dir_local}" "${dir_remote}"
  else
    msg_error
  fi
}

get_package() {
  local racf=$USERNAME
  local dir_local
  local dir_remote="/SOFTWARE_CORPORATIVO/_Linux/_package"
  local password
  read -rsp "Senha: " password

  read -rp "Diretório local (Enter) atual: " dir_local

  if [[ "${dir_local}" == "" ]]; then
    dir_local=$(pwd)
  else
    if ! [[ -d "${dir_local}" ]]; then
      echo "Diretório local não existe."
      exit 1
    fi
  fi

  echo -e "\n\nCopiando...\n"

  if smbclient //fswcorp/cto/SASM -U itau/"${racf}"%"${password}" -c "prompt;recurse;cd ${dir_remote};lcd ${dir_local};mget *;exit"; then
    msg_success "${dir_remote}" "${dir_local}"
  else
    msg_error
  fi
}

put_package() {
  local racf=$USERNAME
  local dir_local="$HOME/_package"
  local dir_remote="/SOFTWARE_CORPORATIVO/_Linux/_package"
  local password
  read -rsp "Senha: " password
  echo -e "\n\nCopiando...\n"

  if smbclient //fswcorp/cto/SASM -U itau/"${racf}"%"${password}" -c "prompt;recurse;cd ${dir_remote};lcd ${dir_local};mput *;exit"; then
    msg_success "${dir_local}" "${dir_remote}"
  else
    msg_error
  fi
}

msg_success() {
  local src=$1
  local dist=$2
  local green="\033[0;32m"
  local color_off="\033[0m"
  echo -e "\n${green}Diretório copiado com sucesso${color_off}\n"
  echo "De:   ${src}"
  echo "Para: ${dist}"
  exit 0
}

msg_error() {
  local red="\033[0;31m"
  local color_off="\033[0m"
  echo -e "\n${red}Falha na cópia do diretório${color_off}\n"
  exit 1
}

menu
