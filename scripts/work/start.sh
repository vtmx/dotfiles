#!/usr/bin/env bash

echo "Atualizando fish..."
wget -qOP "$HOME/.config/fish" "https://raw.githubusercontent.com/vtmx/dotfiles/main/config/fish/config.fish"

echo "Atualizando kitty..."
wget -qOP "$HOME/.config/kitty" "https://raw.githubusercontent.com/vtmx/dotfiles/main/config/kitty/kitty.conf"

echo "Atualizando code..."
wget -qOP "$HOME/.config/Code/User" "https://raw.githubusercontent.com/vtmx/dotfiles/main/config/vscode/keybindings.json"
wget -qOP "$HOME/.config/Code/User" "https://raw.githubusercontent.com/vtmx/dotfiles/main/config/vscode/settings.json"
