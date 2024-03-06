#!/usr/bin/env bash

# Current dir
current_dir=$(cd $(dirname $0) && pwd)

menu() {
  clear
  echo "
 _    _ _____ _______  _____   ______ _______ _______         _____ 
  \  /    |      |    |     | |_____/ |  |  | |______ |      |     |
   \/   __|__    |    |_____| |    \_ |  |  | |______ |_____ |_____|"

  read -rp "
 b. Copy bin
 c. Clone repository
 f. Copy fonts 
 i. Install packages
 l. Create simbolic links
 s. Copy scripts
 q. Exit

Option: " option
  echo ""

  case "${option}" in
    b|b) copy_bin         ;;
    c|C) clone_repository ;;
    i|I) install_packages ;;
    f|F) copy_fonts       ;;
    l|L) create_links     ;;
    q|Q) exit 0           ;;
    *) pause_error "Invalid option" ;;
  esac
}

clone_repository() {
  local dir=$HOME/Dev/dotfiles
  [[ ! -d $dir ]] && mkdir -p $dir
  git clone git@github.com:vtmx/dotfiles.git $dir
}

copy_bin() {
  bindir=${HOME}/.local/bin
  [[ ! -d $bindir ]] && echo Create bin dir...; mkdir -p $bindir
  echo Create simolic link of bin...
  if ln -sf "${current_dir}/bin/"* $bindir; then
    pause_success "Created symolic link"
  else
    pause_error "Not created symolic link"
  fi
}

copy_fonts() {
  fontdir=${HOME}/.local/share/fonts
  echo Copying fonts...
  [[ ! -d $fontdir ]] && echo Create font dir...; mkdir -p $fontdir
  if cp -r "${current_dir}/fonts/"* $fontdir; then
    pause_success "Fonts copied"
  else
    pause_error "Fonts not copied"
  fi
}

install_packages() {
  echo "Install packages..."
  pause_success "Installed"
}


# Links need the complete path
create_link() {
  local name=$1
  local src=$2
  local dist=$3

  [[ $name ]] && echo "Create link for $name..."

  [[ -d $dist ]] || mkdir -p $dist 
  cp -rf $src $dist

  # Create a hard symlink
  # ln -sf $src $dist
}

create_links() {
  local config_src="${current_dir}/config"
  local config_dist="${HOME}/.config/"
   
  # bash
  # name="bash"
  # target="$config_src/bash/."*
  # link="$HOME"
  # create_link "$name" "$target" "$link"

  # bat
  name="bat"
  target="$config_src/bat"
  link="$config_dist"
  create_link "$name" "$target" "$link"

  # flameshot
  name="flameshot"
  target="$config_src/flameshot"
  link="$config_dist"
  create_link "$name" "$target" "$link"

  # kitty
  name="kitty"
  target="$config_src/kitty"
  link="$config_dist"
  create_link "$name" "$target" "$link"

  # neofetch
  name="neofetch"
  target="$config_src/neofetch"
  link="$config_dist"
  create_link "$name" "$target" "$link"

  # mpv
  name="mpv"
  target="$config_src/mpv"
  link="$config_dist"
  create_link "$name" "$target" "$link"

  # nvim
  name="nvim"
  target="$config_src/nvim"
  link="$config_dist"
  create_link "$name" "$target" "$link"

  # starship
  name="starship"
  target="$config_src/starship"
  link="$config_dist"
  create_link "$name" "$target" "$link"

  # rofi
  name="rofi"
  target="$config_src/rofi"
  link="$config_dist"
  create_link "$name" "$target" "$link"

  # tmux
  name="tmux"
  target="$config_src/tmux"
  link="$config_dist"
  create_link "$name" "$target" "$link"

  # vscode
  # name="vscode"
  # target="$config_src/vscode"
  # link="$config_dist/code - oss/user"
  # create_link "$name" "$target" "$link"

  pause_success "Links created"
}

# ------------------------------------------------------------------------------
# pause
# ------------------------------------------------------------------------------

pause() {
  read -rp "${1}"
  menu
}

pause_error() {
  read -rp "$(echo_red "${1}")"
  menu
}

pause_success() {
  read -rp "$(echo_green "${1}")"
  menu
}

exit_error() {
  read -rp "$(echo_red "${1}")"
  exit 1
}

exit_success() {
  read -rp "$(echo_green "${1}")"
  exit 0
}

# ------------------------------------------------------------------------------
# Show message in colors
#
# param: message
# examples: echo_green "Pacote instalado com sucesso"
# ------------------------------------------------------------------------------

echo_red() {
  local message="${1}"
  local red="\033[0;31m"
  local color_off="\033[0m"
  echo -e "${red}${message}${color_off}"
}

echo_green() {
  local message="${1}"
  local green="\033[0;32m"
  local color_off="\033[0m"
  echo -e "${green}${message}${color_off}"
}

menu $1
