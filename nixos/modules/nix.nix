{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.extraOptions = ''
    trusted-users = root berke
    '';
}
