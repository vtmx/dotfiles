# Environment variables
export EDITOR="nvim"

# Change directories
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias cdbig="cd $HOME/Dev/projects/biglinux"
alias cdbin="cd $HOME/.local/bin"
alias cdc="cd $HOME/Dev/dotfiles/config"
alias cdd="cd $HOME/Dev/dotfiles"
alias cddesi="cd $HOME/Design"
alias cddesk="cd $HOME/Desktop"
alias cddev="cd $HOME/Dev"
alias cddoc="cd $HOME/Documents"
alias cddow="cd $HOME/Downloads"
alias cdgame="cd $HOME/Games"
alias cdf="cd $HOME/Dev/projects/fraseologia"
alias cdh="cd $HOME"
alias cdmoz="cd $HOME/.mozilla/firefox/ph8r9j57.default-release/chrome"
alias cdmus="cd $HOME/Music"
alias cdp="cd $HOME/Dev/projects"
alias cdpic="cd $HOME/Pictures"
alias cdpkg="cd $HOME/packages"
alias cds="cd $HOME/Dev/shortcuts"
alias cdsc="cd $HOME/Dev/doffiles/sripts"
alias cdsof="cd $HOME/Softwares"
alias cdt="cd $HOME/Downloads/temp"
alias cdv="cd $HOME/Dev/projects/vitormelo"
alias cdvid="cd $HOME/Videos"

# bash
alias b="bash"

# clear
alias c="clear"

# canvas-sketch-cli
alias canva="canvas-sketch-cli"

# chmod
alias chx="chmod +x"

# clear
alias cls="clear"

# cmus
alias cm="cmus"

# copy
alias cp="cp -i"
alias cpr="cp -r"
alias cpv="rsync -ah --info=progress2"

# diff
alias diff="diff --color=auto"

# dnf
alias dnfi="sudo dnf install"
alias dnfiy="sudo dnf install -y"
alias dnfl="sudo dnf list"
alias dnfr="sudo dnf remove -y"
alias dnfrepo="sudo dnf repoquery"
alias dnfs="sudo dnf search"
alias dnfu="sudo dnf upgrade --refresh"

# editor
alias e="$EDITOR"

# fish
alias f="fish"

# exa
alias exaa="exa -a | grep '^\.'"
alias exal="exa -l --color=auto --group-directories-first"
alias exas="exa --color=auto --group-directories-first"
alias tree="exa -T"

# git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gbd="git branch -d"
# alias gc="git commit -m"
alias gcb="git checkout -b"
alias gcl="git clone"
alias gco="git checkout"
alias gd="git diff --color-words"
alias gh="git help"
alias gl="git pull"
alias gm="git merge"
alias gmv="git mv"
alias gp="git push"
alias gra="git remote add"
alias grb="git rebase"
alias grm="git rm"
alias grrm="git remote remove"
alias grmv="git remote move"
alias gru="git remote update"
alias gs="git status"

# grep
alias grep="grep --color=auto"

# helix
alias hx="helix"

# ip
alias ip="ip -color=auto"

# ln
alias lnf="ln -f"

# ls
alias la="ls -A | grep '^\.'"
alias ll="ls -Fal"
alias ls="ls --color=auto --group-directories-first --sort=extension"

# man
alias m="man -L pt_BR.UTF-8"
alias man="man -L pt_BR.UTF-8"

# make
alias md="mkdir -p"

# move
alias mv="mv -i"

# nvim
alias v="nvim"

# pip
alias pipi="pip install"
alias pipr="pip uninstall"

# pacman
alias pac="sudo pacman"
alias paci="sudo pacman -S"
alias paciy="sudo pacman --noconfirm -S"
alias pacl="pacman -Q"
alias paclq="pacman -Qqe"
alias paclo="pacman -Qdt" # list orphans
alias pacr="sudo pacman -R"
alias pacry="sudo pacman --noconfirm  -R"
alias pacs="sudo pacman -Ss"
alias pacu="sudo pacman -Syu"

# ps
alias pstree="pstree -npTC age"

# remove
alias rd="rm -rf"
alias rm="rm -i"
alias rmy="rm -f"
alias rmd="rm -r"
alias rmdy="rm -rf"

# live-server
# https://www.npmjs.com/package/live-server
# https://github.com/Browsersync/browser-sync
# alias live="live-server"
# alias live=" python -m http.server -b 127.0.0.1 8000 
alias live="browser-sync start --server --files *"

# source
alias so="source"

# tmux
alias t="tmux -f $HOME/.config/tmux/tmux.conf"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
alias tl="tmux ls"
alias tn="tmux new -s"

# yarn
alias ya="yarn add"
alias yb="yarn build"
alias yc="yarn autoclean"
alias yd="yarn dev"
alias yh="yarn help"
alias ydp="yarn deploy"
alias yi="yarn install"
alias yr="yarn remove"
alias ys="yarn start"
alias yte="yarn test"
alias yu="yarn upgrade"
alias yv="yarn version"

# yay
alias yayi="yay -S"
alias yayr="yay -R"
alias yayu="yay -Syu"

# vlang
alias vl="$HOME/.v/vl"
alias vf="$HOME/.v/vl fmt -w"
alias vh="$HOME/.v/vl help"
alias vr="$HOME/.v/vl run"
alias vu="$HOME/.v/vl up"
alias vw="$HOME/.v/vl watch"

# weather
alias wt="curl wttr.in/?format=3"

# config
alias ba="$EDITOR $HOME/.bash_aliases"
alias br="$EDITOR $HOME/.bashrc"
alias brc="$EDITOR $HOME/.bashrc"
alias brl="source $HOME/.bashrc; echo Reload bashrc"
alias bf="$EDITOR $HOME/.bash_functions"
alias fc="$EDITOR $HOME/.config/fish/config.fish"
alias hc="helix $HOME/.config/helix/config.toml"
alias kc="$EDITOR $HOME/.config/kitty/kitty.conf"
alias tc="$EDITOR $HOME/.config/tmux/tmux.conf"
alias vc="$EDITOR $HOME/.config/nvim/init.lua"
alias vo="$EDITOR $HOME/.config/nvim/lua/config/options.lua"
alias vm="$EDITOR $HOME/.config/nvim/lua/config/keymaps.lua"
alias vp="$EDITOR $HOME/.config/nvim/lua/plugins/init.lua"
alias vt="$EDITOR $HOME/.config/nvim/lua/config/theme.lua"
