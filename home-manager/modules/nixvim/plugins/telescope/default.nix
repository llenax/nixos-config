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
    telescope.enable = lib.mkEnableOption "Enable telescope plugin";
  };

  config = lib.mkIf config.telescope.enable {
    plugins.telescope = {
      enable = config.telescope.enable;

      extensions = {
        file-browser.enable = true;
        fzy-native.enable = true;
        ui-select.enable = true;

        frecency = {
          enable = true;

          settings = { db_safe_mode = false; };
        };
      };
    };
  };
}
