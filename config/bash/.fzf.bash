# Setup fzf
# ---------
if [[ ! "$PATH" == */home/vitor/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/vitor/.fzf/bin"
fi

eval "$(fzf --bash)"
