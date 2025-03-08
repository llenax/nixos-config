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
    lazydev = {
      enable = lib.mkEnableOption "Enable lazydev plugin";
    };
  };

  config = lib.mkIf config.lazydev.enable {
    plugins.lazydev = {
      enable = config.lazydev.enable;
    };
  };
}
