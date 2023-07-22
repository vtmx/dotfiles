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
set -gx BROWSER 'firefox'
set -gx CODE 'code'
set -gx EDITOR 'nvim'
set -gx VISUAL 'nvim'

# Aliases
source $HOME/.config/shell/aliases.sh


# Abbreviations
abbr -a -g fs source $HOME/.config/fish/config.fish

# fzf
# ctrl-t - Paste the selected files and directories onto the command-line
# ctrl-r - Paste the selected command from history onto the command-line
# alt-c  - cd into the selected directory
if type -q fzf
  set -gx FZF_DEFAULT_OPTS "
  --height 50% --reverse
  --color=fg:#'$foreground',bg:#'$background',hl:#'$blue'
  --color=fg+:#'$foreground',bg+:#'$selection',hl+:#'$blue',gutter:#'$background'
  --color=info:#'$comment',prompt:#'$green',pointer:#'$foreground'
  --color=marker:#'$foreground',spinner:#'$foreground',header:#'$foreground'
  --color=border:#'$comment'"
  # --preview 'bat -n --color=always {}'"
end

# Functions

# Default prompt
function fish_prompt
  echo ''
  set_color cyan; echo (pwd) 
  set_color green; echo '❯ '
end

# ssh login 
function ssha
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
# https://minsw.github.io/fzf-color-picker

# Colorize man pages
# black
# brblack 
# red
# green
# yellow
# blue
# purple
# cyan
# white	
# brwhite
