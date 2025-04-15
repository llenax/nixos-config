{pkgs, ...}:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      visualstudioexptteam.vscodeintellicode
      ms-vscode.cpptools-extension-pack
      bbenoist.nix
      bmewburn.vscode-intelephense-client
    ];
  };
}
