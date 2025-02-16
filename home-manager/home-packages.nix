{ pkgs, inputs, system, ... }: {
  home.packages = with pkgs; [
    #apps
    mpv
    inputs.zen-browser.packages."${system}".beta
    ghostty
    prismlauncher
    lmstudio
    jetbrains.pycharm-community
    element-desktop
    krdc

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
    python3
    uv
    ripgrep
    lm_sensors
  ];
}
