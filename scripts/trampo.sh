#!/usr/bin/env bash

clear
echo
echo "---------------------------------------------------------------------------------"
echo " Dotfiles - Vitor Melo"
echo "---------------------------------------------------------------------------------"
echo

git clone https://github.com/vtmx/dotfiles.git
cd dotfiles

# fish
cp -f config/fish/config.fish $HOME/.config/fish

# kitty
cp -f config/kitty/kitty.conf $HOME/.config/kitty

# code
cp -f config/vscode/*.* $HOME/.config/Code/User

# nvim
cp -rf config/nvim $HOME/.config

