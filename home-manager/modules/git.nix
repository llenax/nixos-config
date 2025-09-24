{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "llenax";
    userEmail = "berkebs18@proton.me";
    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    extraConfig = {
      gpg = {
        format = "ssh";
        ssh = {
          program = "${pkgs.openssh}/bin/ssh-keygen";
          allowedSignersFile = "~/.ssh/allowed_signers";
        };
      };
    };
  };
}
