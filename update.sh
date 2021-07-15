#!/bin/sh

# dist dir
dist=~/Dev/dotfiles

echo Update nvim...
cp ~/.config/nvim/init.vim $dist

echo Update zshrc...
cp ~/.zshrc $dist

echo update tmux...
cp ~/.tmux.conf $dist

echo update batcat...
cp ~/.config/bat/config $dist

echo update fish...
cp ~/.config/fish/config.fish $dist

echo update alacritty...
cp ~/.config/alacritty/alacritty.yml $dist

echo update konsole
cp ~/.local/share/konsole/konsole.colorscheme $dist

echo update kde colors
cp ~/.local/share/color-schemes/kde.colors $dist
