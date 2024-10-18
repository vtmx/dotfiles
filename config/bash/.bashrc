# Shell options
shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend

# Environment variables
export BROWSER="firefox"
export CDPATH=".:..:~"
export EDITOR="nvim"
export HISTCONTROL="ignoreboth:ignorespace"
export HISTFILESIZE=$HISTSIZE
export HISTIGNORE='ls:ls -lah:history:pwd:htop:bg:fg:clear'
export HISTSIZE=5000
export HISTTIMEFORMAT="%F %T "
export PATH="$PATH:$HOME/.local/bin"
export PROMPT_COMMAND=('history -a' 'history -r')

# Colors
setab() { echo -en "\e[4$1m";   }
setaf() { echo -en "\e[0;3$1m"; }
sgr0()  { echo -en "\e[0m";     }

# Man
export LESS_TERMCAP_mb=$(sgr0)                  # begin blinking
export LESS_TERMCAP_md=$(setaf 4)               # parameters
export LESS_TERMCAP_me=$(sgr0)                  # end bold effect
export LESS_TERMCAP_se=$(sgr0)                  # statusbar space and type
export LESS_TERMCAP_so=$(setab 7; tput setaf 0) # statusbar and search active
export LESS_TERMCAP_ue=$(sgr0)                  # end underline effect
export LESS_TERMCAP_us=$(setaf 5)               # header and attr
export GROFF_NO_SGR=1                           # for konsole and gnome-terminal

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

# Prompt
if [[ -n "$DISPLAY" ]]; then
  PS1=$"\n$(setaf 6)$(pwd)$(sgr0) \n$(setaf 2)❯$(sgr0) "
else
  PS1=$"\n$(setaf 6)$(pwd)$(sgr0) \n$(setaf 2)>$(sgr0) "
fi

# fzf
[[ -f $HOME/.fzf.bash ]] && source $HOME/.fzf.bash

if type fzf &> /dev/null; then
  if [[ -n "$DISPLAY" ]]; then
    export FZF_DEFAULT_OPTS="\
    --height 50% --reverse \
    --border=none --preview-window=''\
    --prompt '❯ ' --marker '❯' --pointer '❯' \
    --color=bg:-1,fg:-1 \
    --color=bg+:#3d4556,fg+:-1 \
    --color=hl:blue,hl+:blue \
    --color=info:-1,marker:blue \
    --color=prompt:green,spinner:-1 \
    --color=pointer:-1,header:-1 \
    --color=gutter:-1,border:black"
  else
    export FZF_DEFAULT_OPTS="\
    --height 50% --reverse \
    --border=none --preview-window=''\
    --prompt '> ' --marker '>' --pointer '>' \
    --color=bg:-1,fg:-1 \
    --color=bg+:blue,fg+:0 \
    --color=hl:blue,hl+:blue \
    --color=info:-1,marker:blue \
    --color=prompt:green,spinner:-1 \
    --color=pointer:0,header:-1 \
    --color=gutter:-1,border:black"
  fi
fi

# nvm
[[ -f $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh

# zoxide
if type zoxide &> /dev/null; then
  eval "$(zoxide init bash)"
fi

if type zoxide2 &> /dev/null; then
  echo epa
fi

# vim:ft=bash
