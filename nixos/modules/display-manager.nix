{ config, pkgs, ... }:
{
  # services.displayManager = {
  #   sddm = {
  #     enable = true;
  #     wayland.enable = true;
  #   };
  # };
  services.displayManager.gdm.enable = true;
  # services.greetd = {
  #   enable = true;
  #   settings.default_session = {
  #     command = "${pkgs.hyprland}/bin/Hyprland";
  #     user = "berke";
  #   };
  # };
}
