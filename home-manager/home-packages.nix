{ pkgs, pkgs-unstable, inputs, system, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    #apps
    mpv
    vlc
    aseprite
    anydesk
    lxappearance
    qt6ct

    #wm
    nm-tray
    rofi
    dunst
    maim
    picom
    xdotool
    pasystray
    pavucontrol
    pamixer
    playerctl
    pcmanfm-qt
    acpi

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

    #php
    pkgs.php84
    pkgs.php84Packages.composer

    #fonts
    pkgs.nerd-fonts._0xproto
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.nerd-fonts.fira-code

    #gnome
    gnome-extension-manager
    gnome-tweaks

  ] ++ (with pkgs-unstable; []);
}
