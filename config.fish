# https://github.com/rkbk60/onedark-fish
if status is-interactive
    set -l onedark_options '-b'

    if set -q VIM
        # Using from vim/neovim.
        set onedark_options "-256"
    else if string match -iq "eterm*" $TERM
        # Using from emacs.
        function fish_title; true; end
        set onedark_options "-256"
    end

    set_onedark $onedark_options
end

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
