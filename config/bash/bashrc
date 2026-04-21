# Check interative shell
[[ $- != *i* ]] && return

# Load auto-completion
if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi
fi

# Load config
if [[ -d $HOME/.config/bash ]]; then
  source "$HOME/.config/bash/opts"
  source "$HOME/.config/bash/envs"
  source "$HOME/.config/bash/aliases"
  source "$HOME/.config/bash/functions"
  source "$HOME/.config/bash/pkgs"
  [[ $- == *i* ]] && bind -f $HOME/.config/bash/inputs
fi

# vim:ft=bash
