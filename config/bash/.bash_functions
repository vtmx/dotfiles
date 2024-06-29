# Enable options
shopt -s extglob
shopt -s globstar

# Copy and go to the directory
cpcd() {
	if [[ -d "$2" ]]; then
		cp "$1" "$2" && cd "$2"
	else
		cp "$1" "$2"
	fi
}

# Cheat curl cht.sh/:styles-demo
cheat() {
  if [[ "$1" ]]; then 
    curl "https://cheat.sh/$1"
  else
    echo 'command not exit'
  fi
}

# Extract
ex() {
  if [[ -f "$1" ]]; then
    case $1 in
      *.tar.bz2) tar xjf $1   ;;
      *.tar.gz)  tar xzf $1   ;;
      *.bz2)     bunzip2 $1   ;;
      *.rar)     unrar x $1   ;;
      *.gz)      gunzip $1    ;;
      *.tar)     tar xf $1    ;;
      *.tbz2)    tar xjf $1   ;;
      *.tgz)     tar xzf $1   ;;
      *.zip)     unzip $1     ;;
      *.Z)       uncompress $1;;
      *.7z)      7z x $1      ;;
      *.deb)     ar x $1      ;;
      *.tar.xz)  tar xf $1    ;;
      *.tar.zst) unzstd $1    ;;
      *)         echo "'$1' cannot be extracted.";;
    esac
  else
    echo "error: $1 is not a valid file"
    return 1
  fi
}

# Simplified git commit
gc() {
  if [[ -n "$1" ]]; then
    git commit -m "$*"
  else
    echo "error: no commit message provided"
    return 1
  fi
}

# Git add, commit and push
gpa() {
  git add -A
  git commit -m "$*"
  git push
}

# Update doftiles
gpdf() {
  echo

  local message="$*"
  local dotfiles_dir="$HOME/Dev/dotfiles"

  # If empty string
  [[ -z "$message" ]] && message="update dotfiles"

  # Git commands
  cd "$dotfiles_dir"
  git add -A
  git commit -m "$message"
  git push
}

# Convert rgb to hex
hex() {
  printf "#%02x%02x%02x" ${*//','/' '}
}

# Create dir and enter
mkcd() {
  if [[ -n $1 ]]; then
    mkdir -p "$1" && cd "$1"
  else
    echo "error: dirname not exist"
    return 1
  fi
}

# Create a diary file
mkdia() {
  local file=$(date +'%Y-%m-%d').md
  [[ -n $1 ]] && title=$1 || title="Título"
  echo -e "# ${title^}\n$(date +'%d-%m-%Y')\n\n" > $file
  $EDITOR +4 $file
}

# Create shell file
mksh() {
  local file="$1"

  # Test if has argument
  [[ -z "$file" ]] && echo "error: need a name for script" && return 1

  # Check if file exit
  [[ -e "$file" ]] && echo "error: file already exist" && return 1

  # Create script
  echo "#!/usr/bin/env bash

  " > "$file"

  # Make script executable and open script
  chmod +x "$file" && $EDITOR +3 "$file"
}

# Move and go to the directory
mvcd() {
	if [[ -d "$2" ]];then
		mv "$1" "$2" && cd "$2"
	else
		mv "$1" "$2"
	fi
}

# Rename extension
mvext() {
  [[ $1 && $2 ]] || {
    echo 'usage: mvext [old extension] [new extension]'
    return 1
  }

  for file in *.$1; do
    mv "$file" "${file%.$1}.$2"
  done

  return 0
}

# Rename files to lower case and replace spaces to - 
mvlower() {
  for file in *; do
    newname="${file,,}"
    newname="${newname//[áãâ]/a}"
    newname="${newname//[é]/e}"
    newname="${newname//[í]/i}"
    newname="${newname//[ó]/o}"
    newname="${newname//[ú]/u}"
    newname="${newname//[ç]/c}"
    newname="${newname//\(/}"
    newname="${newname//\)/}"
    newname="${newname// /-}"
    mv "$file" "$newname" >/dev/null
  done
}

# Rename files to upper case and replace spaces to - 
mvupper() {
  for file in *; do
    newname="${file^^}"
    newname="${file//[ÁÃÂ]/A}"
    newname="${file//[É]/E}"
    newname="${file//[Í]/I}"
    newname="${file//[Ó]/O}"
    newname="${file//[Ú]/U}"
    newname="${file//[Ç]/C}"
    newname="${newname// /-}"
    mv "$file" "$newname" >/dev/null
  done
}


# Play
play() {
  if type mpv >& /dev/null; then
    local music="$HOME/Music"
    local args="--no-video --display-tags=Title,Artist"
    # local args="--no-video --display-tags=Title,Artist --quiet=yes"

    # If subdir play like playlist
    to_play() {
      if [[ -d "$1" ]]; then
        find "$1" -type f -name "*.mp3" -exec mpv $args {} +
      elif [[ "$1" =~ ^"http" ]]; then
        mpv $args "$1"
      else
        mpv $args **/*.mp3
      fi
    }

    case "$1" in
      @(ani?(me)))        to_play "$music/j-music/anime"                        ;;
      @(brian|bc))        to_play "$music/jazz/brian-cullberston"               ;;
      @(jaz?(z)))         to_play "$music/jazz"                                 ;;
      @(hiro))            to_play "$music/j-music/hiroyuki-sawano"              ;;
      lof|lofi)           to_play "https://www.youtube.com/live/jfKfPfyJRdk"    ;;
      @(mj|michael))      to_play "$music/lentas/michael-jackson"               ;;
      ost)                to_play "$music/ost"                                  ;;
      @(retro?(wave)))    to_play "$music/retrowave"                            ;;
      @(syn?(th)?(wave))) to_play "https://www.youtube.com/live/4xDzrJKXOOY"    ;;
      *)                  to_play $1                                            ;;
    esac
  fi
}

# Open rc configs
rc() {
  local rcfiles=(\
    "$HOME/.bashrc" \
    "$HOME/.bash_functions" \
    "$HOME/.bash_aliases" \
    "$HOME/.bashrc" \
    "$HOME/.bash_functions" \
    "$HOME/.config/bspwm/bspwmrc" \
    "$HOME/.config/dunst/dunstrc" \
    "$HOME/.config/kitty/kitty.conf" \
    "$HOME/.config/nvim/init.lua" \
    "$HOME/.config/openbox/rc.xml" \
    "$HOME/.config/polybar/config.ini" \
    "$HOME/.config/sxhkd/sxhkdrc" \
    "$HOME/.config/tmux/tmux.conf" \
  )

  $EDITOR $(IFS=$'\n'; echo "${rcfiles[*]}" | fzf)
  # $EDITOR $(printf '%s\n' "${rcfiles[@]}" | fzf)
}

# List only hidden files
lsa() {
  for file in .*; do echo "$file"; done | column
}

# SSH Add Agent
ssa() {
  eval "$(ssh-agent -s)"
  ssh-add -k
}

# Watch files
wa() {
  if type -P entr >& /dev/null; then
    if [[ -n "$1" ]]; then
      local file=$1
      local ext=$(echo $1 | awk -F . '{print $NF}')

      if [[ $ext = 'sh' ]]; then
        find $file | entr -cr ./$file 
      elif [[ $ext = 'js' ]]; then
        find $file | entr -cr node $file
      elif [[ $ext = 'v' ]]; then
        find $file | entr -cr vl run $file
      fi
    fi
  fi
}

xf() {
  local sassdir="${HOME}/.local/share/themes/Lightly/gtk-3.0/src"
  local mainsass="${HOME}/.local/share/themes/Lightly/gtk-3.0/src/main.scss"
  local gtkcss="${HOME}/.local/share/themes/Lightly/gtk-3.0/gtk.css"

  while true; do
    inotifywait -m -e modify $sassdir/** | \
    sassc -Mt expanded $mainsass $gtkcss && \
    xfconf-query -c xsettings -p /Net/ThemeName -r && \
    xfconf-query -c xsettings -p /Net/ThemeName -s Lightly
  done
}

wkde() {
  local colorfile; read -p "Enter a filename of color: " colorfile
  colorfile="${HOME}/.local/share/color-schemes/${colorfile}.colors"

  [[ -f "$colorfile" ]] || echo "file not exist"; return

  while true; do
    plasma-apply-colorscheme BreezeDark > /dev/null
    inotifywait -m $colorfile | \
    plasma-apply-colorscheme AOneDark > /dev/null
  done
}

# vim:ft=sh
