# remove greeting
set fish_greeting

# theme
set shade0 '23272e'
set shade1 '4b515c'
set shade2 '4b515c'
set shade3 '5c6370'
set shade4 '636d83'
set shade5 '828997'
set shade6 '979eab'
set shade7 'abb2bf'
set accent1 'd19a66'
set accent2 'e5c07b'
set accent3 '98c379'
set accent4 '56b6c2'
set accent5 '61afef'
set accent6 'c678dd'
set accent7 'be5046'

set fish_color_param $shade7
set fish_color_search_match --background=$shade2
set fish_color_valid_path normal
set fish_pager_color_completion $shade7

# active default key
# fish_default_key_bindings

# active vim key
# fish_vi_key_bindings 

# kj to scape vim mode 
# function fish_user_key_bindings
#  bind -M insert -m default kj force-repaint
# end

# alias
# commands
alias ...='cd ../..'
alias c='clear'
alias cat='bat'
alias cls='clear'
alias cpv='rsync -ah --info=progress2'
alias e='exit'
alias ls='exa --color=always --group-directories-first'
alias md='mkdir'
alias rd='rmdir'
alias r='ranger'

# apps
alias v='nvim'
alias t='tmux'

# pacman
alias pacman='sudo pacman'
alias update='sudo pacman -Syu'
alias install='sudo pacman -Sy'

# configs
alias ac='v $HOME/.config/alacritty/alacritty.yml'
alias fc='v $HOME/.config/fish/config.fish'
alias tc='v $HOME/.tmux.conf'
alias rc='v $HOME/.config/rofi/config.rasi'
alias vc='v $HOME/.config/nvim/init.lua'
alias vs='v $HOME/.config/nvim/lua/settings.lua'
alias vm='v $HOME/.config/nvim/lua/mappings.lua'
alias vp='v $HOME/.config/nvim/lua/plugins.lua'
alias vt='v $HOME/.config/nvim/lua/theme.lua'
alias zc='v $HOME/.zshrc'

# paths
alias cdc='cd $HOME/.config'
alias cdd='cd $HOME/Dev/dotfiles'
alias cdp='cd $HOME/Dev/projects'
alias cdf='cd $HOME/Dev/projects/fraseologia'
alias cds='cd $HOME/Dev/shortcuts'
alias cdt='cd $HOME/Downloads/temp'
alias cdv='cd $HOME/Dev/projects/vitormelo'

# git
alias gaa='git add --all'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gbd='git branch -d'
alias gl='git pull'
alias gp='git push'
alias gcmsg='git commit -m'

# variables
export BROWSER=opera
export CODE=code
export EDITOR=nvim
export VISUAL=nvim

# custom sh
alias ide='ide.sh'

# starship
starship init fish | source