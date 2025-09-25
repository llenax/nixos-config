{ pkgs, pkgs-unstable, inputs, system, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    #apps
    mpv
    vlc
    aseprite
    anydesk
    #shutter
    #maim
    lxappearance
    qt6ct
    #gfn-electron
    sqlitestudio

    #wine
    #wineWowPackages.stable
    #winetricks

    #office
    #libreoffice-qt6-fresh

    #ai
    #lmstudio

    #games
    #prismlauncher

    #game-engines
    #godot_4

    #social
    element-desktop

    #browsers
    google-chrome

    #text-editors

    # #kde
    # krdc  # remote desktop
    # kara    # pager widget

    #dev
    gnumake
    gcc
    nodejs
    stdenv.cc.cc.lib
    devenv

    #virtualisation
    arion
    virt-manager

    #cli
    wget
    git-lfs
    fastfetch
    htop
    btop
    unzip
    zip
    #yt-dlp
    ripgrep
    lm_sensors
    #lshw
    #hdparm
    #brightnessctl
    xclip
    imagemagick
    #feh
    #octaveFull
    dconf
    gh
    appimage-run
    fzf
    #xdotool
    podman-compose
    #unar

    #sound
    #pasystray
    #pavucontrol
    #pamixer
    #playerctl

    #network
    #nm-tray

    #file manager
    #pcmanfm-qt

    #php
    pkgs.php84
    pkgs.php84Packages.composer

    #fonts
    pkgs.nerd-fonts._0xproto
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.nerd-fonts.fira-code

    #gnome
    gnome-extension-manager

  ] ++ (with pkgs-unstable; []);
}
