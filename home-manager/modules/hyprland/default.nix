{ pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      splash = true;
      preload = [ "/home/berke/Pictures/Wallpapers/wp1.jpg" ];
      wallpaper = [ ",/home/berke/Pictures/Wallpapers/wp1.jpg" ];
    };
  };
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };
}
