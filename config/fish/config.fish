# remove greeting
set fish_greeting

# Colors
set -l background 23272e
set -l foreground abb2bf
set -l selection 3d4556
set -l comment 5c6370
set -l red e06c75
set -l orange d19a66
set -l yellow e5c07b
set -l green 98c379
set -l cyan 56b6c2
set -l blue 61afef
set -l purple c678dd

# Syntaxy
set -g fish_color_autosuggestion $comment
set -g fish_color_cancel $red
set -g fish_color_command $foreground
set -g fish_color_comment $comment
set -g fish_color_cwd $yellow
set -g fish_color_cwd_root $red
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_escape $foreground
set -g fish_color_history_current $comment
set -g fish_color_host $blue
set -g fish_color_host_remote $blue
set -g fish_color_keyword $foreground
set -g fish_color_match --background=$blue
set -g fish_color_normal $foreground
set -g fish_color_operator $foreground
set -g fish_color_option $foreground
set -g fish_color_param $foreground
set -g fish_color_quote $green
set -g fish_color_redirection $purple
set -g fish_color_status $foreground
set -g fish_color_search_match --background=$selection
set -g fish_color_selection --background=$blue
set -g fish_color_user $cyan
set -g fish_color_valid_path $green

# Pager colors
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_prefix $blue
set -g fish_pager_color_progress $comment

# Variables
set -gx BROWSER 'firefox'
set -gx CODE 'code'
set -gx EDITOR 'nvim'
set -gx SHELL '/usr/bin/fish'
set -gx VISUAL 'nvim'

# Aliases
# source $HOME/.config/shell/aliases.sh

# Built-in
alias c='clear'
alias chx='chmod +x'
alias cls='clear'
alias cp='cp -i'
alias cpv='rsync -ah --info=progress2'
alias e='$EDITOR'
alias md='mkdir -p'
alias mv='mv -i'
alias rd='rmdir'
alias rm='rm -i'
alias so='source'

# Change directories
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias cdbig='cd $HOME/Dev/projects/biglinux'
alias cdbin='cd $HOME/.local/bin'
alias cdc='cd $HOME/Dev/dotfiles/config'
alias cddesi='cd $HOME/Design'
alias cddesk='cd $HOME/Desktop'
alias cdd='cd $HOME/Dev/dotfiles'
alias cddev='cd $HOME/Dev'
alias cddoc='cd $HOME/Documents'
alias cddow='cd $HOME/Downloads'
alias cdf='cd $HOME/Dev/projects/fraseologia'
alias cdgame='cd $HOME/Games'
alias cdmoz='cd $HOME/.mozilla/firefox/ph8r9j57.default-release/chrome'
alias cdmus='cd $HOME/Music'
alias cdp='cd $HOME/Dev/projects'
alias cdpic='cd $HOME/Pictures'
alias cdpkg='cd $HOME/packages'
alias cds='cd $HOME/Dev/shortcuts'
alias cdsof='cd $HOME/Softwares'
alias cdt='cd $HOME/Downloads/temp'
alias cdv='cd $HOME/Dev/projects/vitormelo'
alias cdvid='cd $HOME/Videos'

# bat
if type -q bat
  alias cat='bat'
end

# dnf
if type -q dnf
  alias dnfl='sudo dnf list'
  alias dnfi='sudo dnf install'
  alias dnfr='sudo dnf remove'
  alias dnfs='sudo dnf search'
  alias dnfrepo='sudo dnf repoquery'
end

# bat
if type -q cmus
  alias cm='cmus'
end

# canvas-sketch-cli
if type -q canvas-sketch-cli
  alias canva='canvas-sketch-cli'
end

# exa
if type -q exa
  alias l.='exa -a | grep "^\."'
  alias ll='exa -l --color=always --group-directories-first'
  alias ls='exa --color=always --group-directories-first'
  alias tree='exa -T'
end

# fish
if type -q fish
  abbr -a -g sof source $HOME/.config/fish/config.fish
end

# fzf
# ctrl-t - Paste the selected files and directories onto the command-line
# ctrl-r - Paste the selected command from history onto the command-line
#  alt-c - cd into the selected directory
if type -q fzf
  set -gx FZF_DEFAULT_OPTS "
  --height 50% --reverse
  --color=fg:#'$foreground',bg:#'$background',hl:#'$blue'
  --color=fg+:#'$foreground',bg+:#'$selection',hl+:#'$blue',gutter:#'$background'
  --color=info:#'$comment',prompt:#'$green',pointer:#'$foreground'
  --color=marker:#'$foreground',spinner:#'$foreground',header:#'$foreground'
  --color=border:#'$comment'"
  # --preview 'bat -n --color=always {}'"
end

# git
if type -q git
  alias g='git'
  alias gaa='git add --all'
  alias gcm='git_commit'
  alias gco='git checkout'
  alias gcb='git checkout -b'
  alias gcl='git clone'
  alias gb='git branch'
  alias gbd='git branch -d'
  alias gl='git pull'
  alias gm='git merge'
  alias gp='git push'

  function git_commit
    set msg $argv[1]

    if test -n "$msg"
      git commit -m "$msg"
    else
      git commit -m "update"
    end
  end
end

# grep
if type -q grep
  alias grep='grep --color=auto'
end

# gum
if type -q gum
  set -gx GUM_FILTER_INDICATOR '>'
  set -gx GUM_FILTER_INDICATOR_FOREGROUND '#'$blue
  set -gx GUM_INPUT_CURSOR_FOREGROUND '#'$foreground
  set -gx GUM_INPUT_PROMPT_FOREGROUND '#'$foreground
  set -gx GUM_INPUT_PLACEHOLDER "What's up?"
  set -gx GUM_INPUT_PROMPT "* "
  set -gx GUM_CHOOSE_CURSOR_FOREGROUND '#'$blue
  set -gx GUM_CHOOSE_ITEM_FOREGROUND '#'$foreground
  set -gx GUM_CHOOSE_SELECTED_FOREGROUND '#'$foreground
end

# helix
if type -q helix
  alias h='helix'
  alias hx='helix'
  alias hc='helix $HOME/.config/helix/config.toml'
end

# nvim and configs
if type -q nvim
  alias v='nvim'
  alias ac='$EDITOR $HOME/.config/shell/aliases.sh'
  alias fc='$EDITOR $HOME/.config/fish/config.fish'
  alias kc='$EDITOR $HOME/.config/kitty/kitty.conf'
  alias pc='$EDITOR $HOME/.config/polybar/config.ini'
  alias tc='$EDITOR $HOME/.config/tmux/tmux.conf'
  alias rc='$EDITOR $HOME/.config/rofi/config.rasi'
  alias vc='$EDITOR $HOME/.config/nvim/init.lua'
  alias vo='$EDITOR $HOME/.config/nvim/lua/config/options.lua'
  alias vm='$EDITOR $HOME/.config/nvim/lua/config/keymaps.lua'
  alias vp='$EDITOR $HOME/.config/nvim/lua/plugins/init.lua'
  alias vt='$EDITOR $HOME/.config/nvim/lua/config/theme.lua'
end

# lazygit
if type -q lazygit
  alias lg='lazygit'
end

# npm
if type -q npm
  # set -gx NO_COLOR true
  alias npmd='npm run dev'
  alias npmi='npm install'
  alias npms='npm start'
  alias npmr='npm remove'
  alias npmu='npm update'
end

# pacman
if type -q pacman
  alias pac='sudo pacman'
  alias paci='sudo pacman -S'
  alias pacr='sudo pacman -R'
  alias pacu='sudo pacman -Syu'
end

# ranger
if type -q ranger
  alias r='ranger'
end

# tmux
if type -q tmux
  alias t='tmux'
end

# vifm
if type -q vifm
  alias vfm='vifm .'
end

# vlang
if type -q '$HOME/.v/v'
  alias vl='$HOME/.v/vl'
  alias vh='$HOME/.v/vl help'
  alias vf='$HOME/.v/vl fmt -w'
  alias vr='$HOME/.v/vl run'
  alias vu='$HOME/.v/vl up'
  alias vw='$HOME/.v/vl watch'
end

# yarn
if type -q yarn
  # set -gx FORCE_COLOR 0
  alias ya='yarn add'
  alias yb='yarn build'
  alias yc='yarn autoclean'
  alias yd='yarn dev'
  alias yh='yarn help'
  alias ydp='yarn deploy'
  alias yi='yarn install'
  alias yr='yarn remove'
  alias ys='yarn start'
  alias yte='yarn test'
  alias yu='yarn upgrade'
  alias yv='yarn version'
end

# yay
if type -q yay
  alias yayi='yay -S'
  alias yayr='yay -R'
  alias yayu='yay -Syu'
end

# Functions

# Default prompt
function fish_prompt
  echo ''
  set_color cyan; echo (pwd) 
  set_color green; echo '❯ '
end

# Unzip and enter
function uzcd
  unzip $argv && cd $argv
end

# ssh login 
function ssha
  if test -z "$SSH_AUTH_SOCK"
    eval (ssh-agent -c)
    ssh-add -k
  end
end

# Inits

# starship
if type -q starship
  starship init fish | source
end

# zoxide
if type -q zoxide
  zoxide init fish | source

  # custom key
  # zoxide init --cmd f fish | source

  alias zo='zoxide_open'

  function zoxide_open
    zoxide query $argv | xargs dolphin & 
  end
end

# Headers blue
set -xU LESS_TERMCAP_md (printf "\e[01;34m")

# Body attribute value
set -xU LESS_TERMCAP_us (printf "\e[01;32m")

# Statusline
set -xU LESS_TERMCAP_so (printf "\e[01;40;37m")

# Body sem cor suja muito o documento
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_ue (printf "\e[0m")

# References
# https://fishshell.com/docs/current/interactive.html#variables-color
# https://minsw.github.io/fzf-color-picker

# Colorize man pages
# black
# brblack 
# red
# green
# yellow
# blue
# purple
# cyan
# white	
# brwhite
