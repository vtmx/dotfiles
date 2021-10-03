#!/bin/sh

# dist dir
dist=$HOME/Dev/dotfiles

echo update alacritty...
cp $HOME/.config/alacritty/alacritty.yml $dist

echo update batcat...
cp $HOME/.config/bat/config $dist

echo update fish...
cp $HOME/.config/fish/config.fish $dist

echo Update nvim...
cp $HOME/.config/nvim/init.vim $dist

echo update kde...
cp $HOME/.config/kglobalshortcutsrc $dist
cp $HOME/.config/khotkeysrc $dist
cp $HOME/.config/kwinrc $dist
cp $HOME/.local/share/konsole/konsole.colorscheme $dist
cp $HOME/.local/share/color-schemes/kde.colors $dist

echo update tmux...
cp $HOME/.tmux.conf $dist

echo update rofi...
cp $HOME/.config/rofi/config.rasi $dist
