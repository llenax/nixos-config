{ pkgs, pkgs-unstable, inputs, system, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    #apps
    mpv
    vlc
    aseprite
    anydesk
    shutter
    maim
    lxappearance
    qt6ct
    inputs.iamb.packages."${system}".default
    gfn-electron

    #office
    libreoffice-qt6-fresh

    #ai
    lmstudio

    #games
    prismlauncher

    #game-engines
    godot_4

    #social
    element-desktop

    #browsers
    inputs.zen-browser.packages."${system}".beta
    brave
    ungoogled-chromium

    #text-editors
    jetbrains.pycharm-community

    # #kde
    # krdc  # remote desktop
    # kara    # pager widget

    #dev
    gnumake
    gcc
    nodejs
    stdenv.cc.cc.lib
    devenv

    #virtualization
    arion

    #cli
    wget
    git-lfs
    fastfetch
    htop
    btop
    unzip
    zip
    yt-dlp
    ripgrep
    lm_sensors
    lshw
    hdparm
    brightnessctl
    xclip
    imagemagick
    feh
    octaveFull
    dconf
    gh
    appimage-run
    fzf
    xdotool
    podman-compose

    #sound
    pasystray
    pavucontrol
    pamixer
    playerctl

    #network
    nm-tray

    #file manager
    pcmanfm-qt

    #fonts
    (nerdfonts.override {
      fonts = [ "FiraCode" "DroidSansMono" "Hermit" ];
    })

  ] ++ (with pkgs-unstable; [
    #terminals
    ghostty

    #terminal-file-managers
    superfile

    #text-editors
    zed-editor
  ]);
}
