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
    oil.enable = lib.mkEnableOption "Enable oil plugin";
  };

  config = lib.mkIf config.oil.enable {
    plugins.oil = {
      enable = config.oil.enable;
      settings = {
        default_file_explorer = true;
        view_options = {
          show_hidden = false;
        };
      };
    };
  };
}
