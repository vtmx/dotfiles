#!/bin/sh

# Dir
CURRENT_DIR=$(cd $(dirname $0) && pwd)
SRC_DIR="$CURRENT_DIR/config"
HOME_DIR="$HOME"
CONFIG_DIR="$HOME/.config"

menu(){
	echo ""
	echo "---------------------------------------------------------------------------------"
	echo " Dotfiles - Vitor Melo"
	echo "---------------------------------------------------------------------------------"
	echo ""
	echo "f. Fonts copy"
	echo "i. Install packages"
	echo "l. Links create"
	echo "e. Exit"
	echo ""
	echo -en "Option: "
	read -n 1 option
	echo ""
	echo ""

	case $option in
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
			break
		;;
	esac
}

return_menu() {
	echo ""
	read
	menu
}

copy_fonts() {
	echo Copy fonts...
	cp -R "$CURRENT_DIR/fonts/IBM Blex Mono" "$HOME/.fonts"
	cp -R "$CURRENT_DIR/fonts/IBM Plex Mono" "$HOME/.fonts"
	cp -R "$CURRENT_DIR/fonts/Segoe UI" "$HOME/.fonts"
	echo "Copied"
	return_menu
}

install_packages() {
	echo "Install packages..."
	echo "Installed"
	return_menu
}

create_link() {
	local name=$1
	local src=$2
	local dist=$3

	# if folder not exist create folder
	if [ ! -d "$dist" ]; then
		mkdir -p "$dist"
	fi

	# if not name
	if [ ! -z "$name" ]; then
		echo "Create link for $name..."
	fi

	# make a hard link
	ln -f "$src" "$dist"
}

create_links() {

	# ----------------------------------------------------------
	# alacritty
	# ----------------------------------------------------------
	name="alacritty"
	target="$SRC_DIR/alacritty/alacritty.yml"
	link="$CONFIG_DIR/alacritty"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# bat
	# ----------------------------------------------------------
	name="bat"
	target="$SRC_DIR/bat/config"
	link="$CONFIG_DIR/bat"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# bspwm
	# ----------------------------------------------------------
	name="bspwm"
	target="$SRC_DIR/bspwm/bspwmrc"
	link="$CONFIG_DIR/bspwm"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# btop
	# ----------------------------------------------------------
	name="btop"
	target="$SRC_DIR/btop/btop.conf"
	link="$CONFIG_DIR/btop"
	create_link "$name" "$target" "$link"

	name=""
	target="$SRC_DIR/btop/btop.conf"
	link="$CONFIG_DIR/btop/themes"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# cmus
	# ----------------------------------------------------------
	name="cmus"
	target="$SRC_DIR/cmus/onedarkv.theme"
	link="$CONFIG_DIR/cmus"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# fish
	# ----------------------------------------------------------
	name="fish"
	target="$SRC_DIR/fish/config.fish"
	link="$CONFIG_DIR/fish"
	create_link "$name" "$target" "$link"

	name="fish_variables"
	target="$SRC_DIR/fish/fish_variables"
	link="$CONFIG_DIR/fish"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# flameshot
	# ----------------------------------------------------------
	name="flameshot"
	target="$SRC_DIR/flameshot/flameshot.ini"
	link="$CONFIG_DIR/flameshot"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# git
	# ----------------------------------------------------------
	name="git"
	target="$SRC_DIR/.gitconfig"
	link="$HOME_DIR"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# kitty
	# ----------------------------------------------------------
	name="kitty"
	target="$SRC_DIR/kitty/kitty.conf"
	link="$CONFIG_DIR/kitty"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# neofetch
	# ----------------------------------------------------------
	name="neofetch"
	target="$SRC_DIR/neofetch/config.conf"
	link="$CONFIG_DIR/neofetch"
	create_link "$name" "$target" "$link"

	name=""
	target="$SRC_DIR/neofetch/logo.txt"
	link="$CONFIG_DIR/neofetch"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# nvim
	# ----------------------------------------------------------
	name="nvim"
	target="$SRC_DIR/nvim/init.lua"
	link="$CONFIG_DIR/nvim"
	create_link "$name" "$target" "$link"

	name=""
	target="$SRC_DIR/nvim/coc-settings.json"
	link="$CONFIG_DIR/nvim"
	create_link "$name" "$target" "$link"

	name=""
	target="$SRC_DIR/nvim/lua/colors.lua"
	link="$CONFIG_DIR/nvim/lua"
	create_link "$name" "$target" "$link"

	name=""
	target="$SRC_DIR/nvim/lua/mappings.lua"
	link="$CONFIG_DIR/nvim/lua"
	create_link "$name" "$target" "$link"

	name=""
	target="$SRC_DIR/nvim/lua/settings.lua"
	link="$CONFIG_DIR/nvim/lua"
	create_link "$name" "$target" "$link"

	name=""
	target="$SRC_DIR/nvim/lua/plugins.lua"
	link="$CONFIG_DIR/nvim/lua"
	create_link "$name" "$target" "$link"

	name=""
	target="$SRC_DIR/nvim/lua/theme.lua"
	link="$CONFIG_DIR/nvim/lua"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# rofi
	# ----------------------------------------------------------
	name="rofi"
	target="$SRC_DIR/rofi/config.rasi"
	link="$CONFIG_DIR/rofi"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# sxhkd
	# ----------------------------------------------------------
	name="sxhkd"
	target="$SRC_DIR/sxhkd/sxhkdrc"
	link="$CONFIG_DIR/sxhkd"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# tmux
	# ----------------------------------------------------------
	name="tmux"
	target="$SRC_DIR/.tmux.conf"
	link="$HOME_DIR/"
	create_link "$name" "$target" "$link"

	# ----------------------------------------------------------
	# vscode
	# ----------------------------------------------------------
	name="vscode"
	target="$SRC_DIR/vscode/keybindings.json"
	link="$CONFIG_DIR/Code - OSS/User"
	create_link "$name" "$target" "$link"

	name=""
	target="$SRC_DIR/vscode/settings.json"
	link="$CONFIG_DIR/Code - OSS/User"
	create_link "$name" "$target" "$link"

	echo "Links created"
	menu
}

menu
