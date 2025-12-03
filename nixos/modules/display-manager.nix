{ config, pkgs, ... }:
{
  # services.displayManager.defaultSession = "none+awesome";
  services.displayManager.sddm.enable = true;
  # services.greetd = {
  #   enable = true;
  #   settings.default_session = {
  #     command = "${pkgs.hyprland}/bin/Hyprland";
  #     user = "berke";
  #   };
  # };
}
