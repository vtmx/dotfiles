#!/bin/sh

echo Update init.vim...
cp ~/.config/nvim/init.vim ~/Dev/dotfiles

echo Update .zshrc...
cp ~/.zshrc ~/Dev/dotfiles

echo update .tmux.conf...
cp ~/.tmux.conf ~/Dev/dotfiles
