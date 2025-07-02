# bash
alias ba="$EDITOR $HOME/.bash_aliases"
alias bf="$EDITOR $HOME/.bash_functions"
alias br="source $HOME/.bashrc; echo Reload bashrc"
alias brc="$EDITOR $HOME/.bashrc"

# bun
alias buni="bun install"
alias bunr="bun remove"
alias bunl="bun pm ls"

# directories
alias ..="cd .."
alias ...="cd ../.."
alias cdb="cd $HOME/Dev/dotfiles/bin"
alias cdc="cd $HOME/Dev/dotfiles/config"
alias cdd="cd $HOME/Dev/dotfiles"
alias cddoc="cd $HOME/Documents"
alias cddow="cd $HOME/Downloads"
alias cdhd="cd /media/hda1"
alias cdk="cd $HOME/pkgs"
alias cdmoz="cd $HOME/.mozilla/firefox/ph8r9j57.default-release/chrome"
alias cdn="cd $HOME/Dev/notes"
alias cdp="cd $HOME/Dev/projects"
alias cdt="cd $HOME/Downloads/temp"

# canvas-sketch-cli
alias canva="canvas-sketch-cli"

# du list size files
alias dush="du -h --max-depth=1 | sort -hr"

# chmod
alias chx="chmod +x"

# copy
alias cp="cp -i"
alias cpv="rsync -ah --info=progress2"

# dir
alias dir="dir --color=auto"

# diff
alias diff="diff --color=auto"

# dnf
alias dnfi="sudo dnf install"
alias dnfiy="sudo dnf install -y"
alias dnfl="sudo dnf list"
alias dnfrepo="sudo dnf repoquery"
alias dnfr="sudo dnf remove -y"
alias dnfs="sudo dnf search"
alias dnfu="sudo dnf upgrade --refresh"

# egrep
alias egrep="egrep --color=auto"

# fgrep
alias fgrep="fgrep --color=auto"

# git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gbd="git branch -d"
alias gcb="git checkout -b"
alias gcl="git clone"
alias gcld="git clone --depth 1"
alias gco="git checkout"
alias gd="git diff --color-words"
alias gh="git help"
alias gl="git pull"
alias glg="git log -5 --graph --abbrev-commit --decorate --format=format:'%C(blue)%h%C(reset) - %C(cyan)%ai%C(reset) - %C(normal)%an%C(reset) %C(green)(%ar)%C(reset)%C(yellow)%d%C(reset)%n %C(normal)%s%C(reset)'"
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

# ghostty
alias gho="$EDITOR $HOME/.config/ghostty/config"

# grep
alias grep="grep --color=auto"

# gtk
alias gtk="GTK_DEBUG=interactive"

# helix
alias h="helix"
alias hc="helix $HOME/.config/helix/config.toml"
alias ht="helix $HOME/.config/helix/themes/onedarkv.toml"

# history
alias hi="history | sort -rn"

# inotify
alias iwai="inotifywait"
alias iwat="inotifywatch"

# killall
alias k=killall

# kitty
alias kc="$EDITOR $HOME/.config/kitty/kitty.conf"

# live-server
alias live="browser-sync start --server "." --files *"

# ls
alias l="ls --color=auto --group-directories-first --sort=extension"
alias la="ls -A | grep '^\.' | column"
alias ll="ls -Fal"
alias ls="ls --color=auto --group-directories-first --sort=extension"

# man pt-br
alias m="man -L pt_BR.UTF-8"
alias man="man -L pt_BR.UTF-8"

# create dir
alias md="mkdir -p"

# move
alias mv="mv -i"

# pip
alias pipi="pip install"
alias pipr="pip uninstall"

# pacman
alias pacc="sudo pacman -Sc"              # clean old from cache
alias paci="sudo pacman -S"               # install
alias paciy="sudo pacman -S --noconfirm"  # install no confirm
alias paclo="pacman -Qdt"                 # list orphans
alias pacl="pacman -Q"                    # list
alias paclq="pacman -Qqe"                 # filter
alias pacr="sudo pacman -Rs"              # remove
alias pacry="sudo pacman --noconfirm -Rs" # remove no confirm
alias pacs="sudo pacman -Ss"              # search
alias pac="sudo pacman"                   # pacman
alias pacu="sudo pacman -Syu"             # update

# ps
alias pstree="pstree -npTC age"

# remove
alias rd="rm -ir"
alias rdy="rm -fr"
alias rm="rm -i"
alias rmy="rm -f"

# rename
alias rename="perl-rename"

# source
alias so="source"

# su
alias su="su - "

# tmux
alias t="tmux -f $HOME/.config/tmux/tmux.conf"
alias ta="tmux attach -t"
alias tc="$EDITOR $HOME/.config/tmux/tmux.conf"
alias tk="tmux kill-session -t"
alias tl="tmux ls"
alias tn="tmux new -s"

# tree
alias tree="eza -T"

# vdir
alias vdir="vdir --color=auto"

# vim
alias v="nvim"
alias vc="$EDITOR $HOME/.config/nvim/init.lua"
alias vo="$EDITOR $HOME/.config/nvim/lua/config/options.lua"
alias vm="$EDITOR $HOME/.config/nvim/lua/config/keymaps.lua"
alias vp="$EDITOR $HOME/.config/nvim/lua/plugins"
alias vt="$EDITOR $HOME/.config/nvim/lua/config/theme.lua"

# vlang
alias vl="$HOME/.v/vl"
alias vf="$HOME/.v/vl fmt -w"
alias vh="$HOME/.v/vl help"
alias vr="$HOME/.v/vl run"
alias vu="$HOME/.v/vl up"
alias vw="$HOME/.v/vl watch run"

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
alias yayc='yay -Sc'
alias yayr="yay -R"
alias yayu="yay -Syu"

# yt-dlp
alias ytp='yt-dlp -x --audio-format mp3 --replace-in-metadata title " " "-" --output "%(playlist_index|02)s-%(title)s.%(ext)s"'

# weather
alias wt="curl wttr.in/?format=3"

# lite-xl
alias xl="lite-xl"
alias xc="lite-xl $HOME/.config/lite-xl"
