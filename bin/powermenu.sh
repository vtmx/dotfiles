#!/usr/bin/env bash

# Options
shutdown=' Shutdown'
reboot=' Reboot'
lock=' Lock'
logout=' Logout'
yes=' Yes'
no=' No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
       -p "" \
       -theme-str 'listview { lines: 4; }'
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$shutdown\n$reboot\n$lock\n$logout" | rofi_cmd
}

# Execute Command
run_cmd() {
  if [[ $1 == '--shutdown' ]]; then
    systemctl poweroff
  elif [[ $1 == '--reboot' ]]; then
    systemctl reboot
  elif [[ $1 == '--logout' ]]; then
    if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
      openbox --exit
    elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
      bspc quit
    elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
      i3-msg exit
    elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
      qdbus org.kde.ksmserver /KSMServer logout 0 0 1
    fi
  fi
}

# Actions
chosen="$(run_rofi)"

case $chosen in
  $shutdown)
    run_cmd --shutdown
  ;;
  $reboot)
    run_cmd --reboot
  ;;
  $lock)
    if [[ -x '/usr/bin/betterlockscreen' ]]; then
      betterlockscreen -l
    elif [[ -x '/usr/bin/i3lock' ]]; then
      i3lock
    fi
  ;;
  $logout)
    run_cmd --logout
  ;;
esac
