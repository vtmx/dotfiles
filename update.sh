#!/bin/sh

# dist dir
dist=~/Dev/dotfiles

echo update alacritty...
cp ~/.config/alacritty/alacritty.yml $dist

echo update batcat...
cp ~/.config/bat/config $dist

echo update fish...
cp ~/.config/fish/config.fish $dist

echo Update nvim...
cp ~/.config/nvim/init.vim $dist

echo update rofi...
cp ~/.config/rofi/config.rasi $dist

echo update kde...
cp ~/.config/kglobalshortcutsrc $dist
cp ~/.config/khotkeysrc $dist
cp ~/.config/kwinrc $dist
cp ~/.local/share/konsole/konsole.colorscheme $dist
cp ~/.local/share/color-schemes/kde.colors $dist

echo update sxhkd...
cp ~/.config/sxhkd/sxhkdrc $dist

echo update tmux...
cp ~/.tmux.conf $dist

echo Update zshrc...
cp ~/.zshrc $dist
