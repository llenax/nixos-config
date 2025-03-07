{pkgs, inputs, lib, ...}:
{
  programs.spicetify =
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
  in
  {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    # theme = lib.mkDefault spicePkgs.themes.catppuccin;
    # colorScheme = lib.mkDefault "mocha";
  };
}
