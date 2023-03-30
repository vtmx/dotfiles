# remove greeting
set fish_greeting

# Colors
set -l shade0 23272e # background color
set -l shade1 1e2227 # ui, darker
set -l shade2 3d4556 # ui, text selection
set -l shade3 5c6370 # ui, code comments
set -l shade4 2c313c # iu, line highlight
set -l shade5 828997 # iu
set -l shade6 979eab # foreground text
set -l shade7 abb2bf # foreground text

set -l accent0 e06c75 # red
set -l accent1 d19a66 # orange
set -l accent2 e5c07b # yellow
set -l accent3 98c379 # green
set -l accent4 56b6c2 # cyan
set -l accent5 61afef # blue
set -l accent6 c678dd # purple
set -l accent7 be5046 # magenta

# Syntaxy
set -g fish_color_autosuggestion $shade3
set -g fish_color_cancel $accent0
set -g fish_color_command $shade7
set -g fish_color_comment $shade3
set -g fish_color_cwd $accent2
set -g fish_color_cwd_root $accent0
set -g fish_color_end $accent1
set -g fish_color_error $accent0
set -g fish_color_escape $shade7
set -g fish_color_history_current $shade3
set -g fish_color_host $accent5
set -g fish_color_host_remote $accent5
set -g fish_color_keyword $shade7
set -g fish_color_match --background=$accent5
set -g fish_color_normal $shade7
set -g fish_color_operator $shade7
set -g fish_color_option $shade7
set -g fish_color_param $shade7
set -g fish_color_quote $accent3
set -g fish_color_redirection $accent6
set -g fish_color_status $shade7
set -g fish_color_search_match --background=$shade2
set -g fish_color_selection --background=$accent5
set -g fish_color_user $accent4
set -g fish_color_valid_path $accent3

# Pager colors
set -g fish_pager_color_completion $shade7
set -g fish_pager_color_description $shade3
set -g fish_pager_color_prefix $accent5
set -g fish_pager_color_progress $shade3

# Variables
set -x BROWSER 'firefox'
set -x CODE 'code'
set -x EDITOR 'nvim'
set -x SHELL '/usr/bin/fish'
set -x VISUAL 'nvim'

# System
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias chx='chmod +x'
alias cls='clear'
alias cpv='rsync -ah --info=progress2'
alias e='exit'
alias md='mkdir -p'
alias rd='rmdir'
 
# Paths
alias cddesi='cd $HOME/Design'
alias cddesk='cd $HOME/Desktop'
alias cddev='cd $HOME/Dev'
alias cddoc='cd $HOME/Documents'
alias cddow='cd $HOME/Downloads'
alias cdgame='cd $HOME/Games'
alias cdmus='cd $HOME/Music'
alias cdpic='cd $HOME/Pictures'
alias cdsof='cd $HOME/Softwares'
alias cdvid='cd $HOME/Videos'
alias cdc='cd $HOME/Dev/dotfiles/config'
alias cdd='cd $HOME/Dev/dotfiles'
alias cdp='cd $HOME/Dev/projects'
alias cdpkg='cd $HOME/_packages'
alias cdf='cd $HOME/Dev/projects/fraseologia'
alias cdv='cd $HOME/Dev/projects/vitormelo'
alias cds='cd $HOME/Dev/shortcuts'
alias cdt='cd $HOME/Downloads/temp'

# bat
if type -q bat
  alias cat='bat'
end

# bat
if type -q cmus
  alias cm='cmus'
end

# canvas-sketch-cli
if type -q canvas-sketch-cli
  alias canvas='canvas-sketch-cli'
end

# entr
if type -q entr
  # watch sh
  alias watch="watch"

  # function for watch file and execute after save
  function watch
    if test -e $argv
      set file_extension (echo $argv | awk -F . '{print $NF}')

      if [ $file_extension = 'sh' ]
        find $argv | entr -cr ./$argv 
      else if [ $file_extension = 'js' ]
        find $argv | entr -cr node $argv
      end
    else
      echo "Arquivo não existe: $argv"
    end
  end # watch
end

# exa
if type -q exa
  alias ls='exa --color=always --group-directories-first'
  alias tree='exa -T'
end

# fish
if type -q fish
  abbr -a -g fr source $HOME/.config/fish/config.fish
  abbr -a -g sof source $HOME/.config/fish/config.fish
end

# fzf
# ctrl-t - Paste the selected files and directories onto the command-line
# ctrl-r - Paste the selected command from history onto the command-line
#  alt-c - cd into the selected directory
if type -q fzf
  set -gx FZF_DEFAULT_OPTS "
  --height 50% --reverse
  --color=fg:#'$shade7',bg:#'$shade0',hl:#'$accent5'
  --color=fg+:#'$shade7',bg+:#'$shade2',hl+:#'$accent5',gutter:#'$shade0'
  --color=info:#'$shade3',prompt:#'$accent3',pointer:#'$shade7'
  --color=marker:#'$shade7',spinner:#'$shade7',header:#'$shade7'
  --color=border:#'$shade4'
  --preview 'bat -n --color=always {}'"
end

# git
if type -q git
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
end

# gum
if type -q gum
  set -gx GUM_FILTER_INDICATOR '>'
  set -gx GUM_FILTER_INDICATOR_FOREGROUND '#'$accent5
  set -gx GUM_INPUT_CURSOR_FOREGROUND '#'$shade7
  set -gx GUM_INPUT_PROMPT_FOREGROUND '#'$shade7
  set -gx GUM_INPUT_PLACEHOLDER "What's up?"
  set -gx GUM_INPUT_PROMPT "* "
  set -gx GUM_CHOOSE_CURSOR_FOREGROUND '#'$accent5
  set -gx GUM_CHOOSE_ITEM_FOREGROUND '#'$shade7
  set -gx GUM_CHOOSE_SELECTED_FOREGROUND '#'$shade7
end

# helix
if type -q helix
  alias h='helix'
  alias hx='helix'
  alias hc='helix $HOME/.config/helix/config.toml'
end

# nvim and configs
if type -q nvim
  alias v='nvim'
  alias ac='nvim $HOME/.config/alacritty/alacritty.yml'
  alias bc='nvim $HOME/.config/bspwm/bspwmrc'
  alias dfc='nvim $HOME/Dev/dotfiles/setup.sh'
  alias fc='nvim $HOME/.config/fish/config.fish'
  alias kc='nvim $HOME/.config/kitty/kitty.conf'
  alias pc='nvim $HOME/.config/polybar/config.ini'
  alias tc='nvim $HOME/.tmux.conf'
  alias rc='nvim $HOME/.config/rofi/config.rasi'
  alias sc='nvim $HOME/.config/sxhkd/sxhkdrc'
  alias vc='nvim $HOME/.config/nvim/init.lua'
  alias vo='nvim $HOME/.config/nvim/lua/config/options.lua'
  alias vm='nvim $HOME/.config/nvim/lua/config/keymaps.lua'
  alias vp='nvim $HOME/.config/nvim/lua/plugins/init.lua'
  alias vpkg='nvim $HOME/_packages/main.sh'
  alias vt='nvim $HOME/.config/nvim/lua/config/theme.lua'
end

# lazygit
if type -q lazygit
  alias lg='lazygit'
end

# mpv
if type -q mpv
  alias m='mpv'
end

# npm
if type -q npm
  # set -gx NO_COLOR true
  alias npmi='npm install'
  alias npms='npm start'
  alias npmr='npm remove'
  alias npmu='npm update'
end


# pacman
if type -q pacman
  alias pac='sudo pacman'
  alias paci='sudo pacman -S'
  alias pacr='sudo pacman -R'
  alias pacu='sudo pacman -Syu'
end

# ranger
if type -q ranger
  alias r='ranger'
end

# tmux
if type -q tmux
  alias t='tmux'
end

# vifm
if type -q vifm
  alias vfm='vifm .'
end

# vlang
alias vl='$HOME/.v/vl'
alias vh='$HOME/.v/vl help'
alias vf='$HOME/.v/vl fmt -w'
alias vr='$HOME/.v/vl run'
alias vu='$HOME/.v/vl up'
alias vw='$HOME/.v/vl watch'

# yarn
if type -q yarn
  # set -gx FORCE_COLOR 0
  alias ya='yarn add'
  alias yb='yarn build'
  alias yc='yarn autoclean'
  alias yd='yarn dev'
  alias yh='yarn help'
  alias ydp='yarn deploy'
  alias yi='yarn add'
  alias yr='yarn remove'
  alias ys='yarn start'
  alias yt='yarn test'
  alias yu='yarn upgrade'
  alias yv='yarn version'
end

# yay
if type -q yay
  alias yayi='yay -S'
  alias yayr='yay -R'
  alias yayu='yay -Syu'
end

# youtube-dl
if type -q youtube-dl
  alias ytdl="ytdl"
  abbr -a ytdlm Max 'youtube-dl'

  function ytdl
    youtube-dl -x --audio-format mp3 "$argv"
  end
end

# Functions

# Default prompt
function fish_prompt
  echo ''
  set_color cyan; echo (pwd) 
  set_color green; echo '❯ '
end

# Create dir and enter
function mkcd
  mkdir -p $argv && cd $argv
end

# Inits

# Init starship prompt
if type -q starship
  starship init fish | source
end

# Init zoxide
if type -q zoxide
  zoxide init fish | source
end

# Enable vi mode
# fish_vi_key_bindings

# To go back to default mode
# fish_default_key_bindings

# active keybinds vim
# function fish_user_key_bindings
#   # mappings
#   # bind -M insert -m default kj backward-char force-repaint
#   bind -m default L end-of-line
#   bind -m default H beginning-of-line
#
#   # fish shortcuts
#   bind -M insert \cf accept-autosuggestion
#   bind -M insert \cj history-search-backward
#   bind -M insert \cn history-search-backward
#   bind -M insert \ck history-search-forward
#   bind -M insert \cp history-search-forward
# end

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

# Plugin ssh
# fish_ssh_agent

# Colors
# https://fishshell.com/docs/current/interactive.html#variables-color
# defaults: black, red, green, yellow, blue, magenta, cyan, white

# Links
# https://superuser.com/questions/603359/how-do-i-install-make-a-custom-prompt-for-fish-shell
# https://github.com/jwkvam/fish-config/blob/master/config.fish
# https://minsw.github.io/fzf-color-picker

# colorize man pages
# color  fg bg
# black  30 40 	
# red    31 41 	
# green  32 42 	
# yellow 33 43 	
# blue   34 44 	
# purple 35 45 	
# cyan   36 46 	
# white	 37 47

# Headers blue
set -xU LESS_TERMCAP_md (printf "\e[01;34m")

# Body attribute value
set -xU LESS_TERMCAP_us (printf "\e[01;32m")

# Statusline
set -xU LESS_TERMCAP_so (printf "\e[01;40;37m")

# Body sem cor suja muito o documento
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_ue (printf "\e[0m")


