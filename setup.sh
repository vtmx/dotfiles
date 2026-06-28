#!/usr/bin/env bash

# Current dir
cwd=$(cd $(dirname $0) && pwd)

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
 l. Create simbolic links
 s. Sync
 q. Exit

Option: " option
  echo ""

  case "${option}" in
    b|b) copy_bin         ;;
    c|C) clone_repository ;;
    i|I) install_packages ;;
    f|F) copy_fonts       ;;
    l|L) create_links     ;;
    s|S) sync             ;;
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
  if cp -r "$cwd/bin/"* $bindir; then
    pause_success "Bin copied"
  else
    pause_error "Bin not copied"
  fi
}

copy_fonts() {
  fontdir=${HOME}/.local/share/fonts
  [[ ! -d $fontdir ]] && echo Create font dir...; mkdir -p $fontdir
  echo Copying fonts...
  if cp -r "$cwd/fonts/"* $fontdir; then
    pause_success "Fonts copied"
  else
    pause_error "Fonts not copied"
  fi
}

# Links need the complete path
create_link() {
  local name=$1
  local src="$cwd/config"
  local dst="$HOME/.config/"

  [[ $name ]] && echo "Create link for $name..."
  ln -sfi "$src/$name" "$dst/$name"
}

create_links() {
  # bash
  name='bash'
  ln -sf $cwd/config/bash/bashrc $HOME/.bashrc
  create_link "$name"

  # bat
  name='bat'
  create_link "$name"

  # btop
  name='btop'
  create_link "$name"

  # flameshot
  name='flameshot'
  create_link "$name"

  # kitty
  name='kitty'
  create_link "$name"

  # mpv
  name='mpv'
  create_link "$name"

  # nvim
  name='nvim'
  create_link "$name"

  # tmux
  name='tmux'
  create_link "$name"

  pause_success "Links created"
}

makesync() {
  local name="$1"
  local url="$2"
  local dst="$3"

  echo "Sync $1..."
  if ! wget -q $url -O "$dst"; then
    pause_error "Fail sync $1"
  fi
}

sync() {
  local name
  local dst
  local confdir="$HOME/.config/"
  local url="https://raw.githubusercontent.com/vtmx/dotfiles/main/config"

  # bspwm
  name="bspwm"
  dst="$confdir/bspwm"
  url="$url/bspwm/bspwmrc"
  makesync "$name" "$url" "$dst"

  # kitty
  name="kitty"
  dst="$confdir/kitty"
  url="$url/kitty/kitty.conf"
  makesync "$name" "$url" "$dst"

  # nvim
  name="nvim autocmds"
  dst="$confdir/nvim/lua/config"
  url="$url/nvim/lua/config/autocmds.lua"
  makesync "$name" "$url" "$dst"
  name="nvim colors"
  url="$url/nvim/lua/config/colors.lua"
  makesync "$name" "$url" "$dst"
  name="nvim keymaps"
  url="$url/nvim/lua/config/keymaps.lua"
  makesync "$name" "$url" "$dst"
  name="nvim options"
  url="$url/nvim/lua/config/options.lua"
  makesync "$name" "$url" "$dst"
  name="nvim theme"
  url="$url/nvim/lua/config/theme.lua"
  makesync "$name" "$url" "$dst"
  name="nvim utils"
  url="$url/nvim/lua/config/utils.lua"
  makesync "$name" "$url" "$dst"

  pause_success "Sync maked"
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
