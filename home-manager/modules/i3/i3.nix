{ pkgs, lib, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    extraConfig = ''
      workspace_layout tabbed
    '';

    config = rec {
      modifier = "Mod1";

      window.border = 0;

      gaps = {
        inner = 0;
        outer = 0;
      };

      keybindings = lib.mkOptionDefault {
        "XF86AudioMute" = "exec pamixer -t";
        "XF86AudioLowerVolume" = "exec pamixer -d 5";
        "XF86AudioRaiseVolume" = "exec pamixer -i 5";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+a" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
        "${modifier}+Shift+a" = "exec ${pkgs.rofi}/bin/rofi -show window";
      };

      startup = [
        {
          command = "exec i3-msg workspace 1";
          always = true;
          notification = false;
        }
        {
          command = "systemctl --user restart polybar.service";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ~/Pictures/Wallpapers/wallhaven-2yl6px.jpg";
          always = true;
          notification = false;
        }
        {
          command = "pasystray";
          always = false;
          notification = false;
        }
        {
          command = "blueman-applet";
          always = false;
          notification = false;
        }
        {
          command = "nm-tray";
          always = false;
          notification = false;
        }
      ];

    };
  };
}
