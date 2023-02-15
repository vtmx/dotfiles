#!/usr/bin/env bash

# Autor:  
# Data:  

# Caminho do script
script_dir=$(pwd)

# Informações do pacote
declare -A pkg

# Geral
pkg[name]=""
pkg[version]=""
pkg[description]=""
pkg[size]=""

# Categorias
# AudioVideo, Audio, Video, Development, Education
# Game, Graphics, Network, Office, Settings, Utility
# System, ConsoleOnly
pkg[categories]=""

# Executa em terminal?
pkg[terminal]="false"

# Caminhos
pkg[exec]=""
pkg[path]="/usr/bin"
pkg[exec_path]="${pkg[path]}/${pkg[exec]}"

# ------------------------------------------------------------------------------
# Função de instalação
# ------------------------------------------------------------------------------

install() {
  # app-image
  # install_exec *.AppImage

  # bin
  # install_exec node

  # dnf
  # sudo dnf install -y xournalpp-1.0.20-3.el8.x86_64

  # rpm
  # sudo dnf install -y "${script_dir}"/pkg/*.rpm
}

# ------------------------------------------------------------------------------
# Função de remoção
# ------------------------------------------------------------------------------

remove() {
  # app-image
  # remove_exec

  # bin
  # remove_exec

  # dnf
  # sudo dnf remove -y xournalpp-1.0.20-3.el8.x86_64

  # rpm
  # sudo dnf remove -y "draw.io"
}

# ------------------------------------------------------------------------------
# Verifica informações do pacote
# ------------------------------------------------------------------------------

check_pkg_info() {
  clear

  local is_null="false"

  echo Verificando informações do pacote...
  for key in "${!pkg[@]}"; do
    if [[ ! ${pkg[$key]} ]]; then
      is_null="true"
      echo_yellow "Variável vazia: pkg[${key}]"
    fi
  done

  if [[ $is_null == "true" ]]; then
    ask_exit
  fi
}
# ------------------------------------------------------------------------------
# Copia arquivo para /usr/bin e torna executável
# ------------------------------------------------------------------------------

install_exec() {
  local src="${script_dir}"/pkg/"${1}"

  echo "Verificando arquivo..."
  if ls ${src} >/dev/null 2>&1; then
    copy_to_bin "${src}"
    make_exec "${pkg[exec_path]}"
  else
    exit_error "Arquivo não existe: ${src}"
  fi
}

# ------------------------------------------------------------------------------
# Copia arquivo para /usr/bin
# ------------------------------------------------------------------------------

copy_to_bin() {
  local src=$1

  echo "Copiando arquivo..."
  if ! sudo rsync -arzP ${src} "${pkg[exec_path]}"; then
    exit_error "Falha na cópia do arquivo: ${src} para ${pkg[exec_path]}"
  fi
}

# ------------------------------------------------------------------------------
# Transforma arquivo em executável
# ------------------------------------------------------------------------------

make_exec() {
  local exec_path=$1

  echo "Transformando arquivo executável..."
  if ! sudo chmod ugo+xr "${exec_path}"; then
    exit_error "Falha ao transformar arquivo em executável"
  fi
}

# ------------------------------------------------------------------------------
# Remove arquivo executável
# ------------------------------------------------------------------------------

remove_exec() {
  if [[ -f "${pkg[exec_path]}" ]]; then
    echo "Removendo arquivo executável..."

    if ! sudo rm -f "${pkg[exec_path]}"; then
      exit_error "Falha na remoção do arquivo executável: ${pkg[exec_path]}"
    fi
  else
    exit_error "Arquivo executável não existe: ${pkg[exec_path]}"
  fi
}

# ------------------------------------------------------------------------------
# Exibe arquivos em doc
#
# param: filename - nome do arquivo
# examples: show_doc "help"
# ------------------------------------------------------------------------------

show_doc() {
  local filename=$1
  local doc_dir="${script_dir}/doc"

  if [[ -f "${doc_dir}/${filename}.txt" ]]; then
    less "${doc_dir}/${filename}.txt"
  else
    read -rp "Opção inválida. Pressione Enter para retornar ao menu"
  fi

  show_menu
}

# ------------------------------------------------------------------------------
# Exibe mensagem para sair do menu
# ------------------------------------------------------------------------------

ask_exit() {
  local message=""
  read -rp "
Deseja sair? [Y/n] " option

  if [[ "${option}" == "n" ]] || [[ "${option}" == "N" ]]; then
    show_menu
  else
    exit 0
  fi
}

# ------------------------------------------------------------------------------
# Exibe mensagens coloridas
#
# param: message - Mensagem a ser exibida
# examples: echo_green "Pacote instalado com sucesso"
# ------------------------------------------------------------------------------

echo_red() {
  local message="$1"
  local red="\033[0;31m"
  local color_off="\033[0m"
  echo -e "${red}${message}${color_off}"
}

echo_green() {
  local message="$1"
  local green="\033[0;32m"
  local color_off="\033[0m"
  echo -e "${green}${message}${color_off}"
}

echo_yellow() {
  local message="$1"
  local yellow="\033[0;33m"
  local color_off="\033[0m"
  echo -e "${yellow}${message}${color_off}"
}

echo_blue() {
  local message="$1"
  local blue="\033[0;34m"
  local color_off="\033[0m"
  echo -e "${blue}${message}${color_off}"
}

echo_purple() {
  local message="$1"
  local purple="\033[0;35m"
  local color_off="\033[0m"
  echo -e "${purple}${message}${color_off}"
}

echo_cyan() {
  local message="$1"
  local cyan="\033[0;36m"
  local color_off="\033[0m"
  echo -e "${cyan}${message}${color_off}"
}

# ------------------------------------------------------------------------------
# Exibe linhas no terminal
#
# param: tipo de linha, padrão "-"
# examples: echo_line "="
# ------------------------------------------------------------------------------

echo_line() {
  local char=$1

  if [[ "${char}" ]]; then
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "${char}"
  else
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
  fi
}

# ------------------------------------------------------------------------------
# Pausa o script
#
# param: message - mensagem que será exibida
# param: timeout - exibe mensagem pelo tempo em segundos
#
# examples:
# pause "Pressione Enter para continuar..."
# pause "Esperando 5 segundos..." 5
# ------------------------------------------------------------------------------

pause() {
  local message="${1}"
  local timeout="${2}"

  if [[ ! "${message}" ]]; then
    message="Pressione Enter para continuar..."
  fi

  if [[ "${timeout}" ]]; then
    echo "${message}"
    sleep "${timeout}"
  else
    read -rp "${message}"
  fi
}

# -----------------------------------------------------------------------------
# Create desktop file
# -----------------------------------------------------------------------------

create_desktop_file() {
  local df_file_src="${script_dir}/pkg/${pkg[exec]}.desktop"
  local df_file_dist="/usr/share/applications/${pkg[exec]}.desktop"
  local df_icon_src="${script_dir}"/pkg/*.png
  local df_icon_dir="/usr/share/icons/homologacao"
  local df_icon_dist="${df_icon_dir}/${pkg[exec]}.png"

  # Verifica se existe algum .png na pasta pkg
  if ! ls ${df_icon_src} >/dev/null 2>&1; then
    exit_error "Falha ícone não existe: ${df_icon_src}"
  fi

  echo "Criando desktop file..."
  if ! echo "[Desktop Entry]
Type=Application
Name=${pkg[name]}
Comment=${pkg[description]}
Categories=${pkg[categories]}
Terminal=${pkg[terminal]}
Path=${pkg[path]}
Exec=${pkg[exec]}
Icon=${df_icon_dist}
[X-Homologacao]
PackageName=${pkg[name]}
PackageVersion=${pkg[version]}" >"$df_file_src"; then
    exit_error "Falha ao criar desktop file: ${df_file_src}"
  fi

  echo "Movendo desktop file..."
  if ! sudo mv "${df_file_src}" "${df_file_dist}"; then
    exit_error "Falha ao copiar desktop file"
  fi

  echo "Alterando persmissões do desktop file..."
  if ! sudo chmod ugo+r "${df_file_dist}"; then
    exit_error "Falha ao alterar permissões do arquivo desktop file"
  fi

  echo "Validando desktop file..."
  if ! desktop-file-validate "${df_file_dist}"; then
    exit_error "Formato do ícone não é válido."
  fi

  if [[ ! -d "${df_icon_dir}" ]]; then
    echo "Criando pasta de ícones..."
    if ! sudo mkdir -p "${df_icon_dir}" && sudo chmod ugo+rx "${df_icon_dir}"; then
      exit_error "Falha ao criar pasta de ícones: ${df_icon_dir}"
    fi
  fi

  echo "Copiando ícone..."
  if ! sudo cp ${df_icon_src} ${df_icon_dist}; then
    exit_error "Falha ao copiar ícone: ${df_icon_src}"
  fi

  echo "Alterando permissões do ícone..."
  if ! sudo chmod ugo+r "${df_icon_dist}"; then
    exit_error "Falha ao alterar permissões do ícone: ${df_icon_dist}"
  fi
}

# ------------------------------------------------------------------------------
# Remove desktop file
# ------------------------------------------------------------------------------

remove_desktop_file() {
  local df_file="/usr/share/applications/${pkg[exec]}.desktop"
  local df_icon="/usr/share/icons/homologacao/${pkg[exec]}.png"

  echo "Removendo desktop file..."
  if ! sudo rm -f "${df_file}"; then
    exit_error "Falha ao remover desktop file: ${df_file}"
  fi

  echo "Removendo ícone..."
  if ! sudo rm -f "${df_icon}"; then
    exit_error "Falha ao remover ícone: ${df_icon}"
  fi
}

# ------------------------------------------------------------------------------
# Verifica se o pacote criado pela homologação está instalado
# O arquivo validador é o desktop file que contém o grupo customizado:
# /usr/share/applications/pkg[exec].desktop
# [X-Homologacao]
# PackageName=pkg[name]
# PackageVersion=pkg[version]
# ------------------------------------------------------------------------------

is_installed() {
  local df="/usr/share/applications/${pkg[exec]}.desktop"

  if [[ -f "${df}" ]]; then
    if grep -xq "\[X-Homologacao\]" "${df}" &&
      grep -xq "PackageName=${pkg[name]}" "${df}" &&
      grep -xq "PackageVersion=${pkg[version]}" "${df}"; then
      echo_yellow "Pacote já instalado\n"
    fi
  fi
}

# ------------------------------------------------------------------------------
# Exibe mensagem de sucesso e sai do script
#
# param: message
# return: 0
# examples: exit_success "Sucesso"
# ------------------------------------------------------------------------------

exit_success() {
  local message="$1"
  local green="\033[0;32m"
  local color_off="\033[0m"
  echo -e "\n${green}${message}${color_off}\n"
  exit 0
}

# ------------------------------------------------------------------------------
# Exibe mensagem de erro e sai do script com falha
#
# param: message
# return: 1
# examples: exit_erro "Erro"
# ------------------------------------------------------------------------------

exit_error() {
  local message="$1"
  local red="\033[0;31m"
  local color_off="\033[0m"
  echo -e "\n${red}${message}${color_off}\n"
  exit 1
}

# ------------------------------------------------------------------------------
# Lê parâmetro ou opção do menu
#
# param: option - parâmetro ou opção escolhida
# ------------------------------------------------------------------------------

read_option() {
  local option="${1}"

  if [[ "${option}" ]]; then
    case "${option}" in
    i | -i | install | --install)
      echo -e "Instalando ${pkg[name]} ${pkg[version]}..."
      install
      create_desktop_file
      exit_success "Pacote instalado com sucesso"
      ;;

    r | -r | remove | --remove)
      echo -e "Removendo ${pkg[name]} ${pkg[version]}..."
      remove
      remove_desktop_file
      exit_success "Pacote removido com sucesso"
      ;;

    v | -v | version | --version)
      show_doc "changelog"
      ;;

    f | -f | info | --info)
      show_doc "info"
      ;;

    h | -h | help | --help)
      show_doc "help"
      ;;

    q)
      clear
      exit 0
      ;;

    *)
      read -rp "Opção inválida. Pressione Enter para retornar ao menu"
      show_menu
      ;;
    esac
  else
    show_menu
  fi
}

# ------------------------------------------------------------------------------
# Exibe menu
# ------------------------------------------------------------------------------

show_menu() {
  clear
  is_installed

  read -rp "${pkg[name]} ${pkg[version]}
${pkg[description]}
Tamanho: ${pkg[size]}
  
 i. Instalação
 r. Remoção
 q. Sair

Opção: " option

  echo
  read_option "${option}"
}

# ------------------------------------------------------------------------------
# Função principal
# ------------------------------------------------------------------------------

main() {
  echo
  check_pkg_info
  read_option "$@"
}

main "$@"
