{ pkgs, pkgs-unstable, inputs, system, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    #apps
    mpv
    vlc
    aseprite
    anydesk
    lxappearance
    qt6Packages.qt6ct
    gimp
    discord
    filezilla

    #wm
    # nm-tray
    # rofi
    # dunst
    # maim
    # picom
    # xdotool
    # pasystray
    # pavucontrol
    # pamixer
    # playerctl
    # pcmanfm-qt
    # acpi
    # hyprland
    # waybar
    # hyprpaper
    # wl-clipboard
    # mako
    # grim
    # slurp
    # swappy

    #browsers
    google-chrome

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
    ripgrep
    lm_sensors
    xclip
    imagemagick
    dconf
    gh
    appimage-run
    fzf
    podman-compose
    upower
    iptables
    ydotool

    #php
    pkgs.php84
    pkgs.php84Packages.composer

    #fonts
    pkgs.nerd-fonts._0xproto
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.nerd-fonts.fira-code

    #gnome
    gnome-tweaks


    #minecraft
    prismlauncher

  ] ++ (with pkgs-unstable; []);
}
