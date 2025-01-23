# Enable options
shopt -s extglob
shopt -s globstar

# Copy file content to clipboard
clip() {
  if [[ ! -f "$1" ]]; then
    xclip -selection clipboard -i "$1"
  else
    echo 'error: no file selected'
    return 1
  fi
}

# Copy and go to the directory
cpcd() {
	if [[ -d "$2" ]]; then
		cp "$1" "$2" && cd "$2"
	else
		cp "$1" "$2"
	fi
}

# Extract files
ex() {
  if [[ -f "$1" ]]; then
    case $1 in
      *.7z)   7z x $1       ;;
      *.bz2)  bunzip2 $1    ;;
      *.deb)  ar x $1       ;;
      *.gz)   gunzip $1     ;;
      *.rar)  unrar x $1    ;;
      *.tar)  tar xf $1     ;;
      *.tbz2) tar xjf $1    ;;
      *.tgz)  tar xzf $1    ;;
      *.xz)   tar xf $1     ;;
      *.zip)  unzip $1      ;;
      *.zst)  unzstd $1     ;;
      *.Z)    uncompress $1 ;;
      *)      echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "error: $1 is not a valid file"
    return 1
  fi
}

# Font list
fl() {
  fc-list | awk -F: '{print $2}' | sort | uniq | grep -v Noto
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
  local msg="$*"
  if [[ -z "$msg" ]]; then
    echo "error: no commit message provided"
    return 1
  fi
  git add -A
  git commit -m "${msg^}"
  git push
}

# Update doftiles
gpdf() {
  local msg="$*"
  local dotdir="$HOME/Dev/dotfiles"
  [[ -z "$msg" ]] && msg="Update dotfiles"

  # Git commands
  cd "$dotdir"
  git add -A
  git commit -m "${msg^}"
  git push
  cd - >/dev/null
}

# Convert rgb to hex
hex() {
  printf "#%02x%02x%02x" ${*//','/' '}
}

# Return text of htmlq
htm() {
  if ! type htmlq >& /dev/null; then
    echo 'htmlq not exist'
    return 1
  fi

  [[ "$1"  && "$2" ]] || {
    echo 'usage: htm <link> <element>'
    return 1
  }

  curl -s $1 | htmlq -t $2
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
  $EDITOR +1 $file
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
    echo 'usage: mvext <old extension> <new extension>'
    return 1
  }
  for file in *.$1; do
    mv "$file" "${file%.$1}.$2"
  done
  return 0
}

# Rename files to lower case and replace spaces to - 
mvlo() {
  for file in *; do
    newname="${file,,}"
    newname="${newname//[áãâ]/a}"
    newname="${newname//[éê\&]/e}"
    newname="${newname//[í]/i}"
    newname="${newname//[óõô]/o}"
    newname="${newname//[ú]/u}"
    newname="${newname//[ç]/c}"
    newname="${newname//\(/}"
    newname="${newname//\)/}"
    newname="${newname// /-}"
    mv "$file" "$newname" 2>/dev/null
  done
  echo 'finished'
}

# Rename files to upper case and replace spaces to - 
mvup() {
  for file in *; do
    newname="${file^^}"
    newname="${file//[ÁÃÂ]/A}"
    newname="${file//[É]/E}"
    newname="${file//[Í]/I}"
    newname="${file//[Ó]/O}"
    newname="${file//[Ú]/U}"
    newname="${file//[Ç]/C}"
    newname="${newname// /-}"
  done
  echo 'finished'
}

# Rename substitute word
mvs() {
  [[ $1 && $2 ]] || {
    echo 'usage: mvs <old word> <new word>'
    return 1
  }
  for file in *; do
    mv "$file" "${file/$1/$2}"
  done
  return 0
}

# Link in working dir
lnwd() {
  [[ $1 && $2 ]] || {
    echo 'usage: lnwd <file-or-dir> <path>'
    return 1
  }
  ln -sf "$(pwd)/$1" $2
}

# Play
play() {
  if type mpv >& /dev/null; then
    local music="$HOME/Music"
    local args="--no-video --display-tags=Title,Artist"

    usage() {
      echo -e "\nr  Recents\ns  Search"; return 1
    }

    to_play() {
      if [[ -d "$1" ]]; then
        find "$1" -type f -name "*.mp3" -exec mpv $args {} +
        # ls -R "$1" | awk '!/:$/ && !/^$/ {print $NF}' | xargs mpv $args
      elif [[ "$1" =~ ^"http" ]]; then
        mpv $args "$1"
      else
        mpv $args **/*.mp3
      fi
    }

    case "$1" in
      @(ani?(me)))        to_play "$music/j-music/anime"                          ;;
      @(brian|bc))        to_play "$music/jazz/brian-cullberston"                 ;;
      @(jaz?(z)))         to_play "$music/jazz"                                   ;;
      h)                  usage                                                   ;;
      @(hiro))            to_play "$music/j-music/hiroyuki-sawano"                ;;
      lof|lofi)           to_play "https://www.youtube.com/live/jfKfPfyJRdk"      ;;
      @(mj|michael))      to_play "$music/lentas/michael-jackson"                 ;;
      ost)                to_play "$music/ost"                                    ;;
      @(r?(ecent)?(s)))   ls -t "$music"/** | head -n 30 | xargs mpv $args        ;;
      @(retro?(wave)))    to_play "$music/retrowave"                              ;;
      @(s?(earch)))       find "$music" -iname *"$2"*.mp3 | fzf | xargs mpv $args ;;
      @(syn?(th)?(wave))) to_play "https://www.youtube.com/live/4xDzrJKXOOY"      ;;
      *)                  to_play $1                                              ;;
    esac
  fi
}

# Play recents
playr() {
  local number=30
  [[ $1  =~ ^[0-9]+$ ]] && number=$1
  ls $HOME/Music/** -t | head -n $number | xargs mpv --no-video --display-tags=Title,Artist
}

# History find command use: ctrl+r
# hf() {
#   local cmd=$(history | fzf --tac | awk '{ print $4 }')
#   $cmd
# }

# Open rc configs
rc() {
  local rcfiles=(\
    "$HOME/.bashrc" \
    "$HOME/.bash_aliases" \
    "$HOME/.bash_functions" \
    "$HOME/.config/bspwm/autostart" \
    "$HOME/.config/bspwm/config" \
    "$HOME/.config/bspwm/rules" \
    "$HOME/.config/bspwm/shortcuts" \
    "$HOME/.config/bspwm/dunst/dunstrc" \
    "$HOME/.config/bspwm/jgmenu/jgmenurc" \
    "$HOME/.config/bspwm/picom/picom.conf" \
    "$HOME/.config/bspwm/polybar/config.ini" \
    "$HOME/.config/kitty/kitty.conf" \
    "$HOME/.config/nvim/init.lua" \
    "$HOME/.config/rofi/config.rasi" \
    "$HOME/.config/tmux/tmux.conf" \
  )

  rcfile=$(IFS=$'\n'; echo "${rcfiles[*]}" | fzf)
  [[ "$rcfile" ]] && $EDITOR "$rcfile"
  # $EDITOR $(printf '%s\n' "${rcfiles[@]}" | fzf)
}

# Remove extension
rmext() {
  [[ $1 ]] || { echo 'usage: rmext <extension>'; return 1; }
  for file in *.$1; do
    mv "$file" "${file%.$1}"
  done
  return 0
}

# SSH Add Agent
ssha() {
  eval "$(ssh-agent -s)"
  ssh-add -k
}

# Start starship
starship() {
  if type -P starship > /dev/null; then
    eval "$(starship init bash)"
  fi
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

xevk() {
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

xf() {
  local sassdir="$HOME/.local/share/themes/Lightly/gtk-3.0/src"
  local mainsass="$HOME/.local/share/themes/Lightly/gtk-3.0/src/main.scss"
  local gtkcss="$HOME/.local/share/themes/Lightly/gtk-3.0/gtk.css"
  while true; do
    inotifywait -m -e modify $sassdir/** | \
    sassc -Mt expanded $mainsass $gtkcss && \
    xfconf-query -c xsettings -p /Net/ThemeName -r && \
    xfconf-query -c xsettings -p /Net/ThemeName -s Lightly
  done
}

wkde() {
  local file; read -p "Enter a filename of color: " file
  file="$HOME/.local/share/color-schemes/$file.colors"

  [[ -f "$file" ]] || { 
    echo "file not exist"
    return 1
  }

  while true; do
    plasma-apply-colorscheme BreezeDark > /dev/null
    inotifywait -m $file | \
    plasma-apply-colorscheme AOneDark > /dev/null
  done
}

# vim:ft=bash
