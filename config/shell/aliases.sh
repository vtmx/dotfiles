# Enviroment variables
export BROWSER="firefox"
export CODE="code"
export EDITOR="nvim"
export VISUAL="nvim"

# Change directories
alias .="cd -"
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias cdbig="cd $HOME/Dev/projects/biglinux"
alias cdbin="cd $HOME/.local/bin"
alias cdc="cd $HOME/Dev/dotfiles/config"
alias cddesi="cd $HOME/Design"
alias cddesk="cd $HOME/Desktop"
alias cdd="cd $HOME/Dev/dotfiles"
alias cddev="cd $HOME/Dev"
alias cddoc="cd $HOME/Documents"
alias cddow="cd $HOME/Downloads"
alias cdf="cd $HOME/Dev/projects/fraseologia"
alias cdgame="cd $HOME/Games"
alias cdmoz="cd $HOME/.mozilla/firefox/ph8r9j57.default-release/chrome"
alias cdmus="cd $HOME/Music"
alias cdp="cd $HOME/Dev/projects"
alias cdpic="cd $HOME/Pictures"
alias cdpkg="cd $HOME/packages"
alias cds="cd $HOME/Dev/shortcuts"
alias cdsof="cd $HOME/Softwares"
alias cdt="cd $HOME/Downloads/temp"
alias cdv="cd $HOME/Dev/projects/vitormelo"
alias cdvid="cd $HOME/Videos"

# canvas-sketch-cli
alias canva="canvas-sketch-cli"

# chmod
alias chx="chmod +x"

# clear
alias c="clear"
alias cls="clear"

# cmus
alias cm="cmus"

# copy
alias cp="cp -i"
alias cpv="rsync -ah --info=progress2"

# dnf
alias dnfi="sudo dnf install"
alias dnfl="sudo dnf list"
alias dnfr="sudo dnf remove"
alias dnfrepo="sudo dnf repoquery"
alias dnfs="sudo dnf search"

# editor
alias e="$EDITOR"

# exa
alias exaa="exa -a | grep '^\.'"
alias exal="exa -l --color=auto --group-directories-first"
alias exas="exa --color=auto --group-directories-first"
alias tree="exa -T"

# git
alias g="git"
alias gaa="git add --all"
alias gb="git branch"
alias gbd="git branch -d"
alias gcb="git checkout -b"
alias gcl="git clone"
alias gcm="git commit"
alias gco="git checkout"
alias gl="git pull"
alias gm="git merge"
alias gp="git push"

# grep
alias grep="grep --color=auto"

# helix
alias h="helix"
alias hc="helix $HOME/.config/helix/config.toml"
alias hx="helix"

# ls
alias la="ls -A | grep '^\.'"
alias ll="ls -Fal"
alias ls="ls --color=auto --group-directories-first --sort=extension"

# make
alias md="mkdir -p"

# move
alias mv="mv -i"

# nvim
alias v="nvim"

# remove
alias rd="rmdir"
alias rm="rm -i"
alias rmd="rm -rdf"
alias rmf="rm -f"

# source
alias so="source"

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

# config
alias ac="$EDITOR $HOME/.config/shell/aliases.sh"
alias brc="$EDITOR $HOME/.bashrc"
alias fc="$EDITOR $HOME/.config/fish/config.fish"
alias kc="$EDITOR $HOME/.config/kitty/kitty.conf"
alias vc="$EDITOR $HOME/.config/nvim/init.lua"
alias vo="$EDITOR $HOME/.config/nvim/lua/config/options.lua"
alias vm="$EDITOR $HOME/.config/nvim/lua/config/keymaps.lua"
alias vp="$EDITOR $HOME/.config/nvim/lua/plugins/init.lua"
alias vt="$EDITOR $HOME/.config/nvim/lua/config/theme.lua"