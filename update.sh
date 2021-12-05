#!/bin/sh

# dist dir
dist=$HOME/Dev/dotfiles

echo '' 

echo Update alacritty...
cp -rf $HOME/.config/alacritty $dist/config

echo Update batcat...
cp -rf $HOME/.config/bat $dist/config

echo Update bspwm...
cp -rf $HOME/.config/bspwm $dist/config

echo Update fish...
cp -rf $HOME/.config/fish $dist/config

echo Update flameshot...
cp -rf $HOME/.config/flameshot $dist/config

echo Update kde...
cp $HOME/.config/kglobalshortcutsrc $dist/config/kde
cp $HOME/.config/khotkeysrc $dist/config/kde
cp $HOME/.config/kwinrc $dist/config/kde
cp $HOME/.local/share/konsole/konsole.colorscheme $dist/config/kde
cp $HOME/.local/share/konsole/konsole.profile $dist/config/kde
cp $HOME/.local/share/color-schemes/kde.colors $dist/config/kde

echo Update nvim...
cp -rf $HOME/.config/nvim $dist/config

echo Update nvimscript...
cp $HOME/.config/nvimscript/*.vim $dist/config/nvimscript
cp $HOME/.config/nvimscript/*.json $dist/config/nvimscript

echo Update opera...
cp $HOME/.config/opera/Bookmarks $dist/config/opera

echo Update rofi...
cp -rf $HOME/.config/rofi $dist/config

echo Update sublime text...
cp $HOME/.config/sublime-text-3/Packages/User/* $dist/config/sublime-text

echo Update sxhkd...
cp -rf $HOME/.config/sxhkd $dist/config

echo Update tmux...
cp $HOME/.tmux.conf $dist/config

echo Update vscode...
cp $HOME/.config/Code/User/keybindings.json $dist/config/vscode
cp $HOME/.config/Code/User/settings.json $dist/config/vscode
cp $HOME/.config/Code/User/syncLocalSettings.json $dist/config/vscode

echo Update zsh...
cp $HOME/.zshrc $dist/config
