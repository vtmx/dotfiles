# fisher install danhper/fish-ssh-agent
# use ssh-add

# remove greeting
set fish_greeting

# active default key
# fish_default_key_bindings

# active vim key
# fish_vi_key_bindings 

# kj to scape vim mode 
# function fish_user_key_bindings
#  bind -M insert -m default kj force-repaint
# end

# alias
alias md='mkdir'
alias rd='rmdir'
alias c='clear'
alias cls='clear'
alias e='exit'
alias r='ranger'

# apps
alias v='nvim'
alias t='tmux'

# commands
alias up='sudo pacman -Syu'

# configs
alias ac='v ~/.config/alacritty/alacritty.yml'
alias fc='v ~/.config/fish/config.fish'
alias tc='v ~/.tmux.conf'
alias rc='v ~/.config/rofi/config.rasi'
alias vc='v ~/.config/nvim/init.vim'
alias zc='v ~/.zshrc'

# paths
alias cdc='cd ~/.config'
alias cdd='cd ~/Dev/dotfiles'
alias cdp='cd ~/Dev/projects'
alias cdf='cd ~/Dev/projects/fraseologia'
alias cdt='cd ~/Downloads/temp'
alias cdv='cd ~/Dev/projects/vitormelo'

# git
alias gaa='git add --all'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gbd='git branch -d'
alias gl='git pull'
alias gp='git push'
alias gcmsg='git commit -m'

# custom sh
alias ide='ide.sh'

# starship
starship init fish | source
