# Shell options
shopt -s cmdhist
shopt -s checkwinsize
shopt -s histappend

# Environment variables
export CDPATH=".:..:~"
export BROWSER="firefox"
export EDITOR="nvim"
export HISTCONTROL="ignoreboth:ignorespace"
export HISTIGNORE='ls:ls -lah:history:pwd:htop:bg:fg:clear'
export HISTTIMEFORMAT="%F %T "
export HISTSIZE=5000
export HISTFILESIZE=$HISTSIZE
export PATH="$PATH:$HOME/.local/bin"
export PROMPT_COMMAND=('history -a' 'history -r')

# Man
# export LESS_TERMCAP_mb=$'\e[0m'
# export LESS_TERMCAP_md=$'\e[0;34m'
# export LESS_TERMCAP_me=$'\e[0m'
# export LESS_TERMCAP_se=$'\e[0m'
# export LESS_TERMCAP_so=$'\e[107;30m'
# export LESS_TERMCAP_ue=$'\e[0m'
# export LESS_TERMCAP_us=$'\e[0;35m'
# export GROFF_NO_SGR=1 # for konsole and gnome-terminal

export LESS_TERMCAP_mb=$(tput sgr0)                   # begin blinking
export LESS_TERMCAP_md=$(tput setaf 4)                # parameters
export LESS_TERMCAP_me=$(tput sgr0)                   # end bold effect
export LESS_TERMCAP_se=$(tput sgr0)                   # statusbar space and type
export LESS_TERMCAP_so=$(tput setab 15; tput setaf 0) # statusbar and search active
export LESS_TERMCAP_ue=$(tput sgr0)                   # end underline effect
export LESS_TERMCAP_us=$(tput setaf 5)                # header and attr
export GROFF_NO_SGR=1                                 # for konsole and gnome-terminal

# export LESS_TERMCAP_mb=$(tput sgr0)                   # begin blinking
# export LESS_TERMCAP_md=$(tput setaf 4)                # parameters
# export LESS_TERMCAP_me=$(tput sgr0)                   # end bold effect
# export LESS_TERMCAP_se=$(tput setab 0; tput setaf 15) # statusbar space and type
# export LESS_TERMCAP_so=$(tput setab 15; tput setaf 0) # statusbar and search active
# export LESS_TERMCAP_ue=$(tput sgr0)                   # end underline effect
# export LESS_TERMCAP_us=$(tput setaf 5)                # header and attr
# export GROFF_NO_SGR=1                                 # for konsole and gnome-terminal

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
  PS1=$'\n\\[\E[1;36m\\]$(pwd)\\[\E[0m\\] \n\\[\E[1;32m\\]❯\\[\E[0m\\] '
else
  PS1=$'\n\\[\E[1;36m\\]$(pwd)\\[\E[0m\\] \n\\[\E[1;32m\\]>\\[\E[0m\\] '
fi

# fzf
if [[ -f $HOME/.fzf.bash ]]; then
  source $HOME/.fzf.bash
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
if type -P zoxide > /dev/null; then
  eval "$(zoxide init bash)"
fi

# vim:ft=bash
