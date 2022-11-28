#!/usr/bin/env bash

if ! cmus-remote -C >/dev/null 2>&1 ; then
  echo >&2 "cmus is not running"
  exit 1
fi

ls $HOME/Music/* -d | fzf
