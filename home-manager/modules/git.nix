{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "llenax";
    userEmail = "67596732+llenax@users.noreply.github.com";
    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    extraConfig = {
      gpg.format = "ssh";
      gpg.ssh.program = "${pkgs.openssh}/bin/ssh-keygen";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    };
  };
}
