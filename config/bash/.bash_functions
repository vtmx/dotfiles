# Enable options
shopt -s extglob globstar

# Copy file content to clipboard
clip() {
  if [[ -f "$1" ]]; then
    xclip -sel clip < "$1"
  else
    echo 'error: no file selected' >&2
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

# Cut audio
cuta() {
  if [[ ! -f "$1" ]]; then
    echo 'error: no first argument ex: file.mp3' >&2; return 1
  fi

  if [[ ! "$2" =~ ^[0-9]{2}:[0-9]{2}$ ]]; then
    echo 'error: no second argument time start ex: 00:00' >&2; return 1
  fi

  if [[ ! "$3" =~ ^[0-9]{2}:[0-9]{2}$ ]]; then
    echo 'error: no third argument time stop ex: 01:00' >&2; return 1
  fi

  local file="$1"
  local start="$2" 
  local stop="$3" 
  local name="${file%.*}"
  local format="${file##*.}"
  local cutfile="$name-cut.$format"

  ffmpeg -i "$file" -ss "$start" -t "$stop" -c copy "$cutfile" && \
    rm "$file" && \
    mv "$cutfile" "$file"
}

# Extract files
ex() {
  if [[ ! -f "$1" ]]; then
    echo "error: $1 is not a valid file" >&2; return 1
  fi

  case $1 in
    *.7z) 7z x $1       ;;
    *.bz2) bunzip2 $1   ;;
    *.deb) ar x $1      ;;
    *.gz) gunzip $1     ;;
    *.rar) unrar x $1   ;;
    *.tar) tar xf $1    ;;
    *.tbz2) tar xjf $1  ;;
    *.tgz) tar xzf $1   ;;
    *.xz) tar xf $1     ;;
    *.zip) unzip $1     ;;
    *.zst) unzstd $1    ;;
    *.Z) uncompress $1 ;;
    *) echo "error: '$1' cannot be extracted" >&2 ;;
  esac
}

# Add extension
addext() {
  [[ $1 ]] || { echo 'usage: addext <extension>' >&2; return 1; }
  rename -n "s/$/\.${1}/" *
  echo; read -p 'Rename [y/N]: ' confirm
  [[ $confirm =~ [yY] ]] && rename "s/$/\.${1}/" *
}

# Rename extension
mvext() {
  [[ $1 && $2 ]] || {
    echo 'usage: mvext <old extension> <new extension>' >&2
    return 1
  }
  rename -n "s/\.${1}$/\.${2}/" *
  echo; read -p 'Rename [y/N]: ' confirm
  [[ $confirm =~ [yY] ]] && rename "s/\.${1}$/\.${2}/" *
}

# Remove extension
rmext() {
  [[ $1 ]] || { echo 'usage: rmext <extension>'; return 1; }
  rename -n "s/\.${1}//" *
  echo; read -p 'Rename [y/N]: ' confirm
  [[ $confirm =~ [yY] ]] && rename "s/\.${1}$/\.${2}/" *
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
    echo "error: no commit message provided" >&2
    return 1
  fi
}

# Git add, commit and push
gpa() {
  local msg="$*"
  if [[ -z "$msg" ]]; then
    echo "error: no commit message provided" >&2
    return 1
  fi
  git add -A
  git commit -m "${msg^}"
  git push
}

# Update doftiles
gpdf() {
  local msg="$*"
  [[ -z "$*" ]] && msg="Update dotfiles"
  local dotdir="$HOME/Dev/dotfiles"

  git -C "$dotdir" add -A
  git -C "$dotdir" commit -m "${msg^}"
  git -C "$dotdir" push
}

# Convert rgb to hex
hex() {
  printf "#%02x%02x%02x" ${*//','/' '}
}

# Return text of htmlq
htm() {
  if ! type htmlq &>/dev/null; then
    echo 'htmlq not exist'
    return 1
  fi

  [[ "$1"  && "$2" ]] || {
    echo 'usage: htm <link> <element>' >&2
    return 1
  }

  curl -s $1 | htmlq -t $2
}

# Man with bat
mb() {
  command man -L pt_BR "$@" | col -bx | bat -plman --theme ansi
}

# Create dir and enter
mkcd() {
  if [[ -n $1 ]]; then
    mkdir -p "$1" && cd "$1"
  else
    echo "error: dirname not exist" >&2
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

  [[ -z "$file" ]] && { echo "error: need a name for script" >&2 && return 1; }
  [[ -e "$file" ]] && { echo "error: file already exist" >&2 && return 1; }
 
  echo -e "#!/usr/bin/env bash\n\n" > "$file"
  chmod +x "$file" && $EDITOR +3 "$file"
}

# Add word beginer file
mva() {
  [[ $1 ]] || { echo 'error: mva <word>' >&2; return 1; }

  rename -n "s/^/${1}/" *
  echo
  read -p 'Rename [y/N]: ' confirm

  if [[ $confirm =~ [yY] ]]; then
    rename "s/^/${1}/" *
  fi
}

# Add word end file
mve() {
  [[ $1 ]] || { echo 'error: mve <word>' >&2; return 1; }

  rename -n "s/(.*)(\..*$)/\1${1}\2/" *
  echo
  read -p 'Rename [y/N]: ' confirm

  if [[ $confirm =~ [yY] ]]; then
    rename "s/(.*)(\..*$)/\1${1}\2/" *
  fi
}

# Move and go to the directory
mvcd() {
  if [[ -d "$2" ]];then
    mv "$1" "$2" && cd "$2"
  else
    mv "$1" "$2"
  fi
}

# Cut
mvcut() {
  [[ $1 ]] || { echo 'error: mvcut <word>' >&2; return 1; }

  rename -n "s/${1}//" *
  echo
  read -p 'Rename [y/N]: ' confirm

  if [[ $confirm =~ [yY] ]]; then
    rename "s/${1}//" *
  fi
}

# Remane duplicate
mvd() {
  [[ $1 ]] || {
    echo 'usage: mvd <char-duplicate>' >&2
    return 1
  }
  local newfile=''
  for file in *; do
    newfile=$(tr -s "$1" <<< "$file")
    mv "$file" "$newfile" 2>/dev/null
  done
  return 0
}

# Rename files to lower case and replace spaces to - 
mvlo() {
  rename -n \
    '$_=lc($_);
     s/[àáâãäåāăąæª]/a/g;
     s/[èéêëēėę&]/e/g;
     s/[ìíîïīįı]/i/g;
     s/[òóôõöøōœ°]/o/g;
     s/[ùúûüūų]/u/g;
     s/[ç]/c/g;
     s/[ñ]/n/g;
     s/[ýÿ]/y/g;
     s/[ _]/-/g;
     s/--+/-/g;
     s/-+(\.\w+)$/$1/;
     s/[^a-z0-9-.]//g;' *

  echo; read -p 'Rename [y/N]: ' confirm

  if [[ $confirm =~ [yY] ]]; then
    rename \
      '$_=lc($_);
       s/[àáâãäåāăąæª]/a/g;
       s/[èéêëēėę&]/e/g;
       s/[ìíîïīįı]/i/g;
       s/[òóôõöøōœ°]/o/g;
       s/[ùúûüūų]/u/g;
       s/[ç]/c/g;
       s/[ñ]/n/g;
       s/[ýÿ]/y/g;
       s/[ _]/-/g;
       s/--+/-/g;
       s/-+(\.\w+)$/$1/;
       s/[^a-z0-9-.]//g;' *
  fi
}

# Rename files to upper case and replace spaces to - 
mvup() {
  rename -n \
  '($name, $ext) = $_ =~ /^(.+)\.([^.]+)$/;
    $name = uc($name);
    $name =~ s/[ÀÁÂÃÄÅĀĂĄÆª]/A/g;
    $name =~ s/[ÈÉÊËĒĖĘ&]/E/g;
    $name =~ s/[ÌÍÎÏĪĮİ]/I/g;
    $name =~ s/[ÒÓÔÕÖØŌŒ°]/O/g;
    $name =~ s/[ÙÚÛÜŪŲ]/U/g;
    $name =~ s/[Ç]/C/g;
    $name =~ s/[Ñ]/N/g;
    $name =~ s/[ÝŸ]/Y/g;
    $name =~ s/[ _]/-/g;
    $name =~ s/-{2,}/-/g;
    $name =~ s/-+(\.\w+)$/$1/;
    $name =~ s/[^A-Z0-9-.]//g;
    $_ = "$name." . lc($ext);' *

  echo; read -p 'Rename [y/N]: ' confirm

  if [[ $confirm =~ [yY] ]]; then
    rename \
    '($name, $ext) = $_ =~ /^(.+)\.([^.]+)$/;
      $name = uc($name);
      $name =~ s/[ÀÁÂÃÄÅĀĂĄÆª]/A/g;
      $name =~ s/[ÈÉÊËĒĖĘ&]/E/g;
      $name =~ s/[ÌÍÎÏĪĮİ]/I/g;
      $name =~ s/[ÒÓÔÕÖØŌŒ°]/O/g;
      $name =~ s/[ÙÚÛÜŪŲ]/U/g;
      $name =~ s/[Ç]/C/g;
      $name =~ s/[Ñ]/N/g;
      $name =~ s/[ÝŸ]/Y/g;
      $name =~ s/[ _]/-/g;
      $name =~ s/-{2,}/-/g;
      $name =~ s/-+(\.\w+)$/$1/;
      $name =~ s/[^A-Z0-9-.]//g;
      $_ = "$name." . lc($ext);' *
  fi
}

# Create dir and move file the same name
mvmd() {
  for file in *; do
    mkdir "${file%%.*}"
    mv "$file" "${file%%.*}"
  done
}

# Substitute words
mvs() {
  [[ "$1" ]] || { echo 'error: need two words' >&2; return 1; }
  rename -n "s/$1/$2/g" *
  echo; read -p 'Rename [y/N]: ' confirm
  [[ $confirm =~ [yY] ]] && rename "s/$1/$2/" *
}

# Rename
ren() {
  [[ "$1" ]] || { echo "usage: rn 's/old/new/' *" >&2; return 1; }
  local pattern="$1"; shift
  [[ "$@" ]] || { echo "usage: rn 's/old/new/' *" >&2; return 1; }
  local files="$@"
  rename -n "$pattern" $files
  echo; read -p "Rename? [y/N]: " choice
  [[ $choice =~ ^[yY] ]] && rename "$pattern" $files
}

# Link simbolic in working dir
lwd() {
  [[ $1 && $2 ]] || {
    echo 'usage: lnwd <file-or-dir> <path>' >&2
    return 1
  }
  ln -sf "$(pwd)/$1" $2
}

# Open
open() {
  xdg-open "$@" >/dev/null 2>&1 &
}

# Play
p() {
  play $@
}

play() {
  if type mpv &> /dev/null; then
    local music="$HOME/Music"
    local args="--no-video --display-tags=Title,Artist"

    usage() {
      echo -e "\nrc Recents\nrd Random\ns  Search" >&2; return 1
    }

    to_play() {
      if [[ -d "$1" ]]; then
        printf "%s\n" "$1"/**/*.mp3 | mpv $args --playlist=-
      elif [[ "$1" =~ mp3 ]]; then
        printf "%s\n" "$1" | mpv $args --playlist=-
      elif [[ "$1" =~ ^"http" ]]; then
        mpv $args "$1"
      elif [[ "$PWD" =~ $music ]]; then
        mpv $args **/*.mp3
      else
        mpv $args $music/**/*.mp3
      fi
    }

    to_play_random() {
      if [[ $PWD == $music/* ]]; then
        printf "%s\n" **/*.mp3 | mpv $args --shuffle --playlist=-
      else
        printf "%s\n" $music/**/*.mp3 | mpv $args --shuffle --playlist=-
      fi
    }

    case "$1" in
      @(ani?(me)))        to_play "$music/animes"                                ;;
      @(brian|bc))        to_play "$music/jazz/brian-cullberston"                ;;
      @(jaz?(z)))         to_play "$music/jazz"                                  ;;
      h)                  usage                                                  ;;
      @(hiro))            to_play "$music/j-music/hiroyuki-sawano"               ;;
      lof|lofi)           to_play "https://www.youtube.com/live/jfKfPfyJRdk"     ;;
      @(mj|michael))      to_play "$music/pop/michael-jackson"                   ;;
      rd)                 to_play_random                                         ;;
      rc)                 to_play "$(ls -t $music/** | head -n 250)"             ;;
      @(retro?(wave)))    to_play $music/retrowave                               ;;
      ost)                to_play "$music/ost"                                   ;;
      @(s?(earch)))       to_play "$(ls -t $music/**/*.mp3 | fzf)"               ;;
      @(syn?(th)?(wave))) to_play "https://www.youtube.com/live/4xDzrJKXOOY"     ;;
      *)                  to_play                                                ;;
    esac
  fi
}

# Open config file
rc() {
  local files=(\
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
    "$HOME/.config/tmux/tmux.conf"
  )

  selected_file=$(printf '%s\n' "${files[@]}" | fzf)

  if [[ -f "$selected_file" ]]; then
    $EDITOR "$selected_file"
  else
    echo "error: file '${selected_file}' not exit"
    return 1
  fi
}

# SSH Add Agent
ssha() {
  eval "$(ssh-agent -s)"
  ssh-add -k
}

# Start starship
starship() {
  if type -P starship &> /dev/null; then
    eval "$(starship init bash)"
  fi
}

# Move to trash
trash() {
  local trash_dir="$HOME/.local/share/Trash/"
  [[ ! -d "$trash_dir" ]] && mkdir -p "$trash_dir"
  mv -t "$trash_dir"
}

# Convert iso to utf8
utf() {
  iconv -f ISO-8859-1 -t UTF-8 $1 -o $1
}

# Watch files
wa() {
  if type -P entr &>/dev/null; then
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

zipa() {
  for file in *; do zip -m "${file%.*}.zip" "$file"; done
}

# vim:ft=bash
