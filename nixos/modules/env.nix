{ pkgs, ... }:
{
  environment.sessionVariables = {
    TMPDIR = "/tmp";
    __NV_PRIME_RENDER_OFFLOAD = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __VK_LAYER_NV_optimus = "NVIDIA_only";
  };
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
  environment.gnome.excludePackages = (with pkgs; [
      atomix # puzzle game
      cheese # webcam tool
      epiphany # web browser
      evince # document viewer
      geary # email reader
      gedit # text editor
      gnome-characters
      gnome-music
      gnome-photos
      gnome-terminal
      gnome-tour
      hitori # sudoku game
      iagno # go game
      tali # poker game
      totem # video player
  ]);
}
