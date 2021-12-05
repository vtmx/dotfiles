#!/bin/sh
echo '' 

# dist dir
DIST=$HOME/Dev/dotfiles/config

update_file() {
	file_name=$1
	file_src=$2
	file_dist=$3
	path_dist=$4

	if ! cmp -s $file_src $file_dist; then
		echo "Update $file_name..."
		cp -f $file_src $path_dist
	fi
}

file_name="alacritty"
file_src="$HOME/.config/alacritty/alacritty.yml"
file_dist="$DIST/alacritty/alacritty.yml"
path_dist="$DIST/alacritty"
update_file $file_name $file_src $file_dist $path_dist
#
# file_name="batcat"
# file_src="$HOME/.config/bat/config"
# file_dist="$DIST/config/bat/config"
# update_file $file_name $file_src $file_dist
#
# file_name="bspwm"
# file_src="$HOME/.config/bspwm/bspwmrc"
# file_dist="$DIST/config/bspwm/bspwmrc"
# update_file $file_name $file_src $file_dist
#
# file_name="fish"
# file_src="$HOME/.config/fish/config.fish"
# file_dist="$DIST/config/fish/config.fish"
# update_file $file_name $file_src $file_dist
#
# file_name="fish_variables"
# file_src="$HOME/.config/fish/fish_variables"
# file_dist="$DIST/config/fish/fish_variables"
# update_file $file_name $file_src $file_dist
#
# file_name="flameshot"
# file_src="$HOME/.config/flameshot/flameshot.ini"
# file_dist="$DIST/config/flameshot/flameshot.ini"
# update_file $file_name $file_src $file_dist
#
# file_name="git"
# file_src="$HOME/.gitconfig"
# file_dist="$DIST/.gitconfig"
# update_file $file_name $file_src $file_dist
#
# file_name="kde_globalshortcut"
# file_src="$HOME/.config/kglobalshortcutsrc"
# file_dist="$DIST/config/kde/kglobalshortcutsrc"
# update_file $file_name $file_src $file_dist
#
# file_name="kde_colors"
# file_src="$HOME/.local/share/color-schemes/kde.colors"
# file_dist="$DIST/config/kde/kde.colors"
# update_file $file_name $file_src $file_dist
#
# file_name="kde_khotkeysrc"
# file_src="$HOME/.config/khotkeysrc"
# file_dist="$DIST/config/kde/khotkeysrc"
# update_file $file_name $file_src $file_dist
#
# file_name="kde_konsole_colorscheme"
# file_src="$HOME/.local/share/konsole/konsole.colorscheme"
# file_dist="$DIST/config/kde/konsole.colorscheme"
# update_file $file_name $file_src $file_dist
#
# file_name="kde_konsole_profiles"
# file_src="$HOME/.local/share/konsole/konsole.profile"
# file_dist="$DIST/config/kde/konsole.profile"
# update_file $file_name $file_src $file_dist
#
# file_name="kde_kwinrc"
# file_src="$HOME/.config/kwinrc"
# file_dist="$DIST/config/kde/kwinrc"
# update_file $file_name $file_src $file_dist
#
# echo Update nvim...
# cp -rf $HOME/.config/nvim $DIST/config
#
# echo Update nvimscript...
# cp $HOME/.config/nvimscript/*.vim $DIST/config/nvimscript
# cp $HOME/.config/nvimscript/*.json $DIST/config/nvimscript
#
# file_name="opera"
# file_src="$HOME/.config/opera/Bookmarks.bak"
# file_dist="$DIST/config/opera/Bookmarks"
# update_file $file_name $file_src $file_dist
#
# file_name="rofi"
# file_src="$HOME/.config/rofi/config.rasi"
# file_dist="$DIST/config/rofi/config.rasi"
# update_file $file_name $file_src $file_dist
#
# file_name="sublime_text_settings"
# file_src="$HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings"
# file_dist="$DIST/config/sublime-text/Preferences.sublime-settings"
# update_file $file_name $file_src $file_dist
#
# file_name="sublime_text_package control"
# file_src="$HOME/.config/sublime-text-3/Packages/User/Package Control.sublime-settings"
# file_dist="$DIST/config/sublime-text/Package Control.sublime-settings"
# path_dist="$DIST/config/sublime-text"
# update_file "${file_name}" ${file_src} ${file_dist} ${path_dist}
#
# file_name="sxhkd"
# file_src="$HOME/.config/sxhkd/sxhkdrc"
# file_dist="$DIST/config/sxhkd/sxhkdrc"
# update_file $file_name $file_src $file_dist
#
# file_name="tmux"
# file_src="$HOME/.tmux.conf"
# file_dist="$DIST/.tmux.conf"
# update_file $file_name $file_src $file_dist
#
# file_name="vscode_keybinds"
# file_src="$HOME/.config/Code/User/keybindings.json"
# file_dist="$DIST/config/vscode/keybindings.json"
# update_file $file_name $file_src $file_dist
#
# file_name="vscode_settings"
# file_src="$HOME/.config/Code/User/settings.json"
# file_dist="$DIST/config/vscode/settings.json"
# update_file $file_name $file_src $file_dist
#
# file_name="vscode_sync_local_settings"
# file_src="$HOME/.config/Code/User/syncLocalSettings.json"
# file_dist="$DIST/config/vscode/syncLocalSettings.json"
# update_file $file_name $file_src $file_dist
#
# file_name="zsh"
# file_src="$HOME/.zshrc"
# file_dist="$DIST/.zshrc"
# update_file $file_name $file_src $file_dist
