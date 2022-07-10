# remove greeting
set fish_greeting

# var colors
set -l shade0 23272e
set -l shade1 4b515c
set -l shade2 4b515c
set -l shade3 5c6370
set -l shade4 636d83
set -l shade5 828997
set -l shade6 979eab
set -l shade7 abb2bf
set -l accent1 d19a66
set -l accent2 e5c07b
set -l accent3 98c379
set -l accent4 56b6c2
set -l accent5 61afef
set -l accent6 c678dd
set -l accent7 be5046

# themes
set -g fish_color_param $shade7
set -g fish_color_search_match --background=$shade2
set -g fish_color_valid_path normal
set -g fish_pager_color_completion $shade7

# active default key
# fish_default_key_bindings

# active vim key
# fish_vi_key_bindings 

# kj to scape vim mode 
# function fish_user_key_bindings
#  bind -M insert -m default kj force-repaint
# end

# plugin ssh
fish_ssh_agent

# alias
# commands
alias ...='cd ../..'
alias c='clear'
alias cat='bat'
alias cls='clear'
alias cpv='rsync -ah --info=progress2'
alias e='exit'
alias ls='exa --color=always --group-directories-first'
alias tree='exa -T'
alias md='mkdir'
alias rd='rmdir'
alias r='ranger'

# apps
alias v='nvim'
alias t='tmux'
alias matrix='cmatrix -C white'

# pacman
alias pac='sudo pacman'
alias pacu='sudo pacman -Syu'
alias paci='sudo pacman -S'
alias pacr='sudo pacman -R'
alias yayi='sudo yay -S'
alias yayr='sudo yay -R'

# configs
alias ac='nvim $HOME/.config/alacritty/alacritty.yml'
alias fc='nvim $HOME/.config/fish/config.fish'
alias kc='nvim $HOME/.config/kitty/kitty.conf'
alias rc='nvim $HOME/.config/rofi/config.rasi'
alias pc='nvim $HOME/.config/polybar/config'
alias tc='nvim $HOME/.tmux.conf'
alias vc='nvim $HOME/.config/nvim/init.lua'
alias vs='nvim $HOME/.config/nvim/lua/settings.lua'
alias vm='nvim $HOME/.config/nvim/lua/mappings.lua'
alias vp='nvim $HOME/.config/nvim/lua/plugins.lua'
alias vt='nvim $HOME/.config/nvim/lua/theme.lua'

# paths
alias cddesk='cd $HOME/Desktop'
alias cddoc='cd $HOME/Documents'
alias cddow='cd $HOME/Downloads'
alias cdpic='cd $HOME/Pictures'
alias cdmus='cd $HOME/Music'
alias cdvid='cd $HOME/Videos'
alias cdc='cd $HOME/.config'
alias cdd='cd $HOME/Dev/dotfiles'
alias cdp='cd $HOME/Dev/projects'
alias cdf='cd $HOME/Dev/projects/fraseologia'
alias cdv='cd $HOME/Dev/projects/vitormelo'
alias cds='cd $HOME/Dev/shortcuts'
alias cdt='cd $HOME/Downloads/temp'

# yarn
alias yd='yarn dev'
alias ydp='yarn deploy'

# git
alias g='git'
alias gaa='git add --all'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gb='git branch'
alias gbd='git branch -d'
alias gl='git pull'
alias gp='git push'
alias gc='git commit -m'

# variables
export BROWSER=vivaldi-stable
export CODE=code
export EDITOR='nvim
export VISUAL='nvim
export MICRO_TRUECOLOR=1

# custom sh
alias ide='ide.sh'

# vlang
alias vl='$HOME/.v/vl'

# starship
starship init fish | source
