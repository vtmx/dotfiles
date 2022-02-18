#!/bin/sh
# https://www.freecodecamp.org/news/build-your-own-dotfiles-manager-from-scratch/
echo '' 

# menu
# manage() {
# 	while :
# 	do
# 		echo -e "\n[1] Show diff"
# 		echo -e "[2] Push changed dotfiles to remote"
# 		echo -e "[3] Pull latest changes from remote"
# 		echo -e "[4] List all dotfiles"
# 		echo -e "[q/Q] Quit Session"
# 		# Default choice is [1]
# 		read -p "What do you want me to do ? [1]: " -n 1 -r USER_INPUT
# 		# See Parameter Expansion
# 		USER_INPUT=${USER_INPUT:-1}
# 		case $USER_INPUT in
# 			[1]* ) show_diff_check;;
# 			[2]* ) dot_push;;
# 			[3]* ) dot_pull;;
# 			[4]* ) find_dotfiles;;
# 			[q/Q]* ) exit;;
# 			* )     printf "\n%s\n" "Invalid Input, Try Again";;
# 		esac
# 	done
# }

# dist dir
DIST=$(cd $(dirname $0) && pwd)

update_file() {
	local name=$1
	local src=$2
	local dist=$3
	local path=$4

	# get result of comparation
	cmp -s "$src" "$dist"
	status=$?

	# if file is edit
	if [ $status != 0 ]; then
		echo "Update $name..."
		cp -f "$src" "$path"
	fi
}

name="alacritty"
src="$HOME/.config/alacritty/alacritty.yml"
dist="$DIST/alacritty/alacritty.yml"
path="$DIST/alacritty"
update_file "$name" "$src" "$dist" "$path"

name="batcat"
src="$HOME/.config/bat/config"
dist="$DIST/bat/config"
path="$DIST/bat"
update_file "$name" "$src" "$dist" "$path"

name="bspwm"
src="$HOME/.config/bspwm/bspwmrc"
dist="$DIST/bspwm/bspwmrc"
path="$DIST/config/bspwm"
update_file "$name" "$src" "$dist" "$path"

name="fish"
src="$HOME/.config/fish/config.fish"
dist="$DIST/fish/config.fish"
path="$DIST/fish"
update_file "$name" "$src" "$dist" "$path"

name="fish_variables"
src="$HOME/.config/fish/fish_variables"
dist="$DIST/fish/fish_variables"
path="$DIST/fish"
update_file "$name" "$src" "$dist" "$path"

name="flameshot"
src="$HOME/.config/flameshot/flameshot.ini"
dist="$DIST/flameshot/flameshot.ini"
path="$DIST/flameshot"
update_file "$name" "$src" "$dist" "$path"

name="git"
src="$HOME/.gitconfig"
dist="$DIST/.gitconfig"
path="$DIST"
update_file "$name" "$src" "$dist" "$path"

name="kde globalshortcut"
src="$HOME/.config/kglobalshortcutsrc"
dist="$DIST/kde/kglobalshortcutsrc"
path="$DIST/kde"
update_file "$name" "$src" "$dist" "$path"

name="kde colors"
src="$HOME/.local/share/color-schemes/kde.colors"
dist="$DIST/kde/kde.colors"
path="$DIST/kde"
update_file "$name" "$src" "$dist" "$path"

name="kde khotkeysrc"
src="$HOME/.config/khotkeysrc"
dist="$DIST/kde/khotkeysrc"
path="$DIST/kde"
update_file "$name" "$src" "$dist" "$path"

name="kde konsole colorscheme"
src="$HOME/.local/share/konsole/konsole.colorscheme"
dist="$DIST/kde/konsole.colorscheme"
path="$DIST/kde"
update_file "$name" "$src" "$dist" "$path"

name="kde konsole profiles"
src="$HOME/.local/share/konsole/konsole.profile"
dist="$DIST/kde/konsole.profile"
path="$DIST/kde"
update_file "$name" "$src" "$dist" "$path"

name="kde kwinrc"
src="$HOME/.config/kwinrc"
dist="$DIST/kde/kwinrc"
path="$DIST/kde"
update_file "$name" "$src" "$dist" "$path"

name="kitty"
src="$HOME/.config/kitty/kitty.conf"
dist="$DIST/kitty/kitty.conf"
path="$DIST/kitty"
update_file "$name" "$src" "$dist" "$path"

name="neofetch"
src="$HOME/.config/neofetch/config.conf"
dist="$DIST/neofetch/config.conf"
path="$DIST/neofetch"
update_file "$name" "$src" "$dist" "$path"

name="neofetch logo"
src="$HOME/.config/neofetch/logo.txt"
dist="$DIST/neofetch/logo.txt"
path="$DIST/neofetch"
update_file "$name" "$src" "$dist" "$path"

name="opera"
src="$HOME/.config/opera/Bookmarks"
dist="$DIST/opera/Bookmarks"
path="$DIST/opera"
update_file "$name" "$src" "$dist" "$path"

name="rofi"
src="$HOME/.config/rofi/config.rasi"
dist="$DIST/rofi/config.rasi"
path="$DIST/rofi"
update_file "$name" "$src" "$dist" "$path"

name="sublime text settings"
src="$HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings"
dist="$DIST/sublime-text/Preferences.sublime-settings"
path="$DIST/sublime-text"
update_file "$name" $src $dist $path

name="sublime text package control"
src="$HOME/.config/sublime-text-3/Packages/User/Package Control.sublime-settings"
dist="$DIST/sublime-text/Package Control.sublime-settings"
path="$DIST/sublime-text"
update_file "$name" "$src" "$dist" "$path"

name="sxhkd"
src="$HOME/.config/sxhkd/sxhkdrc"
dist="$DIST/sxhkd/sxhkdrc"
path="$DIST/sxhkd"
update_file "$name" "$src" "$dist" "$path"

name="tmux"
src="$HOME/.tmux.conf"
dist="$DIST/.tmux.conf"
path="$DIST"
update_file $name $src $dist $path

name="vscode keybinds"
src="$HOME/.config/Code - OSS/User/keybindings.json"
dist="$DIST/vscode/keybindings.json"
path="$DIST/vscode"
update_file "$name" "$src" "$dist" "$path"

name="vscode settings"
src="$HOME/.config/Code - OSS/User/settings.json"
dist="$DIST/vscode/settings.json"
path="$DIST/vscode"
update_file "$name" "$src" "$dist" "$path"

name="zsh"
src="$HOME/.zshrc"
dist="$DIST/.zshrc"
path="$DIST"
update_file "$name" "$src" "$dist" "$path"

echo Update nvim...
cp -rf $HOME/.config/nvim $DIST

echo Update nvimscript...
cp $HOME/.config/nvimscript/*.vim $DIST/nvimscript
cp $HOME/.config/nvimscript/*.json $DIST/nvimscript

