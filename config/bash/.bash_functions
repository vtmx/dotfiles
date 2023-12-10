# Enable options
shopt -s extglob
shopt -s globstar

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

  # Copy nvim folder
  rm -rdf "$HOME/Dev/dotfiles/config/nvim" > /dev/null
  cp -r "$HOME/.config/nvim" "$HOME/Dev/dotfiles/config/nvim" > /dev/null

  # Go to dotfiles dir
  cd "$dotfiles_dir" 

  # Git commands
  git add -A
  git commit -m "$message"
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

# Play
play() {
  if type mpv >& /dev/null; then
    local music="$HOME/Music"
    local args="--no-video"

    # If subdir play like playlist
    to_play() {
      # if ls -d */ > /dev/null; then
      #   ls $1/**/*.mp3 > /tmp/playlist && mpv $args --playlist=/tmp/playlist
      #   rm -f /tmp/playlist
      # else
        mpv $args $1
      # fi
    }

    case "$1" in
      @(ani?(me)))        to_play "$music/j-music/anime"                        ;;
      @(brian|bc))        to_play "$music/jazz/brian-cullberston"               ;;
      @(jaz?(z)))         to_play "$music/jazz"                                 ;;
      lofi)               to_play "https://www.youtube.com/live/jfKfPfyJRdk"    ;;
      @(mj|michael))      to_play "$music/lentas/michael-jackson"               ;;
      ost)                to_play "$music/ost"                                  ;;
      @(retro?(wave)))    to_play "$music/retrowave"                            ;;
      @(syn?(th)?(wave))) to_play "https://www.youtube.com/live/4xDzrJKXOOY"    ;;
      *)                  to_play $1                                            ;;
    esac
  fi
}

# Add ssh
ssha() {
  eval "$(ssh-agent -s)"
  ssh-add -k
}

# Watch file
watch() {
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

# vim:ft=sh
