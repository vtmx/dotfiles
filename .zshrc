# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH='/home/vitor/.oh-my-zsh'
#export TERM="xterm-256color"

# behavior
autoload -U compinit
compinit

# theme
ZSH_THEME='powerlevel10k/powerlevel10k'
#ZSH_THEME='pure'
#ZSH_THEME='theone'

# plugins
plugins=(
	git
	ssh-agent
	zsh-history-substring-search
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
alias f='ranger'

# apps
alias v='nvim'
alias t='tmux'

# configs
alias ac='v ~/.config/alacritty/alacritty.yml'
alias tc='v ~/.tmux.conf'
alias vc='v ~/.config/nvim/init.vim'
alias zc='v ~/.zshrc'

#paths
alias cdp='cd ~/Dev/projects'
alias cdf='cd ~/Dev/projects/fraseologia'
alias cdv='cd ~/Dev/projects/vitormelo'

# custom sh
alias ide='ide.sh'

source $ZSH/oh-my-zsh.sh

# autosugest
bindkey '^ ' autosuggest-accept
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
