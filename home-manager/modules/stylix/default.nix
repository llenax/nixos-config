{ config, pkgs, wallpaper, ... }:
{
  stylix = {
    enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";
    base16Scheme = pkgs.lib.importJSON ./default-dark.json;
    image = wallpaper.path;
    iconTheme = {
      enable = true;
      package = pkgs.tela-icon-theme;
      dark = "Tela-dark";
    };
    polarity = "dark";
    targets = {
      i3.enable = false;
      spicetify.enable = false;
    };
    fonts = {
      serif = {
        package = pkgs.nerdfonts.override { fonts = ["DejaVuSansMono"]; };
        name = "DejaVuSansMono Nerd Font";
      };

      monospace = {
        package = pkgs.nerdfonts.override { fonts = ["Hack"]; };
        name = "Hack Nerd Font Mono";
      };

      sansSerif = config.stylix.fonts.serif;
      emoji = config.stylix.fonts.serif;

      sizes = {
        applications = 10;
        desktop = 9;
        popups = 9;
        terminal = 9;
      };
    };
    cursor = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Adw-Dark";
      size = 24;
    };
  };
}
