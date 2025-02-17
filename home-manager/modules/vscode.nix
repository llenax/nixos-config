{pkgs, ...}:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      equinusocio.vsc-material-theme-icons
      equinusocio.vsc-material-theme
      vscodevim.vim
      visualstudioexptteam.vscodeintellicode
      ms-vscode.cpptools-extension-pack
      bbenoist.nix
    ];
  };
}
