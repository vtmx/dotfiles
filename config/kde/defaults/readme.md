# KDE Files

/home/vitor/.config/kdedefaults/

ln -f kdeglobals ~/.config/kdeglobals
ln -f kwinrc ~/.config/kwinrc

https://github.com/shalva97/kde-configuration-files

Panel

    .config/plasma-org.kde.plasma.desktop-appletsrc

Appearance

    Global Theme
        .config/kdeglobals
        .config/kscreenlockerrc
        .config/kwinrc
        .config/gtkrc
        .config/gtkrc-2.0
        .config/gtk-4.0/*
        .config/gtk-3.0/*
        .config/ksplashrc

    Application Style
        .config/kdeglobals
    Plasma Style
        .config/plasmarc
    Colors
        .config/kdeglobals
        .config/Trolltech.conf
    Window decorations
        .config/breezerc (or your theme name)
        .config/kwinrc
    Fonts
        .config/kdeglobals
        .config/kcmfonts
    Icons
        .config/kdeglobals [Icons]
    Cursors
        .config/kcminputrc
    Launch Feedback
        .config/klaunchrc
    Font management
        .config/kfontinstuirc
    Splash screen
        .config/ksplashrc

Workspace

    Desktop behavior
        General behavior
            .config/plasmarc
        Screen Edges
            .config/kwinrc
        Desktop Effects
            .config/kwinrc
            .config/kglobalshortcutsrc
        Touch screen
        Screen Locking
        Virtual desktops
        Activities
            .config/kactivitymanagerdrc: Activity meta info (activity name, activity icon)
            .config/kactivitymanagerd-switcher: Activity sorting in the activity switcher (probably as higher the number as more high in the ladder)
            .config/kactivitymanagerd-statsrc: Sorting of favourite (most used) applications by activity
            .config/kactivitymanagerd-pluginsrc
            .config/kglobalshortcutsrc
            .config/plasma-org.kde.plasma.desktop-appletsrc: Layout per activity
    Window Management
        Window behavior
            .config/kwinrc
        Window Rules
            .config/kwinrulesrc
        Task switcher
        KWin scripts
            .config/kwinrc
    Shortcuts
        Custom Shortcuts
            .config/khotkeysrc
        Global Shortcuts
            .config/kglobalshortcutsrc
    Startup and Shutdown
        Login screen
        Autostart
        Background Services
            .config/kded5rc
        Desktop Session
            .config/ksmserverrc
    Search
        KRunner
            .config/krunnerrc
        File Search
            .config/baloofilerc
        Web Search Keywords

Personalization

    Notifications
        .config/plasmanotifyrc
    Users
    Regional Settings
        Language
        Formats
            .config/plasma-localerc
        Spell Check
        Date & Time
            .config/ktimezonedrc
    Accessibility
        .config/kaccessrc
    Applications
        File associations
        Locations
        Launch Feedback
        Default Applications
            .config/kdeglobals
    KDE Wallet
    Online Accounts
    User Feedback
        .config/PlasmaUserFeedback

Network

    Connections
        /etc/NetworkManager/system-connections
    Settings
        Proxy
        Connection Preferences
        SSL Preferences
        Cache
        Cookies
        Browser Identification
        Windows Shares

Hardware

    Input Devices
        Keyboard
            Hardware
                .config/kcminputrc
            layout
                .config/kxkbrc
            Advanced
                .config/kxkbrc
        Mouse
        Game Controller
        Touchpad
            .config/touchpadxlibinputrc (x11)
            .config/kcminputrc (wayland)
    Display and Monitor
        Compositor
        Gamma
            .config/kgammarc
        Night Color
    Audio
    Power Management
        Energy Saving
            .config/powermanagementprofilesrc
    Bluetooth
        .config/bluedevilglobalrc
    KDE Connect
        .config/kdeconnect
    Removable Storage
        .config/device_automounter_kcmrc
        .config/kded5rc
        .config/kded_device_automounterrc

