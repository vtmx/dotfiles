#!/usr/bin/env bash

cd $HOME/Downloads
sudo pacman -S base-devel git
git clone https://aur.archlinux.org/yay.git 
cd yay
makepkg -si

