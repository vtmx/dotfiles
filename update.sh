#!/bin/sh

# dist dir
dist=$HOME/Dev/dotfiles

echo '' 

echo Update alacritty...
cp -rf $HOME/.config/alacritty $dist/config

echo Update batcat...
cp -rf $HOME/.config/bat $dist/config

echo Update fish...
cp -rf $HOME/.config/fish $dist/config

echo Update flameshot...
cp -rf $HOME/.config/flameshot $dist/config

echo Update git...
cp $HOME/.gitconfig $dist

echo Update kde...
cp $HOME/.config/kglobalshortcutsrc $dist/kde
cp $HOME/.config/khotkeysrc $dist/kde
cp $HOME/.config/kwinrc $dist/kde
cp $HOME/.local/share/konsole/konsole.colorscheme $dist/kde
cp $HOME/.local/share/konsole/konsole.profile $dist/kde
cp $HOME/.local/share/color-schemes/kde.colors $dist/kde

echo Update nvim...
cp -rf $HOME/.config/nvim $dist/config

echo Update nvimscript...
cp $HOME/.config/nvimscript/*.vim $dist/config/nvimscript
cp $HOME/.config/nvimscript/*.json $dist/config/nvimscript

echo Update opera...
cp $HOME/.config/opera/Bookmarks.bak $dist/config/opera

echo Update rofi...
cp -rf $HOME/.config/rofi $dist/config

echo Update sublime text...
cp $HOME/.config/sublime-text-3/Packages/User/* $dist/config/sublime-text-3/Packages/User

echo Update sxhkd...
cp -rf $HOME/.config/sxhkd $dist/config

echo Update tmux...
cp $HOME/.tmux.conf $dist

echo Update vscode...
cp $HOME/.config/Code/User/keybindings.json $dist/config/Code/User/
cp $HOME/.config/Code/User/settings.json $dist/config/Code/User/
cp $HOME/.config/Code/User/syncLocalSettings.json $dist/config/Code/User/

echo Update zsh...
cp $HOME/.zshrc $dist
