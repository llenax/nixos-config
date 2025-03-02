{ pkgs, ... }: {
  programs.zsh.enable = true;
  users = {
    users.berke = {
      isNormalUser = true;
      description = "berke";
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" "input" "docker" "podman"];
    };
  };
}
