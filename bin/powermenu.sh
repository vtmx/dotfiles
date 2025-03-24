#!/usr/bin/env bash

# Options
shutdown='Shutdown'
reboot='Reboot'
logout='Logout'

# Get option
getopt() {
	echo -e "$shutdown\n$reboot\n$logout" | \
  rofi -dmenu \
       -p "" \
       -theme-str 'listview { lines: 3; }'
}

case "$(getopt)" in
  $shutdown) systemctl poweroff ;;
  $reboot  ) systemctl reboot ;;
  $logout)
    case $DESKTOP_SESSION in
      'bspwm'  ) bspc quit ;;
      'i3'     ) i3-msg exit ;;
      'openbox') openbox --exit ;;
      'plasma' ) qdbus org.kde.Shutdown /Shutdown logout ;;
      'xfce4'  ) xfce4-session-logout --logout ;;
    esac
  ;;
esac
