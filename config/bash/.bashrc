# Aliases

aliases=$HOME/.config/shell/aliases.sh

if [[ -f $aliases ]]; then
  . $aliases
fi

eval "$(starship init bash)"
