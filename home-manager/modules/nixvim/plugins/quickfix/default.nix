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
    quickfix = {
      enable = lib.mkEnableOption "Enable better quickfixlist plugin";
   	};
  };

  config = lib.mkIf config.quickfix.enable {
    plugins.nvim-bqf = {
      enable = config.quickfix.enable;
    };
  };
}
