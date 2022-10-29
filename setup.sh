#!/usr/bin/env bash

# Dir
current_dir=$(cd $(dirname $0) && pwd)
src_dir="$current_dir/config"
config_dir="$HOME/.config"

menu() {
  clear
  echo
  echo "---------------------------------------------------------------------------------"
  echo " Dotfiles - Vitor Melo"
  echo "---------------------------------------------------------------------------------"
  echo
  echo "f. Fonts copy"
  echo "i. Install packages"
  echo "l. Links create"
  echo "e. Exit"
  echo
  read -rp "Option: " option
  echo

  case "${option}" in
  f)
    copy_fonts
    ;;

  i)
    install_packages
    ;;

  l)
    create_links
    ;;

  e)
    exit 0
    ;;
  *)
    pause "Opção inválida. Pressione qualquer tecla para retornar ao menu."
    menu
    ;;
  esac
}

copy_fonts() {
  echo Copy fonts...
  cp -R "$current_dir/fonts/BlexMono Nerdfonts" "$HOME/.fonts"
  cp -R "$current_dir/fonts/IBM Plex Mono" "$HOME/.fonts"
  cp -R "$current_dir/fonts/Segoe UI" "$HOME/.fonts"
  pause "Copied"
  menu
}

install_packages() {
  echo "Install packages..."
  pause "Installed"
  menu
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

pause() {
  local message=$1
  read -rp "${message}"
}

create_links() {

  # ----------------------------------------------------------
  # alacritty
  # ----------------------------------------------------------
  name="alacritty"
  target="$src_dir/alacritty/alacritty.yml"
  link="$config_dir/alacritty"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # bat
  # ----------------------------------------------------------
  name="bat"
  target="$src_dir/bat/config"
  link="$config_dir/bat"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # bspwm
  # ----------------------------------------------------------
  name="bspwm"
  target="$src_dir/bspwm/bspwmrc"
  link="$config_dir/bspwm"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # btop
  # ----------------------------------------------------------
  name="btop"
  target="$src_dir/btop/btop.conf"
  link="$config_dir/btop"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/btop/btop.conf"
  link="$config_dir/btop/themes"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # cmus
  # ----------------------------------------------------------
  name="cmus"
  target="$src_dir/cmus/onedarkv.theme"
  link="$config_dir/cmus"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # conky
  # ----------------------------------------------------------
  name="conky"
  target="$src_dir/conky/conky.conf"
  link="$config_dir/conky"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # fish
  # ----------------------------------------------------------
  name="fish"
  target="$src_dir/fish/config.fish"
  link="$config_dir/fish"
  create_link "$name" "$target" "$link"

  name="fish_variables"
  target="$src_dir/fish/fish_variables"
  link="$config_dir/fish"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # flameshot
  # ----------------------------------------------------------
  name="flameshot"
  target="$src_dir/flameshot/flameshot.ini"
  link="$config_dir/flameshot"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # git
  # ----------------------------------------------------------
  name="git"
  target="$src_dir/git/gitconfig"
  link="$HOME/.gitconfig"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # kitty
  # ----------------------------------------------------------
  name="kitty"
  target="$src_dir/kitty/kitty.conf"
  link="$config_dir/kitty"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # neofetch
  # ----------------------------------------------------------
  name="neofetch"
  target="$src_dir/neofetch/config.conf"
  link="$config_dir/neofetch"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/neofetch/logo.txt"
  link="$config_dir/neofetch"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # nvim
  # ----------------------------------------------------------
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

  # ----------------------------------------------------------
  # polybar
  # ----------------------------------------------------------
  name="polybar"
  target="$src_dir/polybar/config.ini"
  link="$config_dir/polybar"
  create_link "$name" "$target" "$link"

  name="polybar launch"
  target="$src_dir/polybar/launch.sh"
  link="$config_dir/polybar"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # ranger
  # ----------------------------------------------------------
  name="ranger"
  target="$src_dir/ranger/rc.conf"
  link="$config_dir/ranger"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # rofi
  # ----------------------------------------------------------
  name="rofi"
  target="$src_dir/rofi/config.rasi"
  link="$config_dir/rofi"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # sxhkd
  # ----------------------------------------------------------
  name="sxhkd"
  target="$src_dir/sxhkd/sxhkdrc"
  link="$config_dir/sxhkd"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # tmux
  # ----------------------------------------------------------
  name="tmux"
  target="$src_dir/tmux/tmux.conf"
  link="$HOME/.tmux.conf"
  create_link "$name" "$target" "$link"

  # ----------------------------------------------------------
  # vscode
  # ----------------------------------------------------------
  name="vscode"
  target="$src_dir/vscode/keybindings.json"
  link="$config_dir/Code - OSS/User"
  create_link "$name" "$target" "$link"

  name=""
  target="$src_dir/vscode/settings.json"
  link="$config_dir/Code - OSS/User"
  create_link "$name" "$target" "$link"

  echo "Links created"
  pause "Press any key to continue..."
  menu
}

menu
