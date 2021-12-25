#!/bin/sh
echo '' 

# dist dir
DIST=$HOME/Dev/dotfiles/config

update_file() {
	name=$1
	src=$2
	dist=$3
	path=$4

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

echo Update nvim...
cp -rf $HOME/.config/nvim $DIST/nvim

echo Update nvimscript...
cp $HOME/.config/nvimscript/*.vim $DIST/nvimscript
cp $HOME/.config/nvimscript/*.json $DIST/nvimscript

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
src="$HOME/.config/Code/User/keybindings.json"
dist="$DIST/vscode/keybindings.json"
path="$DIST/vscode"
update_file "$name" "$src" "$dist" "$path"

name="vscode settings"
src="$HOME/.config/Code/User/settings.json"
dist="$DIST/vscode/settings.json"
path="$DIST/vscode"
update_file "$name" "$src" "$dist" "$path"

name="zsh"
src="$HOME/.zshrc"
dist="$DIST/.zshrc"
path="$DIST"
update_file "$name" "$src" "$dist" "$path"
