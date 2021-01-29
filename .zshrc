export ZSH='/home/vitor/.oh-my-zsh'
#export TERM="xterm-256color"

# behavior
autoload -U compinit
compinit

# theme
ZSH_THEME='theone'

# plugins
plugins=(
	git
	zsh-history-substring-search
	zsh-syntax-highlighting
	zsh-autosuggestions
)

# alias
alias c='clear'
alias e='exit'
alias v='nvim'
alias tc='v ~/.tmux.conf'
alias t='tmux'
alias vc='v ~/.config/nvim/init.vim'
alias zc='v ~/.zshrc'
alias cdp='cd ~/Dev/projects'

source $ZSH/oh-my-zsh.sh

# autosugest
bindkey '^ ' autosuggest-accept
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
