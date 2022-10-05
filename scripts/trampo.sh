#!/usr/bin/env bash

clear
echo
echo "---------------------------------"
echo " Dotfiles - Vitor Melo"
echo "---------------------------------"
echo

if [[ -e dotfiles ]]; then
  rm -rdf dotfiles
fi

git clone https://github.com/vtmx/dotfiles.git

if [[ $? -ne 0 ]]; then
  exit 1
fi


echo "Copying 'dotfiles'..."
cp -f dotfiles/config/fish/config.fish $HOME/.config/fish
cp -f dotfiles/config/kitty/kitty.conf $HOME/.config/kitty
cp -f dotfiles/config/vscode/*.* $HOME/.config/Code/User
cp -rf dotfiles/config/nvim $HOME/.config

rm -rdf dotfiles
