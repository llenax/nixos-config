{ pkgs, ... }:
{
  programs.starship = {
    enable = false;
    settings = pkgs.lib.importTOML ./starship.toml;
  };
}
