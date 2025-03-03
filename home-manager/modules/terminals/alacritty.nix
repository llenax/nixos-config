{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [ pkgs.alacritty-theme.one_dark ];
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font Mono";
          style = "Regular";
        };
        bold = {
          family = "FiraCode Nerd Font Mono";
          style = "Bold";
        };
        italic = {
          family = "FiraCode Nerd Font Mono";
          style = "Italic";
        };
        bold_italic = {
          family = "FiraCode Nerd Font Mono";
          style = "Bold Italic";
        };
        size = 9;
      };
      window.dimensions = {
        lines = 40;
        columns = 150;
      };
    };
  };
}
