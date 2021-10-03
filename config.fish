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

# commands
alias ...='cd ../..'
alias c='clear'
alias cat='bat'
alias cls='clear'
alias cpv='rsync -ah --info=progress2'
alias e='exit'
alias ls='exa -a --color=always --group-directories-first'
alias md='mkdir'
alias rd='rmdir'
alias r='ranger'

# apps
alias v='nvim'
alias t='tmux'

# pacman
alias up='sudo pacman -Syu'
alias pacs='sudo pacman -S'

# configs
alias ac='v $HOME/.config/alacritty/alacritty.yml'
alias fc='v $HOME/.config/fish/config.fish'
alias tc='v $HOME/.tmux.conf'
alias rc='v $HOME/.config/rofi/config.rasi'
alias vc='v $HOME/.config/nvim/init.vim'
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
export EDITOR=nvim
export VISUAL=subl

# custom sh
alias ide='ide.sh'

# starship
starship init fish | source
