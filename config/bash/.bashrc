# Environment variables
export BROWSER="firefox"
export EDITOR="nvim"
export PATH="$PATH:$HOME/.local/bin"
export CDPATH=".:..:~"

# Man
# https://sobrelinux.info/questions/771395/documentation-on-less-termcap-variables
# https://www.howtogeek.com/683134/how-to-display-man-pages-in-color-on-linux
export LESS_TERMCAP_mb=$(tput sgr0)                   # begin blinking
export LESS_TERMCAP_md=$(tput setaf 4)                # parameters
export LESS_TERMCAP_me=$(tput sgr0)                   # end bold effect 
export LESS_TERMCAP_so=$(tput setab 15; tput setaf 0) # statusbar and search active
export LESS_TERMCAP_se=$(tput setab 0; tput setaf 15) # statusbar space and type
export LESS_TERMCAP_us=$(tput setaf 5)                # header and attr
export LESS_TERMCAP_ue=$(tput sgr0)                   # end underline effect            
export GROFF_NO_SGR=1                                 # for konsole and gnome-terminal

# Aliases
[[ -f $HOME/.bash_aliases ]] && source $HOME/.bash_aliases 

# Functions
[[ -f $HOME/.bash_functions ]] && source $HOME/.bash_functions 

# Auto-completion
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

# nvm
[[ -f $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh

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
