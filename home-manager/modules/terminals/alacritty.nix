{ pkgs, lib, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [ pkgs.alacritty-theme.one_dark ];
      };
      font = {
        normal = lib.mkDefault {
          family = "FiraCode Nerd Font Mono";
          style = "Regular";
        };
        bold = lib.mkDefault {
          family = "FiraCode Nerd Font Mono";
          style = "Bold";
        };
        italic = lib.mkDefault {
          family = "FiraCode Nerd Font Mono";
          style = "Italic";
        };
        bold_italic = lib.mkDefault {
          family = "FiraCode Nerd Font Mono";
          style = "Bold Italic";
        };
        size = lib.mkDefault 9;
      };
      window.dimensions = {
        lines = 40;
        columns = 150;
      };
    };
  };
}
