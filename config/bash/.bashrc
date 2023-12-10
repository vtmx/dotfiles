# Environment variables
export BROWSER="firefox"
export EDITOR="nvim"
export PATH="$PATH:$HOME/.local/bin"
export CDPATH=".:..:~"

# Colors for man
export LESS_TERMCAP_mb=$'\e[34;1m'            # no-used blue
export LESS_TERMCAP_md=$'\e[34;1m'            # title blue
export LESS_TERMCAP_me=$'\e[0m'               # fg
export LESS_TERMCAP_se=$'\e[0m'               # fg
export LESS_TERMCAP_so=$'\e[48;5;15m\e[1;30m' # statusbar and search fg and bg
export LESS_TERMCAP_ue=$'\e[0m'               # fg
export LESS_TERMCAP_us=$'\e[34;1m'            # header and attr blue
export GROFF_NO_SGR=1                         # for konsole and gnome-terminal

# Aliases
if [[ -f $HOME/.bash_aliases ]]; then
  source $HOME/.bash_aliases 
fi

# Functions
if [[ -f $HOME/.bash_functions ]]; then
  source $HOME/.bash_functions 
fi

# Enable auto-completion
if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi
fi

# fzf
if [[ -f $HOME/.fzf.bash ]]; then
  source $HOME/.fzf.bash
  export FZF_DEFAULT_OPTS="--height 50% --reverse \
  --prompt '❯ ' --pointer '❯ ' --marker '❯ ' \
  --color=bg:-1,fg:-1 \
  --color=bg+:bright-black,fg+:-1 \
  --color=hl:blue,hl+:blue \
  --color=info:-1,marker:blue \
  --color=prompt:green,spinner:green \
  --color=pointer:-1,header:-1 \
  --color=gutter:-1,border:black \
  --border none"
fi

# starship
if type -P starship > /dev/null; then
  export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
  eval "$(starship init bash)"
else
  if [[ -n "$DISPLAY" ]]; then
    PS1=$'\n\\[\E[1;36m\\]$(pwd)\\[\E[0m\\] \n\\[\E[1;32m\\]❯\\[\E[0m\\] '
  else
    PS1=$'\n\\[\E[1;36m\\]$(pwd)\\[\E[0m\\] \n\\[\E[1;32m\\]>\\[\E[0m\\] '
  fi
fi

# zoxide
if type -P zoxide > /dev/null; then
  eval "$(zoxide init bash)"
fi

