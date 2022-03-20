#!/bin/sh

cd $HOME/Downloads
sudo pacman -S base-devel git
sudo git clone https://aur.archlinux.org/yay.git 
cd yay
makepkg -si

