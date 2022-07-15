# Dotfiles

![Destkop](img/screenshots/desktop.png)

## Configuration
- **OS:** [Manjaro](https://manjaro.org/downloads/official/kde)
- **DE:** [Plasma](https://kde.org/pt-br/plasma-desktop)
- **WM:** [Breeze](https://archlinux.org/packages/extra/x86_64/breeze)
- **WM Theme:** [Breeze](https://github.com/KDE/breeze)
- **Theme:** [Breeze Dark [Plasma]](https://archlinux.org/packages/extra/x86_64/breeze)
- **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty)
- **Shell:** [Fish](https://fishshell.com) + [Starship](https://starship.rs)
- **Terminal Font:** [BlexMono Nerd Font Medium 11](https://github.com/IBM/plex)
- **System Font:** [Segoe UI Semibold 10](https://docs.microsoft.com/pt-br/typography/font-list/segoe-ui)
- **Panel:** [Plasma Panel 28](https://userbase.kde.org/Plasma/Panels)
- **Panel Widgets:** [Virtual Desktop Bar](https://github.com/wsdfhjxc/virtual-desktop-bar)
- **Bismuth:** [Bismuth](https://github.com/Bismuth-Forge/bismuth)

## Plasma Appearance
- **Application Style:** [Breeze](https://archlinux.org/packages/extra/x86_64/breeze)
- **Plasma Style:** [Breeze](https://archlinux.org/packages/extra/x86_64/breeze)
- **Colors:** [One Dark V](config/kde/kde.colors)
- **Window Decorations:** [Breeze](https://archlinux.org/packages/extra/x86_64/breeze)
- **Icons:** [Sensual-Breeze-Dark [Plasma]](https://store.kde.org/p/1373825)
- **Cursors:** [We10XOS Cursors](https://store.kde.org/p/1381208)
- **Lauch Feedback:** Cursor Static
- **Fonts Management:** [Segoe UI Semibold 10](https://docs.microsoft.com/pt-br/typography/font-list/segoe-ui)
- **Splash Screen:** [QuarksSplashDark Custom](config/kde/splash-screen/onedarkv)

## Apps
- **File Manager:** [Dolphin](https://apps.kde.org/dolphin)
- **File Syncronizer:** [FreeFileSync](https://freefilesync.org), [Krusader](https://krusader.org)
- **Editor:** [VS Code](https://code.visualstudio.com), [Nvim](https://neovim.io)
- **Browser:** [Vivaldi](https://vivaldi.com/pt-br), [uBlockOrigin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm), [Blending Scrollbar](https://chrome.google.com/webstore/detail/blending-scrollbar/ajjnokaolfbjimgelmdmdlijoclmjnag)]
- **Music and Video Player:** [VLC](https://www.videolan.org/vlc)
- **Screenshot:** [Flameshot](https://flameshot.org)
- **Color Picker:** [KColorChooser](https://apps.kde.org/kcolorchooser)
- **Torrent:** [qBitTorrent](https://www.qbittorrent.org)
- **Password Manager:** [Bitwarden](https://bitwarden.com)
- **Batch Rename:** [KRename](https://apps.kde.org/krename)
- **Subtitle:** [Subtitle Composer](https://subtitlecomposer.kde.org)

## Terminal Apps
- **Multiplex Terminal:** [Tmux](https://github.com/tmux/tmux)
- **File Manager:** [Ranger](https://github.com/ranger/ranger)
- **System Monitor:** [Btop](https://github.com/aristocratos/btop)
- **Git:** [LazyGit](https://github.com/jesseduffield/lazygit)

## Colors
Edit in Themer: [OneDarkV](https://themer.dev/?colors.dark.accent0=%23e06c75&colors.dark.accent1=%23d19a66&colors.dark.accent2=%23e5c07b&colors.dark.accent3=%2398c379&colors.dark.accent4=%2356b6c2&colors.dark.accent5=%2361afef&colors.dark.accent6=%23c678dd&colors.dark.accent7=%23be5046&colors.dark.shade0=%23282c34&colors.dark.shade1=%231e2227&colors.dark.shade2=%233d4556&colors.dark.shade3=%235c6370&colors.dark.shade4=%232c313c&colors.dark.shade5=%23828997&colors.dark.shade6=%23979eab&colors.dark.shade7=%23abb2bf&colors.light.accent0=%23e45649&colors.light.accent1=%23986801&colors.light.accent2=%23c18401&colors.light.accent3=%2350a14f&colors.light.accent4=%230184bc&colors.light.accent5=%234078f2&colors.light.accent6=%23a626a4&colors.light.accent7=%23ca1243&colors.light.shade0=%23fafafa&colors.light.shade1=%23CDCED1&colors.light.shade2=%23a0a1a7&colors.light.shade3=%239d9d9f&colors.light.shade4=%2383858B&colors.light.shade5=%23696c77&colors.light.shade6=%2351535D&colors.light.shade7=%23383a42&activeColorSet=dark&calculateIntermediaryShades.dark=false&calculateIntermediaryShades.light=false)

```yml
scheme: OneDarkV

shade0: "#23272e" # background color
shade1: "#1e2227" # ui, darker
shade2: "#3d4556" # ui, text selection
shade3: "#5c6370" # ui, code comments
shade4: "#2c313c" # ui, line highlight
shade5: "#828997" # ui
shade6: "#979eab" # foreground text
shade7: "#abb2bf" # foreground text

accent0: "#e06c75" # red
accent1: "#d19a66" # orange
accent2: "#e5c07b" # yellow
accent3: "#98c379" # green
accent4: "#56b6c2" # cyan
accent5: "#61afef" # blue
accent6: "#c678dd" # purple
accent7: "#be5046" # magenta
```

## Color Inspiration:
- [OneDarkPro](https://github.com/Binaryify/OneDark-Pro)
- [Base16](https://github.com/LalitMaganti/base16-onedark-scheme)
- [Themer](https://themer.dev/?colors.dark.accent0=%23e06c75&colors.dark.accent1=%23d19a66&colors.dark.accent2=%23e5c07b&colors.dark.accent3=%2398c379&colors.dark.accent4=%2356b6c2&colors.dark.accent5=%2361afef&colors.dark.accent6=%23c678dd&colors.dark.accent7=%23be5046&colors.dark.shade0=%23282c34&colors.dark.shade1=%23393e48&colors.dark.shade2=%234b515c&colors.dark.shade3=%235c6370&colors.dark.shade4=%23636d83&colors.dark.shade5=%23828997&colors.dark.shade6=%23979eab&colors.dark.shade7=%23abb2bf&colors.light.accent0=%23e45649&colors.light.accent1=%23986801&colors.light.accent2=%23c18401&colors.light.accent3=%2350a14f&colors.light.accent4=%230184bc&colors.light.accent5=%234078f2&colors.light.accent6=%23a626a4&colors.light.accent7=%23ca1243&colors.light.shade0=%23fafafa&colors.light.shade1=%23CDCED1&colors.light.shade2=%23a0a1a7&colors.light.shade3=%239d9d9f&colors.light.shade4=%2383858B&colors.light.shade5=%23696c77&colors.light.shade6=%2351535D&colors.light.shade7=%23383a42&activeColorSet=dark&calculateIntermediaryShades.dark=false&calculateIntermediaryShades.light=false)
