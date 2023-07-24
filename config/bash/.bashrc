# Environment variables
export BROWSER="firefox"
export CODE="code"
export EDITOR="nvim"
export VISUAL="$EDITOR"

# Colors for man
export LESS_TERMCAP_mb=$'\e[34;1m'          # no-used blue
export LESS_TERMCAP_md=$'\e[34;1m'          # title blue
export LESS_TERMCAP_me=$'\e[0m'             # text
export LESS_TERMCAP_se=$'\e[0m'             # text
export LESS_TERMCAP_so=$'\e[48;5;15m\e[1;30m' # statusbar and search fg and bg
# export LESS_TERMCAP_so=$'\e[48;5;0m\e[1;39m' # status bar soft
export LESS_TERMCAP_ue=$'\e[0m'             # text
export LESS_TERMCAP_us=$'\e[34;1m'          # header and attr blue
export GROFF_NO_SGR=1                       # for konsole and gnome-terminal

# Aliases
aliases="$HOME/.config/shell/aliases.sh"
if [[ -f $aliases ]]; then
  . "$aliases"
fi

# Functions
functions="$HOME/.config/shell/functions.sh"
if [[ -f $functions ]]; then
  source "$functions"
fi

# Startup
# fzf - ctrl-t, ctrl-r, alt-c
# -1 default, white bright-white
# https://minsw.github.io/fzf-color-picker
if [[ -f ~/.fzf.bash ]]; then
  source ~/.fzf.bash
  export FZF_DEFAULT_OPTS="--height 50% --reverse \
  --prompt '❯ ' --pointer '❯ ' --marker '❯ ' \
  --color=fg:-1,fg+:-1 \
  --color=bg:-1,bg+:black \
  --color=hl:blue,hl+:blue \
  --color=info:-1,marker:blue \
  --color=prompt:green,spinner:green \
  --color=pointer:-1,header:-1 \
  --color=gutter:-1,border:white \
  --border none"
fi

# zoxide
if type -P zoxide > /dev/null; then
  eval "$(zoxide init bash)"
fi

# starship
if type -P starship > /dev/null; then
  export STARSHIP_CONFIG="$HOME/.config/shell/starship.toml"
  eval "$(starship init bash)"
fi
