# Remove greeting
set fish_greeting

# Colors
set -g fish_color_autosuggestion normal
set -g fish_color_cancel red
set -g fish_color_command normal
set -g fish_color_comment normal
set -g fish_color_cwd yellow
set -g fish_color_cwd_root red
set -g fish_color_end yellow
set -g fish_color_error red
set -g fish_color_escape normal
set -g fish_color_history_current normal
set -g fish_color_host blue
set -g fish_color_host_remote blue
set -g fish_color_keyword normal
set -g fish_color_match --background=blue
set -g fish_color_normal normal
set -g fish_color_operator normal
set -g fish_color_option normal
set -g fish_color_param normal
set -g fish_color_quote green
set -g fish_color_redirection purple
set -g fish_color_status normal
set -g fish_color_search_match --background=brblack
set -g fish_color_selection --background=blue
set -g fish_color_user cyan
set -g fish_color_valid_path green

# Pager colors
set -g fish_pager_color_completion normal
set -g fish_pager_color_description normal
set -g fish_pager_color_prefix blue
set -g fish_pager_color_progress normal

# Aliases
if test -f "$HOME/.bash_aliases"
  source "$HOME/.bash_aliases"
end

# Start ssh connection 
function ssha
  if test -z "$SSH_AUTH_SOCK"
    eval (ssh-agent -c)
    ssh-add -k
  end
end

# Abbreviations
abbr -a fs source "$HOME/.config/fish/config.fish"
abbr -a df "$HOME/Dev/dotfiles"

if type -q fzf
  set -gx FZF_DEFAULT_OPTS "
  --height 50% --reverse
  --prompt '❯ ' --pointer '❯ ' --marker '❯ '
  --color=bg:-1,fg:-1
  --color=bg+:bright-black,fg+:-1
  --color=hl:blue,hl+:blue
  --color=info:-1,marker:blue
  --color=prompt:green,spinner:green
  --color=pointer:-1,header:-1
  --color=gutter:-1,border:black
  --border none"
end

# Functions
function mkcd -d "Create dir and enter"
  if test -n "$argv"
    mkdir -p $argv && cd $argv
  else
    echo "error: dirname not exist"
    exit 1
  end
end

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
    if test -n "$DISPLAY"
      set_color green; echo '❯ '
    else
      set_color green; echo '> '
    end
  end
end

# References
# https://fishshell.com/docs/current/interactive.html#variables-color
# black, brblack 
