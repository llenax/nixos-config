{ config, pkgs, lib, wallpaper, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    extraConfig = ''
      workspace_layout tabbed
    '';

    config = let
      modifier = "Mod1";
    in lib.mkMerge [
      {
        modifier = modifier;

        window.border = 0;

        gaps = {
          inner = 0;
          outer = 0;
        };
        bars = [
          #config.lib.stylix.i3.bar //
          {
            mode = "dock";
            hiddenState = "hide";
            position = "bottom";
            workspaceButtons = true;
            workspaceNumbers = true;
            statusCommand = "${pkgs.i3status}/bin/i3status";
            trayOutput = "primary";
            # colors = {
            #   focusedWorkspace = {
            #     border = "7cafc2";
            #     background = "7cafc2";
            #     text = "d8d8d8";
            #   };
            #   urgentWorkspace = {
            #     border = "ab4642";
            #     background = "ab4642";
            #     text = "d8d8d8";
            #   };
            # };
          }
        ];

        keybindings = lib.mkDefault {
          "${modifier}+Shift+q" = "kill";

          "${modifier}+Left" = "focus left";
          "${modifier}+Down" = "focus down";
          "${modifier}+Up" = "focus up";
          "${modifier}+Right" = "focus right";

          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+Right" = "move right";

          "${modifier}+h" = "split h";
          "${modifier}+v" = "split v";
          "${modifier}+f" = "fullscreen toggle";

          "${modifier}+s" = "layout stacking";
          "${modifier}+w" = "layout tabbed";
          "${modifier}+e" = "layout toggle split";

          "${modifier}+Shift+space" = "floating toggle";
          "${modifier}+space" = "focus mode_toggle";

          "${modifier}+p" = "focus parent";

          "${modifier}+Shift+minus" = "move scratchpad";
          "${modifier}+minus" = "scratchpad show";

          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "workspace number 6";
          "${modifier}+7" = "workspace number 7";
          "${modifier}+8" = "workspace number 8";
          "${modifier}+9" = "workspace number 9";
          "${modifier}+0" = "workspace number 10";

          "${modifier}+Shift+1" =
            "move container to workspace number 1";
          "${modifier}+Shift+2" =
            "move container to workspace number 2";
          "${modifier}+Shift+3" =
            "move container to workspace number 3";
          "${modifier}+Shift+4" =
            "move container to workspace number 4";
          "${modifier}+Shift+5" =
            "move container to workspace number 5";
          "${modifier}+Shift+6" =
            "move container to workspace number 6";
          "${modifier}+Shift+7" =
            "move container to workspace number 7";
          "${modifier}+Shift+8" =
            "move container to workspace number 8";
          "${modifier}+Shift+9" =
            "move container to workspace number 9";
          "${modifier}+Shift+0" =
            "move container to workspace number 10";

          "${modifier}+Shift+c" = "reload";
          "${modifier}+Shift+r" = "restart";
          "${modifier}+Shift+e" =
            "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

          "${modifier}+r" = "mode resize";

          "${modifier}+Return" = "exec ${pkgs.ghostty}/bin/ghostty";
          "${modifier}+a" = "exec ${pkgs.dmenu}/bin/dmenu_run";

          # "Ctrl+Print" = ''exec ${pkgs.maim}/bin/maim | xclip -selection clipboard -t image/png'';
          "Ctrl+Print" = ''exec MAIM_PKG=${pkgs.maim}/bin/maim maim-clipboard-ss'';
          "Ctrl+Shift+Print" = ''exec ${pkgs.maim}/bin/maim --select | xclip -selection clipboard -t image/png'';
          "Print" = ''exec ${pkgs.maim}/bin/maim "$HOME/Pictures/Screenshots/Screenshot_$(date +%s)"'';
          "Shift+Print" = ''exec ${pkgs.maim}/bin/maim --select "$HOME/Pictures/Screenshots/Screenshot_$(date +%s)"'';

          "XF86AudioMute" = "exec pamixer -t";
          "XF86AudioLowerVolume" = "exec pamixer -d 5";
          "XF86AudioRaiseVolume" = "exec pamixer -i 5";
          "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
          "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
          "XF86AudioPlay" = "exec playerctl play-pause";
          "XF86AudioNext" = "exec playerctl next";
          "XF86AudioPrev" = "exec playerctl previous";

          # "${modifier}+a" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
          # "${modifier}+Shift+a" = "exec ${pkgs.rofi}/bin/rofi -show window";
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
            # command = ''${pkgs.curl}/bin/curl -sk ${wallpaper.url} | ${pkgs.feh}/bin/feh - --bg-fill --image-bg "#000000"'';
            command = ''${pkgs.feh}/bin/feh ${wallpaper.path} --bg-fill --image-bg "#000000"'';
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
          # screensaver disable
          {
            command = "exec xset s off";
            always = true;
            notification = false;
          }
          # powersaving disable
          {
            command = "exec xset -dpms";
            always = true;
            notification = false;
          }
        ];

      }
      # (config.stylix.i3.config or {})
      # {
      #   colors = with config.lib.stylix.colors.withHashtag; {
      #     urgent = let bg = lib.mkForce base08; in {
      #       background = bg;
      #       border = bg;
      #       childBorder = bg;
      #       text = lib.mkForce base07;
      #     };
      #     focused = let bg = lib.mkForce base01; in {
      #       background = bg;
      #       border = bg;
      #       childBorder = bg;
      #       text = lib.mkForce base05;
      #     };
      #     focusedInactive = let bg = lib.mkForce base00; in {
      #       background = bg;
      #       border = bg;
      #       childBorder = bg;
      #     };
      #     unfocused = let bg = lib.mkForce base00; in {
      #       background = bg;
      #       border = bg;
      #       childBorder = bg;
      #     };
      #     placeholder = let bg = lib.mkForce base00; in {
      #       background = bg;
      #       border = bg;
      #       childBorder = bg;
      #     };
      #   };
      # }
    ];
  };
}
