
#!/usr/bin/env bash
#                            <3 cscs <3                                #
# https://gitlab.com/cscs/transfuse.git

HELP=$(cat <<EOF

########################################################################
#                                                                      #
#   TRANSFUSE                                                          #
#                                                                      #
#   A Script to Backup and Restore KDE Plasma Desktop Configurations   #
#                                                                      #
#   Usage: transfuse [option] [USER/PATIENT]                           #
#                                                                      #
#   Options:                                                           #
#    -h   --help                                      show this help   #
#    -b   --backup USER               copy and compress USER configs   #
#    -bt  --backupt USER                 backup USER appearance only   #
#    -BR  --backuproot                           backup root configs   #
#    -C   --copy USER                       copy but do not compress   #
#    -Ct  --copyt USER                     copy USER appearance only   #
#    -c   --compress                         compress copied configs   #
#    -p   --pkglists              create lists of installed packages * #
#    -pr  --pkgrestore                   install native package list * #
#    -pra --pkgrestorealien               install alien package list * #
#    -r   --restore PATIENT             restore configs /to/ PATIENT   #
#                                                                      #
#   Environment Variable       TR_COVER=1       Skip wallpaper steps   #
#   Environment Variable       TR_CHART=1        More verbose output   #
#   Environment Variable       TR_USECP=1          Use cp over rsync   #
#   (*) pkg* options require pacman package manager or an AUR helper   #
#                                                                      #
########################################################################
 
EOF
)

# For timestamp (ex: "20201231_0800").
NOW=$(date +"%Y%m%d_%H%M")

# We dont need no stinkin coppers.
if [ "$EUID" = 0 ];
then echo -e "\n Do not run this script as root!\n";
    exit;
fi

# Use `cp` if TR_USECP set or `rsync` unavailable.
if [ "$TR_USECP" = 1 ] || ! command -v rsync >/dev/null 2>&1;
then
    _tr_cp() {
        cp -drf --preserve=mode,timestamps "$1"{/.,}* "$2";
    }
else
    _tr_cp() {
        rsync -rltD --ignore-missing-args "$1"{.,}* "$2";
    }
fi

# Transfuse is confused.
_tr_confuse() {
    echo -e "\n I dont know what to do.";
    echo "$HELP";
}

# Copy and prepare wallpaper.
_tr_copywpf() {
    if [ -z "$TR_COVER" ]; then
        mkdir -p ./"$DONOR"_transfusion_"$NOW"/.local/share/wallpapers;
        OLDFLWR=$(awk -F: '/\[Wallpaper\]\[org\.kde\.image\]/ && $0 != "" { getline; print $1 }' /home/"$DONOR"/.config/plasma-org.kde.plasma.desktop-appletsrc | awk '{ sub(/(Image=){1}/, "") }1 && !/^file$/')
        if [ -f "$OLDFLWR" ]; then
            AROSE=$(basename -- "$OLDFLWR")
            PETAL="${AROSE##*.}"
            if [ "$TR_USECP" = 1 ] || ! command -v rsync >/dev/null 2>&1;
            then
                cp -drf --preserve=mode,timestamps "$OLDFLWR" ./"$DONOR"_transfusion_"$NOW"/.local/share/wallpapers/flowers."$PETAL";
            else
                _tr_cp "$OLDFLWR" ./"$DONOR"_transfusion_"$NOW"/.local/share/wallpapers/flowers."$PETAL";
            fi
        else
            echo -e "\n Wallpaper could not be found.";
        fi
    else
        echo -e "\n You are \"Covered\" so the wallpaper selection was not copied.";
    fi
}

# Copy topical appearance.
_tr_copytop() {
    _tr_cp /home/"$DONOR"/.config/auroraerc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/breezerc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/dolphinrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/fontconfig ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/gtk- ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/gtkrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/katemetainfos ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/katerc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kateschemarc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kcmfonts ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kcminputrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/KDE ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kdedefaults ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kdeglobals ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kgammarc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/klassy ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/klaunchrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/konsolerc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kscreenlockerrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/ksplashrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kvantum ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kwinoutputconfig.json ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kwinrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kwinrulesrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/menus ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/plasma-org.kde.plasma.desktop-appletsrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/plasmarc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/plasmashellrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/plasmawindowedrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/qtcurve ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/Trolltech.conf ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/xsettingsd ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.font ./"$DONOR"_transfusion_"$NOW"/;
    _tr_cp /home/"$DONOR"/.gtkrc ./"$DONOR"_transfusion_"$NOW"/;
    _tr_cp /home/"$DONOR"/.kde ./"$DONOR"_transfusion_"$NOW"/;
    _tr_cp /home/"$DONOR"/.local/share/aurorae ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/color-schemes ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/icons ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/fonts ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/kfontinst ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/konsole ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/kxmlgui5 ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/plasma ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/plasma_icons ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/wallpapers ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/yakuake ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_copywpf
}

# Copy all accumulated configs.
_tr_copyall() {
    _tr_copytop
    _tr_cp /home/"$DONOR"/.config/akonadi ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/arkrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/autostart ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/bluedevilglobalrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/color ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/defaultcalendarrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/discoverrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/easyeffects ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/environment.d ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/jamesdsp ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kaccessrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kate ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kde.org ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kdeconnect ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kded5rc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kglobalshortcutsrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    ## Deprecated for kglobalaccel ## _tr_cp /home/"$DONOR"/.config/khotkeysrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kiorc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/klipperrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kmixrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kprivacyrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/krunnerrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/kservicemenurc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/ksmserverrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/ktimezonedrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/mimeapps.list ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/mpv ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/nano ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/nnn ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/opensnitch ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/pacman ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/plasma-localerc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/plasma-nm ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/plasma-workspace ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/plasma_calendar_holiday_regions ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/plasmanotifyrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/plasmaparc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/portals.conf ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/powerdevilrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/powermanagementprofilesrc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/pulse/*.conf ./"$DONOR"_transfusion_"$NOW"/.config/pulse/;
    _tr_cp /home/"$DONOR"/.config/systemd ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/vlc ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/waybinder ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.config/wireplumber ./"$DONOR"_transfusion_"$NOW"/.config/;
    _tr_cp /home/"$DONOR"/.local/bin ./"$DONOR"_transfusion_"$NOW"/.local/;
    ## Can cause instabilities ## _tr_cp /home/"$DONOR"/.local/share/applications ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/dolphin ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/goodvibes ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/kate ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/kio ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/knewstuff ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/kservices ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.local/share/plasmashell ./"$DONOR"_transfusion_"$NOW"/.local/share/;
    _tr_cp /home/"$DONOR"/.xserverrc ./"$DONOR"_transfusion_"$NOW"/;
}

# Check if anyone is home.
_tr_homechk() {
    if [ ! -d "/home/$DONOR" ]; then
        echo -e "\n Directory /home/$DONOR does not exist.\n";
        exit;
    fi;
}

# Prepare paths for copies.
_tr_mkddirs() {
    mkdir -p ./"$DONOR"_transfusion_"$NOW" ;
    _tr_mkdirsray=(
        .config
        .config/pulse
        .local
        .local/share
    )
    for dir in "${_tr_mkdirsray[@]}"; do
        [[ -d /home/"$DONOR"/"$dir" ]] && mkdir -p ./"$DONOR"_transfusion_"$NOW"/"$dir"
    done
}

# Refresh various parts of plasma.
_tr_refrkde() {
    echo -e "\nConfigs Restored from ""$opt""\n\nCycling Color Scheme and Reloading Plasma.\n";
    if [ "$PATIENT" == "$USER" ]; then
        qdbus6 org.kde.KWin /KWin org.kde.KWin.reconfigure ;
        #systemctl --user restart plasma-plasmashell.service </dev/null &>/dev/null &
        systemctl --user restart plasma-plasmashell.service
        sleep 0.5;
        CLRSCH=$(plasma-apply-colorscheme --list-schemes | awk '$3 == "(current" { print $2 }');
        FSTSCH=$(plasma-apply-colorscheme --list-schemes | head -n2 | tail -n1 | awk '{ print $2 }');
        LSTSCH=$(plasma-apply-colorscheme --list-schemes | awk '{ print $2 }' | tail -n1);
        plasma-apply-colorscheme "$FSTSCH" || plasma-apply-colorscheme "$LSTSCH" ;
        plasma-apply-colorscheme "$CLRSCH" ;
        qdbus6 org.kde.KWin /KWin reconfigure
        if [[ $(loginctl show-session "$(awk -v u="$USER" '$0 ~ u{ print $1}'<<<"$(loginctl)")" -p Type | awk -F '=' 'NR==1 { print $2 }') = "x11" ]]; then
            kwin_x11 --replace </dev/null &>/dev/null &
        elif [[ $(loginctl show-session "$(awk -v u="$USER" '$0 ~ u{ print $1}'<<<"$(loginctl)")" -p Type | awk -F '=' 'NR==1 { print $2 }') = "wayland" ]]; then
            kwin_wayland --replace </dev/null &>/dev/null &
        fi;
        if [ -z "$TR_COVER" ]; then
            NEWFLWR=$(find /home/"$PATIENT"/.local/share/wallpapers -name "flowers.*");
            if [ -f "$NEWFLWR" ]; then
                plasma-apply-wallpaperimage "$NEWFLWR" ;
            else
                echo -e "\n No wallpaper found.";
            fi
        else
            echo -e "\n You are \"Covered\" so no change will be made to the wallpaper selection.";
        fi;
        #systemctl --user restart plasma-plasmashell.service &>/dev/null &
        systemctl --user restart plasma-plasmashell.service
    fi
}

# Check for and present visible users.
_tr_userchk() {
    _tf_users=$(getent passwd {1000..2000} | awk -F':' '{ print $1}' | sort -u | tr '\n' '  ');
    echo -e "\nPossible Users:  ""$_tf_users""\n";
}

# "Main" menu shown if no argument.
if [ $# -eq 0 ];
then echo "";
    while true; do
        PS3=$'\n'"Please enter your choice: "
        options=("Backup" "BackupTopical" "Copy" "CopyTopical" "Compress" "Pkglists" "PkgRestore" "Restore" "Help" "Quit")
        COLUMNS=60
        select opt in "${options[@]}"
        do
            case "$opt,$REPLY" in
                Backup,*|*,[bB]ackup)
                    _tr_userchk
                    read -rp "Please enter the name of the user to backup and compress configs from: "  DONOR
                    "$0" -b "$DONOR";
                    break
                    ;;
                BackupTopical,*|*,[bB]ackup[tT]opical)
                    _tr_userchk
                    read -rp "Please enter the name of the user to backup and compress configs from: "  DONOR
                    "$0" -bt "$DONOR";
                    break
                    ;;
                Copy,*|*,[cC]opy)
                    _tr_userchk
                    read -rp "Please enter the name of the user to copy configs from: "  DONOR
                    "$0" -C "$DONOR";
                    break
                    ;;
                CopyTopical,*|*,[cC]opy[tT]opical)
                    _tr_userchk
                    read -rp "Please enter the name of the user to copy configs from: "  DONOR
                    "$0" -Ct "$DONOR";
                    break
                    ;;
                Compress,*|*,[cC]ompress)
                    "$0" -c;
                    break
                    ;;
                Pkglists,*|*,[pP]kglists)
                    "$0" -p;
                    break
                    ;;
                PkgRestore,*|*,[pP]kg[rR]estore)
                    "$0" -pr;
                    break
                    ;;
                Restore,*|*,[rR]estore)
                    _tr_userchk
                    read -rp "Please enter the name of the user to restore configs to: "  PATIENT
                    "$0" -r "$PATIENT";
                    break
                    ;;
                Help,*|*,[hH]elp)
                    "$0" -h;
                    break
                    ;;
                Quit,*|*,[qQ]uit)
                    echo -e "\nExiting now.\n";
                    break 2
                    ;;
                *) echo "invalid option $REPLY" ;;
            esac
        done;
    done;
fi;

# Interpretations of arguments.
while test $# -gt 0; do

    case "$1" in

        -b|backup|--backup)

            shift
            if test $# -gt 0; then
                DONOR="${1//^[^ ]* //g}"
                _tr_homechk
                if [[ $TR_CHART -eq 1 ]];
                then
                    _tr_mkddirs
                    _tr_copyall
                    tar -zcvf ./"$DONOR"_transfusion_"$NOW".tar.gz ./"$DONOR"_transfusion_"$NOW";
                else
                    {
                        _tr_mkddirs
                        _tr_copyall
                        tar -zcvf ./"$DONOR"_transfusion_"$NOW".tar.gz ./"$DONOR"_transfusion_"$NOW";
                    } &> /dev/null;
                fi;
                rm -rf ./"$DONOR"_transfusion_"$NOW";
                echo -e "\nWe copied and compressed items recursively from \n\n~\n~/.config\n~/.local/share\n\nThe compressed backup is timestamped and named ""$DONOR""_transfusion_""$NOW"".tar.gz\n";
            else
                _tr_confuse
                exit;
            fi;
            shift ;; # Backup (copy+compress) combined user group.

        -bt|backuptopical|--backupt)

            shift
            if test $# -gt 0; then
                DONOR="${1//^[^ ]* //g}"
                _tr_homechk
                if [[ $TR_CHART -eq 1 ]];
                then
                    _tr_mkddirs
                    _tr_copytop
                    mv ./"$DONOR"_transfusion_"$NOW" ./"$DONOR"_transfusion_"$NOW"_T;
                    tar -zcvf ./"$DONOR"_transfusion_"$NOW"_T.tar.gz ./"$DONOR"_transfusion_"$NOW"_T;
                else
                    {
                        _tr_mkddirs
                        _tr_copytop
                        mv ./"$DONOR"_transfusion_"$NOW" ./"$DONOR"_transfusion_"$NOW"_T;
                        tar -zcvf ./"$DONOR"_transfusion_"$NOW"_T.tar.gz ./"$DONOR"_transfusion_"$NOW"_T;
                    } &> /dev/null;
                fi;
                rm -rf ./"$DONOR"_transfusion_"$NOW"_T;
                echo -e "\nWe copied and compressed items recursively from \n\n~\n~/.config\n~/.local/share\n\nThe compressed backup is timestamped and named ""$DONOR""_transfusion_""$NOW""_T.tar.gz";
                echo -e "\nThis is a 'topical' backup. Only the minimum of themes and aesthetics are saved.\n";
            else
                _tr_confuse
                exit;
            fi;
            shift ;; # Backup (copy+compress) user appearances group.

        -BR|backuproot|--backuproot)

            if test $# -gt 0; then
                if [ "$TR_USECP" = 1 ] || ! command -v rsync >/dev/null 2>&1;
                then
                    _tr_cp_rt() {
                        cp -drf --preserve=mode,timestamps "$1"{/.,}* "$2";
                    }
                else
                    _tr_cp_rt() {
                        rsync -av --ignore-missing-args "$1"{.,}* "$2";
                    }
                fi
                _tr_copyall_rt() {
                    _tr_cp_rt /etc/environment ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/exports.d ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/fonts ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/gtk- ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/iptables ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/libinput ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/locale.conf ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/makepkg.conf ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/mkinitcpio ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/modprobe.d ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/NetworkManager ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/opensnitchd ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/openvpn ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/pacman.conf ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/sddm.conf ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/sysctl ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/systemd ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/tlp ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/udev ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/X11 ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /etc/xdg ./root_transfusion_"$NOW"/etc/;
                    _tr_cp_rt /usr/share/aurorae ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/color-schemes ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/fonts ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/grub/themes/ ./root_transfusion_"$NOW"/usr/share/grub/themes/;
                    _tr_cp_rt /usr/share/gtk-3.0 ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/gtk-4.0 ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/icons ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/KDE ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/kde-gtk-config ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/kglobalaccel ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/konsole ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/kstyle ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/Kvantum ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/plasma ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/QtCurve ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/sddm ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/sounds ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/themes ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/wallpapers ./root_transfusion_"$NOW"/usr/share/;
                    _tr_cp_rt /usr/share/yakuake ./root_transfusion_"$NOW"/usr/share/;
                }
                mkdir -p ./root_transfusion_"$NOW";
                _tr_mkdirsray=(
                    etc
                    usr/share
                    usr/share/grub/themes
                )
                for dir in "${_tr_mkdirsray[@]}"; do
                    [[ -d /"$dir" ]] && mkdir -p ./root_transfusion_"$NOW"/"$dir"
                done
                if [[ $TR_CHART -eq 1 ]];
                then
                    _tr_copyall_rt
                    tar -zcvf ./root_transfusion_"$NOW".tar.gz ./root_transfusion_"$NOW";
                else
                    {
                        _tr_copyall_rt
                        tar -zcvf ./root_transfusion_"$NOW".tar.gz ./root_transfusion_"$NOW";
                    } &> /dev/null;
                fi;
                rm -rf ./root_transfusion_"$NOW";
                echo -e "\n\nWe copied and compressed items recursively from \n\n/usr/share/\n\nThe compressed backup is named root_transfusion_""$NOW"".tar.gz\n";
            else
                _tr_confuse
                exit;
            fi;
            shift ;; # Backup (copy+compress) root group.

        -C|copy|--copy)

            shift
            if test $# -gt 0; then
                DONOR="${1//^[^ ]* //g}"
                _tr_homechk
                if [[ $TR_CHART -eq 1 ]];
                then
                    _tr_mkddirs
                    _tr_copyall
                else
                    {
                        _tr_mkddirs
                        _tr_copyall
                    } &> /dev/null;
                fi
                echo -e "\n\nWe copied items recursively from \n\n~\n~/.config\n~/.local/share\n\nThe new directory is timestamped and named ""$DONOR""_transfusion_""$NOW""\n";
            else
                _tr_confuse
                exit;
            fi;
            shift ;; # Copy combined user group.

        -Ct|copytopical|--copyt)

            shift
            if test $# -gt 0; then
                DONOR="${1//^[^ ]* //g}"
                _tr_homechk
                if [[ $TR_CHART -eq 1 ]];
                then
                    _tr_mkddirs
                    _tr_copytop
                else
                    {
                        _tr_mkddirs
                        _tr_copytop
                    } &> /dev/null;
                fi
                mv ./"$DONOR"_transfusion_"$NOW" ./"$DONOR"_transfusion_"$NOW"_T
                echo -e "\n\nWe copied items recursively from \n\n~\n~/.config\n~/.local/share\n\nThe new directory is timestamped and named ""$DONOR""_transfusion_""$NOW""_T\n";
                echo -e "\nThis is a 'topical' copy. Only the minimum of themes and aesthetics are saved.\n";
            else
                _tr_confuse
                exit;
            fi;
            shift ;; # Copy user appearance group.

        -c|compress|--compress)

            echo -e "\nPlease select a copy to compress.\n";
            unset options i
            while IFS= read -r -d $'\0' f; do
                options[i++]="$f"
            done < <(find . -maxdepth 1 -type d -name "*_transfusion_*" -print0)
            select opt in "${options[@]}" "Cancel"; do
                case $opt in
                    *_transfusion_*)
                        if [[ $TR_CHART -eq 1 ]];
                        then
                            tar -zcvf "${opt}.tar.gz" "$opt";
                        else
                            {
                                tar -zcvf "${opt}.tar.gz" "$opt";
                            } &> /dev/null;
                        fi;
                        echo -e "\nCompressed items recursively from \n\n""$opt""\n";
                        break
                        ;;
                    "Cancel")
                        echo -e "\nCancelled.\n";
                        break
                        ;;
                    *)
                        echo "Invalid selection.";
                        ;;
                esac
            done
            shift ;; # Compress an uncompressed copy.

        -h|help|--help)

            echo "$HELP";
            shift ;;

        -p|pkglists|--pkglists)

            pacman -Qqen > ./"$HOSTNAME"_"$NOW"_native.txt;
            pacman -Qqem > ./"$HOSTNAME"_"$NOW"_alien.txt;
            echo -e "\n Package lists created for 'native' and 'alien' packages and prefixed with '""$HOSTNAME""_""$NOW""'\n";
            shift ;; # create package lists for use with ALPM

        -pr|pkgrestore|--pkgrestore)

            echo -e "\nPlease select a package list to restore.\n";
            unset options i
            while IFS= read -r -d $'\0' f; do
                options[i++]="$f"
            done < <(find . -maxdepth 1 -type f -name "*native.txt" -print0)
            select opt in "${options[@]}" "Cancel"; do
                case $opt in
                    *native.txt)
                        echo -e "\nPackage list ""$opt"" selected.\n";
                        sudo pacman -S --needed - < "$opt";
                        break
                        ;;
                    "Cancel")
                        echo -e "\nCancelled.\n";
                        break
                        ;;
                    *)
                        echo "Invalid selection.";
                        ;;
                esac
                if [ ! -f "$opt" ]; then
                    echo -e "\n No package list selected.\n";
                    shift;
                fi;
            done
            shift ;; # Use pacman to install packages from a list.

        -pra|pkgrestorealien|--pkgrestorealien)

            echo -e "\nPlease select an alien package list to restore.\n";
            unset options i
            while IFS= read -r -d $'\0' f; do
                options[i++]="$f"
            done < <(find . -maxdepth 1 -type f -name "*_alien.txt" -print0)
            select opt in "${options[@]}" "Cancel"; do
                case $opt in
                    *_alien.txt)
                        echo -e "\nPackage list ""$opt"" selected.\n";
                        ALIENLIST=$(tr '\n' ' ' < "$opt")
                        if command -v paru >/dev/null 2>&1; then
                            paru -Sa --needed - < "$opt";
                        elif command -v yay >/dev/null 2>&1; then
                            yay -Sa --needed - < "$opt";
                        elif command -v trizen >/dev/null 2>&1; then
                            trizen -Sa --needed - < "$opt";
                        elif command -v pikaur >/dev/null 2>&1; then
                            pikaur -Sa --needed - < "$opt";
                        elif command -v pacaur >/dev/null 2>&1; then
                            pacaur -Sa --needed "$ALIENLIST";
                        elif command -v pamac >/dev/null 2>&1; then
                            pamac build "$ALIENLIST";
                        else
                            echo "Either you have no aur helper or you should yell at cscs.";
                        fi
                        break
                        ;;
                    "Cancel")
                        echo -e "\nCancelled.\n";
                        break
                        ;;
                    *)
                        echo "Invalid selection.";
                        ;;
                esac
                if [ ! -f "$opt" ]; then
                    echo -e "\n No package list selected.\n";
                    exit;
                fi;
            done
            shift ;; # Use aur helper to install foreign packages from a list.

        -r|restore|--restore)

            shift
            if test $# -gt 0; then
                echo -e "\nPlease select a backup to restore.\n";
                unset options i
                while IFS= read -r -d $'\0' f; do
                    options[i++]="$f"
                done < <(find . -maxdepth 1 -type f -name "*.tar.gz" ! -name "root_*" -print0)
                select opt in "${options[@]}" "Cancel"; do
                    case $opt in
                        *.tar.gz)
                            echo -e "\nBackup file $opt selected.";
                            # processing
                            break
                            ;;
                        "Cancel")
                            echo -e "\nCancelled.";
                            break
                            ;;
                        *)
                            echo "Invalid selection.";
                            ;;
                    esac
                done
                PATIENT="${1//^[^ ]* //g}"
                if [ ! -d "/home/$PATIENT" ]; then
                    echo -e "\n Directory /home/$PATIENT does not exist.\n";
                    exit;
                fi;
                if [ ! -f "$opt" ]; then
                    echo -e "\n No Backup selected.\n";
                    exit;
                fi;
                echo " ";
                read -p "Are you sure you would like to restore ""$opt"" to /home/$PATIENT/? (y/N) " -n 1 -r;
                echo " ";
                if [[ ! $REPLY =~ ^[Yy]$ ]];
                then exit 1;
                fi;
                if [[ $TR_CHART -eq 1 ]];
                then
                    mkdir -p -m 777 /tmp/transfusion;
                    tar -xzvf "$opt" -C /tmp/transfusion/;
                    COPYF=/tmp/transfusion/${opt::-7}
                    sed -i '/file:\/\/\/home/{s/'"${opt%%_*}"'/'"$PATIENT"'/;}' "$COPYF"/.config/gtk-3.0/bookmarks
                    if [ "$TR_USECP" = 1 ] || ! command -v rsync >/dev/null 2>&1;
                    then
                        /bin/cp -d -r -v --force --preserve=mode,timestamps "$COPYF"/{/.,}* /home/"$PATIENT"/;
                    else
                        rsync -rltDii --ignore-missing-args "$COPYF"/ --include=".*" /home/"$PATIENT"/;
                    fi
                    _tr_refrkde
                else
                    {
                        mkdir -p -m 777 /tmp/transfusion;
                        tar -xzvf "$opt" -C /tmp/transfusion;
                        COPYF=/tmp/transfusion/${opt::-7}
                        sed -i '/file:\/\/\/home/{s/'"${opt%%_*}"'/'"$PATIENT"'/;}' "$COPYF"/.config/gtk-3.0/bookmarks
                        if [ "$TR_USECP" = 1 ] || ! command -v rsync >/dev/null 2>&1;
                        then
                            /bin/cp -d -r --force --preserve=mode,timestamps "$COPYF"/{/.,}* /home/"$PATIENT"/;
                        else
                            rsync -rltD --ignore-missing-args "$COPYF"/ --include=".*" /home/"$PATIENT"/;
                        fi
                        _tr_refrkde
                    } &> /dev/null;
                fi;
                if [[ $? -eq "0" ]];
                then
                    sleep 0.1;
                    rm -rf "$COPYF";
                    echo -e "\nFinished.\n";
                    if [ "$PATIENT" == "$USER" ]; then
                    echo -e "\nPlease log out or restart to finalize the restoration.\n";
                    fi
                else
                    echo -e "Something went wrong.\nAre you sure you have the proper permissions?\n";
                fi;
            else
                _tr_confuse
                exit;
            fi;
            shift ;; # Restore from a compressed backup.

        *)
            echo "$HELP";
            break
            ;;

    esac

done

#echo

exit
