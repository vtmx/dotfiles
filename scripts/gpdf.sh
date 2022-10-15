#!/usr/bin/env bash

echo
read -rp "Message: " message

cd ~/Dev/dotfiles
git add --all
git commit -m "${message}"
git push
