{ lib, config, ... }:
{
  imports = map (file: ./${file}) (lib.attrNames(
    (lib.filterAttrs(filename: type:
      filename != "default.nix" &&
        (type == "regular" && builtins.match ".*\\.nix" filename != null)
    ))
    (builtins.readDir ./.)
  ));

  options = {
    icons.enable = lib.mkEnableOption "Enable icon-related plugins";
  };

  config = lib.mkIf config.icons.enable {
    web-devicons.enable = lib.mkDefault true;
  };
}
