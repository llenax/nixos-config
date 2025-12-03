{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    theme = ./themes/simple-tokyonight.rasi;
    extraConfig = {
      show-icons = true;
    };
  };
}
