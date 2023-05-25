# remove greeting
set fish_greeting

# Colors
set -l background 23272e
set -l foreground abb2bf
set -l selection 3d4556
set -l comment 5c6370
set -l red e06c75
set -l orange d19a66
set -l yellow e5c07b
set -l green 98c379
set -l cyan 56b6c2
set -l blue 61afef
set -l purple c678dd

# Syntaxy
set -g fish_color_autosuggestion $comment
set -g fish_color_cancel $red
set -g fish_color_command $foreground
set -g fish_color_comment $comment
set -g fish_color_cwd $yellow
set -g fish_color_cwd_root $red
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_escape $foreground
set -g fish_color_history_current $comment
set -g fish_color_host $blue
set -g fish_color_host_remote $blue
set -g fish_color_keyword $foreground
set -g fish_color_match --background=$blue
set -g fish_color_normal $foreground
set -g fish_color_operator $foreground
set -g fish_color_option $foreground
set -g fish_color_param $foreground
set -g fish_color_quote $green
set -g fish_color_redirection $purple
set -g fish_color_status $foreground
set -g fish_color_search_match --background=$selection
set -g fish_color_selection --background=$blue
set -g fish_color_user $cyan
set -g fish_color_valid_path $green

# Pager colors
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_prefix $blue
set -g fish_pager_color_progress $comment

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
alias cls='clear'
alias chx='chmod +x'
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
alias cdt='cd $HOME/Downloads/temp'
alias cdgame='cd $HOME/Games'
alias cdmus='cd $HOME/Music'
alias cdpic='cd $HOME/Pictures'
alias cdsof='cd $HOME/Softwares'
alias cdvid='cd $HOME/Videos'
alias cdd='cd $HOME/Dev/dotfiles'
alias cdc='cd $HOME/Dev/dotfiles/config'
alias cdp='cd $HOME/Dev/projects'
alias cdf='cd $HOME/Dev/projects/fraseologia'
alias cdv='cd $HOME/Dev/projects/vitormelo'
alias cds='cd $HOME/Dev/shortcuts'
alias cdmoz='cd $HOME/.mozilla/firefox/ph8r9j57.default-release/chrome'
alias cdpkg='cd $HOME/_packages'

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
  alias canva='canvas-sketch-cli'
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
  --color=fg:#'$foreground',bg:#'$background',hl:#'$blue'
  --color=fg+:#'$foreground',bg+:#'$selection',hl+:#'$blue',gutter:#'$background'
  --color=info:#'$comment',prompt:#'$green',pointer:#'$foreground'
  --color=marker:#'$foreground',spinner:#'$foreground',header:#'$foreground'
  --color=border:#'$comment'
  --preview 'bat -n --color=always {}'"
end

# git
if type -q git
  alias g='git'
  alias gaa='git add --all'
  alias gcm='git_commit'
  alias gco='git checkout'
  alias gcb='git checkout -b'
  alias gcl='git clone'
  alias gb='git branch'
  alias gbd='git branch -d'
  alias gl='git pull'
  alias gp='git push'

  function git_commit
    set msg $argv[1]

    if test -n "$msg"
      git commit -m "$msg"
    else
      git commit -m "update"
    end
  end
end

# gum
if type -q gum
  set -gx GUM_FILTER_INDICATOR '>'
  set -gx GUM_FILTER_INDICATOR_FOREGROUND '#'$blue
  set -gx GUM_INPUT_CURSOR_FOREGROUND '#'$foreground
  set -gx GUM_INPUT_PROMPT_FOREGROUND '#'$foreground
  set -gx GUM_INPUT_PLACEHOLDER "What's up?"
  set -gx GUM_INPUT_PROMPT "* "
  set -gx GUM_CHOOSE_CURSOR_FOREGROUND '#'$blue
  set -gx GUM_CHOOSE_ITEM_FOREGROUND '#'$foreground
  set -gx GUM_CHOOSE_SELECTED_FOREGROUND '#'$foreground
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
  alias npmd='npm run dev'
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
  alias yi='yarn install'
  alias yr='yarn remove'
  alias ys='yarn start'
  alias yte='yarn test'
  alias yu='yarn upgrade'
  alias yv='yarn version'
end

# yay
if type -q yay
  alias yayi='yay -S'
  alias yayr='yay -R'
  alias yayu='yay -Syu'
end

# yt-dlp youtube 
if type -q yt-dlp
  alias yt="yt_dow_meta"
  alias ytd="yt_dow"

  # Download song of YouTube with metadata
  function yt_dow_meta
    set url $argv[1]
    set name $argv[2]

    if test -n "$name"
      yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata -o "$name" "$url"
    else
      yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata -o "%(title)s.%(ext)s" "$url"
    end
  end

  # Download song of YouTube
  function yt_dow
    set url $argv[1]
    set name $argv[2]

    if test -n "$name"
      yt-dlp -x --audio-format mp3 --embed-thumbnail -o "$name" "$url"
    else
      yt-dlp -x --audio-format mp3 --embed-thumbnail -o "%(title)s.%(ext)s" "$url"
    end
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

# Unzip and enter
function uzcd
  unzip $argv && cd $argv
end

# ssh login 
function ssl
  if test -z "$SSH_AUTH_SOCK"
    eval (ssh-agent -c)
    ssh-add -k
  end
end

# Inits

# starship
if type -q starship
  starship init fish | source
end

# zoxide
if type -q zoxide
  zoxide init fish | source

  # custom key
  # zoxide init --cmd f fish | source

  alias zo='zoxide_open'

  function zoxide_open
    zoxide query $argv | xargs dolphin & 
  end
end

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

# References
# https://fishshell.com/docs/current/interactive.html#variables-color
# https://superuser.com/questions/603359/how-do-i-install-make-a-custom-prompt-for-fish-shell
# https://github.com/jwkvam/fish-config/blob/master/config.fish
# https://minsw.github.io/fzf-color-picker

# Defaults colors:
# black, red, green, yellow, blue, purple, cyan, white

# Colorize man pages
# color  fg bg
# black  30 40 	
# red    31 41 	
# green  32 42 	
# yellow 33 43 	
# blue   34 44 	
# purple 35 45 	
# cyan   36 46 	
# white	 37 47
