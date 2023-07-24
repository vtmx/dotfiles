#!/usr/bin/env bash

mkcd() {
  if [[ -n $1 ]]; then
    mkdir -p "$1" && cd "$1" || exit 1
  else
    echo "error: dirname not exist"
    exit 1
  fi
}

