#!/usr/bin/env bash

# Dir
current_dir=$(cd $(dirname $0) && pwd)
src_dir="$current_dir/config"
config_dir="$HOME/.config"

menu() {
  clear
  echo "
 _    _ _____ _______  _____   ______ _______ _______         _____ 
  \  /    |      |    |     | |_____/ |  |  | |______ |      |     |
   \/   __|__    |    |_____| |    \_ |  |  | |______ |_____ |_____|"

  read -rp "
 f. Copy fonts 
 i. Install packages
 l. Create simbolic links
 s. Copy scripts
 q. Exit

Option: " option
  echo ""

  case "${option}" in
    f|F) copy_fonts       ;;
    i|I) install_packages ;;
    l|L) create_links     ;;
    s|S) copy_scripts     ;;
    q|Q) exit 0           ;;
    *) pause_error "Invalid option" ;;
  esac
}

copy_fonts() {
  local src_dir="${current_dir}/fonts"
  local dist_dir="${HOME}/.fonts"

  echo Copying fonts...
  cp -R "${src_dir}/BlexMono Nerdfonts" "${dist_dir}"
  cp -R "${src_dir}/IBM Plex Mono" "${dist_dir}"
  cp -R "${src_dir}/Segoe UI" "${dist_dir}"

  pause_success "Copied"
}

install_packages() {
  echo "Install packages..."
  pause_success "Installed"
}

create_link() {
  local name=$1
  local src=$2
  local dist=$3

  # if folder not exist create folder
  if [[ ! -d "$dist" ]]; then
    mkdir -p "$dist"
  fi

  # if not name
  if [[ -n "$name" ]]; then
    echo "Create link for $name..."
  fi

  # make a hard link
  ln -f "$src" "$dist"
}

create_links() {
  # bat
  name="bat"
  target="$src_dir/bat/config"
  link="$config_dir/bat"
  create_link "$name" "$target" "$link"

  # btop
  name="btop"
  target="$src_dir/btop/btop.conf"
  link="$config_dir/btop"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/btop/btop.conf"
  link="$config_dir/btop/themes"
  create_link "$name" "$target" "$link"

  # cmus
  name="cmus"
  target="$src_dir/cmus/rc"
  link="$config_dir/cmus"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/cmus/onedarkv.theme"
  link="$config_dir/cmus"
  create_link "$name" "$target" "$link"

  # conky
  name="conky"
  target="$src_dir/conky/conky.conf"
  link="$config_dir/conky"
  create_link "$name" "$target" "$link"

  # fish
  name="fish"
  target="$src_dir/fish/config.fish"
  link="$config_dir/fish"
  create_link "$name" "$target" "$link"

  name="fish_variables"
  target="$src_dir/fish/fish_variables"
  link="$config_dir/fish"
  create_link "$name" "$target" "$link"

  # flameshot
  name="flameshot"
  target="$src_dir/flameshot/flameshot.ini"
  link="$config_dir/flameshot"
  create_link "$name" "$target" "$link"

  # git
  name="git"
  target="$src_dir/git/gitconfig"
  link="$HOME/.gitconfig"
  create_link "$name" "$target" "$link"

  # kitty
  name="kitty"
  target="$src_dir/kitty/kitty.conf"
  link="$config_dir/kitty"
  create_link "$name" "$target" "$link"

  # neofetch
  name="neofetch"
  target="$src_dir/neofetch/config.conf"
  link="$config_dir/neofetch"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/neofetch/logo.txt"
  link="$config_dir/neofetch"
  create_link "$name" "$target" "$link"

  # mpv
  name="mpv"
  target="$src_dir/mpv/input.conf"
  link="$config_dir/mpv"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/mpv/scripts/nextfile.lua"
  link="$config_dir/mpv/scripts"
  create_link "$name" "$target" "$link"

  # nvim
  name="nvim"
  target="$src_dir/nvim/init.lua"
  link="$config_dir/nvim"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/nvim/coc-settings.json"
  link="$config_dir/nvim"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/nvim/lua/colors.lua"
  link="$config_dir/nvim/lua"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/nvim/lua/mappings.lua"
  link="$config_dir/nvim/lua"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/nvim/lua/options.lua"
  link="$config_dir/nvim/lua"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/nvim/lua/plugins/init.lua"
  link="$config_dir/nvim/lua/plugins"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/nvim/lua/plugins/config.lua"
  link="$config_dir/nvim/lua/plugins"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/nvim/lua/theme.lua"
  link="$config_dir/nvim/lua"
  create_link "$name" "$target" "$link"

  # polybar
  name="polybar"
  target="$src_dir/polybar/config.ini"
  link="$config_dir/polybar"
  create_link "$name" "$target" "$link"

  name="polybar launch"
  target="$src_dir/polybar/launch.sh"
  link="$config_dir/polybar"
  create_link "$name" "$target" "$link"

  # ranger
  name="ranger"
  target="$src_dir/ranger/rc.conf"
  link="$config_dir/ranger"
  create_link "$name" "$target" "$link"

  # rofi
  name="rofi"
  target="$src_dir/rofi/*.rasi"
  link="$config_dir/rofi"
  create_link "$name" "$target" "$link"

  # tmux
  name="tmux"
  target="$src_dir/tmux/tmux.conf"
  link="$HOME/.tmux.conf"
  create_link "$name" "$target" "$link"

  # vscode
  name="vscode"
  target="$src_dir/vscode/keybindings.json"
  link="$config_dir/Code - OSS/User"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/vscode/settings.json"
  link="$config_dir/Code - OSS/User"
  create_link "$name" "$target" "$link"

  pause_success "Links created"
}

# ------------------------------------------------------------------------------
# Copy scrpts
# ------------------------------------------------------------------------------

copy_scripts() {
  cp -rf "${current_dir}/scripts/bin" "${HOME}/.local"
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
