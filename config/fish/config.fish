# Remove greeting
set fish_greeting

# Colors
set -g fish_color_autosuggestion white
set -g fish_color_cancel red
set -g fish_color_command fg
set -g fish_color_comment white
set -g fish_color_cwd yellow
set -g fish_color_cwd_root red
set -g fish_color_end yellow
set -g fish_color_error red
set -g fish_color_escape fg
set -g fish_color_history_current white
set -g fish_color_host blue
set -g fish_color_host_remote blue
set -g fish_color_keyword fg
set -g fish_color_match --background=blue
set -g fish_color_normal fg
set -g fish_color_operator fg
set -g fish_color_option fg
set -g fish_color_param fg
set -g fish_color_quote green
set -g fish_color_redirection purple
set -g fish_color_status fg
set -g fish_color_search_match --background=brblack
set -g fish_color_selection --background=blue
set -g fish_color_user cyan
set -g fish_color_valid_path green

# Pager colors
set -g fish_pager_color_completion fg
set -g fish_pager_color_description fg
set -g fish_pager_color_prefix blue
set -g fish_pager_color_progress white

# Aliases
source $HOME/.config/shell/aliases.sh

# Abbreviations
abbr -a -g fs source $HOME/.config/fish/config.fish

# Functions

# ssh login 
function ssha
  if test -z "$SSH_AUTH_SOCK"
    eval (ssh-agent -c)
    ssh-add -k
  end
end

# zoxide
if type -q zoxide
  zoxide init fish | source
  # zoxide init --cmd f fish | source

  alias zo='zoxide_open'
  function zoxide_open
    zoxide query $argv | xargs dolphin & 
  end
end

# starship
if type -q starship
  starship init fish | source
else
  function fish_prompt
    set_color cyan; echo \n(pwd) 
    set_color green; echo '❯ '
  end
end

# References
# https://fishshell.com/docs/current/interactive.html#variables-color
# black, brblack 
