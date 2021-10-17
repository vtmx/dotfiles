#!/bin/sh

# dist dir
dist=$HOME/Dev/dotfiles

echo '' 

echo Update alacritty...
cp $HOME/.config/alacritty/alacritty.yml $dist/.config/alacritty

echo Update batcat...
cp $HOME/.config/bat/config $dist/.config/bat

echo Update fish...
cp $HOME/.config/fish/config.fish $dist/.config/fish

echo Update flameshot...
cp $HOME/.config/flameshot/flameshot.ini $dist/.config/flameshot

echo Update git...
cp $HOME/.gitconfig $dist

echo Update kde...
cp $HOME/.config/kglobalshortcutsrc $dist/kde
cp $HOME/.config/khotkeysrc $dist/kde
cp $HOME/.config/kwinrc $dist/kde
cp $HOME/.local/share/konsole/konsole.colorscheme $dist/kde
cp $HOME/.local/share/color-schemes/kde.colors $dist/kde

echo Update nvim...
cp $HOME/.config/nvim/*.vim $dist/.config/nvim
cp $HOME/.config/nvim/coc-settings.json $dist/.config/nvim

echo Update opera...
cp $HOME/.config/opera/Bookmarks.bak $dist/.config/opera

echo Update rofi...
cp $HOME/.config/rofi/config.rasi $dist/.config/rofi

echo Update sublime text...
cp $HOME/.config/sublime-text-3/Packages/User/* $dist/.config/sublime-text-3/Packages/User

echo Update sxhkd...
cp $HOME/.config/sxhkd/sxhkdrc $dist/.config/sxhkdrc

echo Update tmux...
cp $HOME/.tmux.conf $dist

echo Update vscode...
cp $HOME/.config/Code/User/keybindings.json $dist/.config/Code/User/
cp $HOME/.config/Code/User/settings.json $dist/.config/Code/User/
cp $HOME/.config/Code/User/syncLocalSettings.json $dist/.config/Code/User/

echo Update zsh...
cp $HOME/.zshrc $dist
