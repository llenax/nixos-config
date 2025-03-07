{ lib, ... }:
{
  programs.rofi = {
    enable = true;   
    theme = lib.mkDefault "gruvbox-dark-soft";
  };
}
