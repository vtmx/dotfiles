eval "$(starship init zsh)"

export ZSH='/home/vitor/.oh-my-zsh'
export EDITOR='nvim'
export TERMINAL='konsole'
export BROWSER='vivaldi-stable'

# behavior
autoload -U compinit
compinit

# plugins
plugins=(
	git
#	ssh-agent
	zsh-syntax-highlighting
	zsh-autosuggestions
)

# alias
# commands
alias md='mkdir'
alias rd='rmdir'
alias c='clear'
alias cls='clear'
alias e='exit'
alias r='ranger'

# apps
alias v='nvim'
alias t='tmux'

# configs
alias ac='v ~/.config/alacritty/alacritty.yml'
alias fc='v ~/.config/fish/config.fish'
alias tc='v ~/.tmux.conf'
alias vc='v ~/.config/nvim/init.vim'
alias zc='v ~/.zshrc'

#paths
alias cdp='cd ~/Dev/projects'
alias cdf='cd ~/Dev/projects/fraseologia'
alias cdv='cd ~/Dev/projects/vitormelo'

# custom sh
alias ide='ide.sh'

# source
source $ZSH/oh-my-zsh.sh

# autosugest for tab complete
bindkey '^ ' autosuggest-accept

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
