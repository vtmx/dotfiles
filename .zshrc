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
alias cdf='cd ~/Dev/projects/fraseologia'
alias ide='ide.sh'

source $ZSH/oh-my-zsh.sh

# autosugest
bindkey '^ ' autosuggest-accept
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
