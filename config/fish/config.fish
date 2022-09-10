# remove greeting
set fish_greeting

# var colors
set -l shade0 23272e
set -l shade1 4b515c
set -l shade2 4b515c
set -l shade3 5c6370
set -l shade4 636d83
set -l shade5 828997
set -l shade6 979eab
set -l shade7 abb2bf
set -l accent1 d19a66
set -l accent2 e5c07b
set -l accent3 98c379
set -l accent4 56b6c2
set -l accent5 61afef
set -l accent6 c678dd
set -l accent7 be5046

# themes
set -g fish_color_param $shade7
set -g fish_color_search_match --background=$shade2
set -g fish_color_valid_path normal
set -g fish_pager_color_completion $shade7

# enable vi mode
# fish_vi_key_bindings

# to go back to default mode
# fish_default_key_bindings

# active keybinds vim
function fish_user_key_bindings
	# mappings
	# bind -M insert -m default kj backward-char force-repaint
	bind -m default L end-of-line
	bind -m default H beginning-of-line

	# fish shortcuts
	bind -M insert \cf accept-autosuggestion
	bind -M insert \cj history-search-backward
	bind -M insert \cn history-search-backward
	bind -M insert \ck history-search-forward
	bind -M insert \cp history-search-forward
end

# emulates vim's cursor shape behavior
# set the normal and visual mode cursors to a block
# set fish_cursor_default block

# set the insert mode cursor to a line
# set fish_cursor_insert line

# set the replace mode cursor to an underscore
# set fish_cursor_replace_one underscore

# the following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
# set fish_cursor_visual block

# plugin ssh
# fish_ssh_agent

# variables
export BROWSER='vivaldi-stable'
export CODE='code'
export EDITOR='nvim'
export VISUAL='nvim'

# alias
# commands
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias cat='bat'
alias cls='clear'
alias cpv='rsync -ah --info=progress2'
alias e='exit'
alias md='mkdir'
alias rd='rmdir'
alias r='ranger'

# exa
if type -q exa
  alias ls='exa --color=always --group-directories-first'
  alias tree='exa -T'
end

# apps
alias v='nvim'
alias t='tmux'
alias matrix='cmatrix -C white'

# configs
alias ac='nvim $HOME/.config/alacritty/alacritty.yml'
alias bc='nvim $HOME/.config/bspwm/bspwmrc'
alias fc='nvim $HOME/.config/fish/config.fish'
alias kc='nvim $HOME/.config/kitty/kitty.conf'
alias rc='nvim $HOME/.config/rofi/config.rasi'
alias pc='nvim $HOME/.config/polybar/config.ini'
alias tc='nvim $HOME/.tmux.conf'
alias sc='nvim $HOME/.config/sxhkd/sxhkdrc'
alias vc='nvim $HOME/.config/nvim/init.lua'
alias vs='nvim $HOME/.config/nvim/lua/settings.lua'
alias vm='nvim $HOME/.config/nvim/lua/mappings.lua'
alias vp='nvim $HOME/.config/nvim/lua/plugins.lua'
alias vt='nvim $HOME/.config/nvim/lua/theme.lua'

# paths
alias cddesk='cd $HOME/Desktop'
alias cddoc='cd $HOME/Documents'
alias cddow='cd $HOME/Downloads'
alias cdpic='cd $HOME/Pictures'
alias cdmus='cd $HOME/Music'
alias cdvid='cd $HOME/Videos'
alias cdc='cd $HOME/Dev/dotfiles/config'
alias cdd='cd $HOME/Dev/dotfiles'
alias cdp='cd $HOME/Dev/projects'
alias cdf='cd $HOME/Dev/projects/fraseologia'
alias cdv='cd $HOME/Dev/projects/vitormelo'
alias cds='cd $HOME/Dev/shortcuts'
alias cdt='cd $HOME/Downloads/temp'

# pacman
alias pac='sudo pacman'
alias pacu='sudo pacman -Syu'
alias paci='sudo pacman -S'
alias pacr='sudo pacman -R'

# yay
alias yayi='yay -S'
alias yayr='yay -R'
alias yayu='yay -Syu'

# git
alias g='git'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gb='git branch'
alias gbd='git branch -d'
alias gl='git pull'
alias gp='git push'

# yarn
alias yd='yarn dev'
alias ydp='yarn deploy'

# custom sh
alias ide='ide.sh'

# vlang
alias vl='$HOME/.v/vl'

# default prompt
function fish_prompt
  echo ''
  set_color cyan; echo (pwd) 
  set_color green; echo '❯ '
end

# starship prompt
if type -q starship
  starship init fish | source
else
  fish_prompt
end

# links
# https://superuser.com/questions/603359/how-do-i-install-make-a-custom-prompt-for-fish-shell
