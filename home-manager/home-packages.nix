{ pkgs, pkgs-unstable, inputs, system, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    #apps
    mpv

    #ai
    lmstudio

    #games
    prismlauncher

    #social
    element-desktop

    #browsers
    inputs.zen-browser.packages."${system}".beta

    #text-editors
    jetbrains.pycharm-community

    #kde
    krdc  # remote desktop
    kara    # pager widget

    #dev
    gnumake
    gcc
    nodejs
    stdenv.cc.cc.lib
    devenv

    #cli
    wget
    git
    fastfetch
    htop
    unzip
    zip
    yt-dlp
    ripgrep
    lm_sensors

    #fonts
    (nerdfonts.override {
      fonts = [ "FiraCode" "DroidSansMono" "Hermit" ];
    })

  ] ++ (with pkgs-unstable; [
    #terminals
    ghostty
    
    #text-editors
    zed-editor
  ]);
}
