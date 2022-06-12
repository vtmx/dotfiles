#!/usr/bin/env bash

# try to get a list of PIDs for conky
running_conky=$(pgrep -a conky)

# if not exist
if [[ -z "$running_conky" ]]; then
  conky &
else
  killall conky
fi