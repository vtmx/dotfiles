#!/usr/bin/env bash

# Check if fzf exist
if type fzf > /dev/null; then
  # List themes
  theme_name=$(plasma-apply-colorscheme --list-schemes | fzf)

  # Format theme name
  theme_name=$(sed 's/ \* //' <<< $theme_name)

  # Apply theme name
  plasma-apply-colorscheme $theme_name
else
  echo "Command fzf not exist, install in:
https://github.com/junegunn/fzf#installation"
fi

# References
# https://www.reddit.com/r/kde/comments/8oq8vm/change_kde_color_scheme_from_terminal
# https://stackoverflow.com/questions/35920314/have-sed-operate-on-variable-instead-of-standard-input-or-a-file
# https://terminalroot.com.br/2015/07/30-exemplos-do-comando-sed-com-regex.html
# https://www.mankier.com/1/fzf
# https://www.redhat.com/sysadmin/fzf-linux-fuzzy-finder
