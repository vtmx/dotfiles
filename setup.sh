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
 c. Clone repository
 f. Copy fonts 
 i. Install packages
 l. Create simbolic links
 s. Copy scripts
 q. Exit

Option: " option
  echo ""

  case "${option}" in
    c|C) clone_repository ;;
    i|I) install_packages ;;
    f|F) copy_fonts       ;;
    l|L) create_links     ;;
    s|S) copy_scripts     ;;
    q|Q) exit 0           ;;
    *) pause_error "Invalid option" ;;
  esac
}

clone_repository() {
  local dir=$HOME/Dev/dotfiles
  [[ ! -d $dir ]] && mkdir -p $dir
  git clone git@github.com:vtmx/dotfiles.git $dir
}

copy_fonts() {
  echo Copying fonts...
  cp -r "${current_dir}/fonts/*" "${HOME}/.local/share/fonts"
  pause_success "Copied"
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

  # If not name
  [[ "$name" ]] && echo "Create link for $name..."

  # Copy dir
  cp -r "$src" "$dist"

  # Create a hard symlink
  ln -sf "$src" "$dist"
}

create_links() {
  local $config_src="$current_dir/config"
  local $config_dist="$HOME/.config/"
   
  # bin
  name="bin"
  target="$current_dir/bin"
  link="$HOME/.local/"
  create_link "$name" "$target" "$link"

  # bash
  name="bash"
  target="$config_src/bash/.*"
  link="$HOME"
  create_link "$name" "$target" "$link"

  # bat
  name="bat"
  target="$config_src/bat"
  link="$config_dist"
  create_link "$name" "$target" "$link"

  # fish
  name="fish"
  target="$config_src/fish"
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
  name="vscode"
  target="$config_src/vscode/*.json"
  link="$config_dist/Code - OSS/User"
  create_link "$name" "$target" "$link"

  target="$config_src/vscode/snippets"
  link="$config_dist/Code - OSS/User/snippets"
  create_link "$name" "$target" "$link"

  pause_success "Links created"
}

# ------------------------------------------------------------------------------
# Pause
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

menu
