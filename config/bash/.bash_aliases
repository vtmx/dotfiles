# Environment variables
export EDITOR="nvim"

# Change directories
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias cdbig="cd $HOME/Dev/projects/biglinux"
alias cdbin="cd $HOME/Dev/dotfiles/local/bin"
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
alias ezaa="eza -a | grep '^\.'"
alias ezal="eza -l --color=auto --group-directories-first"
alias ezas="eza --color=auto --group-directories-first"
alias tree="eza -T"

# git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gbd="git branch -d"
# alias gc="git commit -m"
alias gcb="git checkout -b"
alias gcl="git clone"
alias gcld="git clone --depth 1"
alias gco="git checkout"
alias gd="git diff --color-words"
alias gh="git help"
alias gl="git pull"
alias glog="git log -5 --graph --abbrev-commit --decorate --format=format:'%C(blue)%h%C(reset) - %C(cyan)%ai%C(reset) - %C(normal)%an%C(reset) %C(green)(%ar)%C(reset)%C(yellow)%d%C(reset)%n %C(normal)%s%C(reset)'"
alias gm="git merge"
alias gmv="git mv"
alias gp="git push"
alias gra="git remote add"
alias grb="git rebase"
alias grm="git rm"
alias grrm="git remote remove"
alias grmv="git remote move"
alias gru="git remote update"
alias gs="git status -sb"

# gtk
alias gtk="GTK_DEBUG=interactive"

# grep
alias grep="grep --color=auto"

# history
alias hi="history"

# helix
alias hx="helix"

# ip
alias ip="ip -color=auto"

# inotify
alias iwait="inotifywait"
alias iwatch="inotifywatch"

# ln
alias lnf="ln -f"

# ls
alias la="ls -A | grep '^\.'"
alias ll="ls -Fal"
alias ls="ls --color=auto --group-directories-first --sort=extension"
alias lls="ls -ltra | grep --color=never '\->'"

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
alias pac="sudo pacman"                   # pacman
alias pacc="sudo pacman -Sc"              # clean old from cache
alias paci="sudo pacman -S"               # install
alias paciy="sudo pacman -S --noconfirm"  # install no confirm
alias pacl="pacman -Q"                    # list
alias paclq="pacman -Qqe"                 # filter
alias paclo="pacman -Qdt"                 # list orphans
alias pacr="sudo pacman -R"               # remove
alias pacry="sudo pacman --noconfirm  -R" # remove no confirm
alias pacs="sudo pacman -Ss"              # search
alias pacu="sudo pacman -Syu"             # update

# ps
alias pstree="pstree -npTC age"

# remove
alias rd="rm -rf"
alias rm="rm -i"
alias rmy="rm -f"
alias rmdy="rm -rf"

# live-server
# https://www.npmjs.com/package/live-server
# https://github.com/Browsersync/browser-sync
# alias live="live-server"
# alias live=" python -m http.server -b 127.0.0.1 8000 
alias live="browser-sync start --server "." --files *"

# source
alias so="source"

# su
alias su="su - "

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
alias yayc='yay -Sc'
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
alias kc="$EDITOR $HOME/.config/kitty/kitty.conf"
alias tc="$EDITOR $HOME/.config/tmux/tmux.conf"
alias vc="$EDITOR $HOME/.config/nvim/init.lua"
alias vo="$EDITOR $HOME/.config/nvim/lua/config/options.lua"
alias vm="$EDITOR $HOME/.config/nvim/lua/config/keymaps.lua"
alias vp="$EDITOR $HOME/.config/nvim/lua/plugins/init.lua"
alias ob="$EDITOR $HOME/.config/openbox/rc.xml"
alias vt="$EDITOR $HOME/.config/nvim/lua/config/theme.lua"

# xfce reload theme
# alias xf="sassc -M -t expanded $HOME/.local/share/themes/Lightly/gtk-3.0/src/main.scss $HOME/.local/share/themes/Lightly/gtk-3.0/gtk.css && xfconf-query -c xsettings -p /Net/ThemeName -r && xfconf-query -c xsettings -p /Net/ThemeName -s Lightly"

# References
# https://dev.to/robertcoopercode/using-aliases-to-speed-up-your-git-workflow-2f5a
