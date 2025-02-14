{ pkgs, inputs, system, ... }: {
  home.packages = with pkgs; [
    #apps
    mpv
    inputs.zen-browser.packages."${system}".beta
    ghostty

    #dev
    gnumake
    gcc
    nodejs

    #cli
    wget
    git
    fastfetch
    htop
    unzip
    zip
    yt-dlp
  ];
}
