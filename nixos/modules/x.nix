{
  services.xserver = {
    enable = true;

    serverFlagsSection = ''
      Option "BlankTime" "0"
      Option "StandbyTime" "0"
      Option "SuspendTime" "0"
      Option "OffTime" "0"
      '';

    windowManager.i3.enable = true;
    desktopManager.xterm.enable = false;
  };

  services.displayManager = {
    defaultSession = "none+i3";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "tr";
    variant = "";
  };
}
