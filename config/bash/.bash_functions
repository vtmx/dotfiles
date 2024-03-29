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

# Simplified git commit
gc() {
  if [[ -n "$1" ]]; then
    git commit -m "$*"
  else
    echo "error: no commit message provided"
    return 1
  fi
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

# Git add, commit and push
gP() {
  git add -A
  if ! gc $1; then return 1; fi
  git push
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
mvcd () {
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

# Play
play() {
  if type mpv >& /dev/null; then
    local music="$HOME/Music"
    local args="--no-video --display-tags-clr"

    # If subdir play like playlist
    to_play() {
      if [[ -d "$1" ]]; then
        mpv $args --playlist=- <<< ls "$1"/** 2>&-
      elif [[ "$1" =~ ^"http" ]]; then
        mpv $args "$1"
      else
        mpv $args *
      fi
    }

    case "$1" in
      @(ani?(me)))        to_play "$music/j-music/anime"                        ;;
      @(brian|bc))        to_play "$music/jazz/brian-cullberston"               ;;
      @(jaz?(z)))         to_play "$music/jazz"                                 ;;
      @(hiro|sawa))       to_play "$music/j-music/hiroyuki-sawano"              ;;
      lofi)               to_play "https://www.youtube.com/live/jfKfPfyJRdk"    ;;
      @(mj|michael))      to_play "$music/lentas/michael-jackson"               ;;
      ost)                to_play "$music/ost"                                  ;;
      @(retro?(wave)))    to_play "$music/retrowave"                            ;;
      @(syn?(th)?(wave))) to_play "https://www.youtube.com/live/4xDzrJKXOOY"    ;;
      *)                  to_play $1                                            ;;
    esac
  fi
}

# SSH Add Agent
ssa() {
  eval "$(ssh-agent -s)"
  ssh-add -k
}

# Watch file
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

# vim:ft=sh
