{ pkgs, ... }:
{
  services.xserver = {
    enable = true;

    serverFlagsSection = ''
      Option "BlankTime" "0"
      Option "StandbyTime" "0"
      Option "SuspendTime" "0"
      Option "OffTime" "0"
      '';

    #windowManager.i3.enable = true;
    desktopManager.xterm.enable = false;
    #displayManager = {
    #  setupCommands = ''
    #    ${pkgs.xorg.xrandr} --output HDMI-1 --left-of eDP-1 --mode 1920x1080 --output eDP-1 --primary --mode 1920x1080
    #    '';
    #};
  };

  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "tr";
    variant = "";
    options = "caps:escape"; # remap capslock to escape
  };
}
