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
    colorizer = {
      enable = lib.mkEnableOption "Enable colorizer plugin";
      css = {
        rgb = lib.mkOption {
          default = false;
          type = lib.types.bool;
        };
        hsl = lib.mkOption {
          default = false;
          type = lib.types.bool;
        };
      };
    };
  };

  config = lib.mkIf config.colorizer.enable {
    plugins.colorizer = {
      enable = config.colorizer.enable;
      settings = {
        filetypes = {
          __unkeyed-1 = "*";
          __unkeyed-2 = "!vim";
          css = {
            rgb_fn = config.colorizer.css.rgb;
            hsl_fn = config.colorizer.css.hsl;
          };
          html = {
            names = false;
          };
        };
        user_commands = [
          "ColorizerToggle"
          "ColorizerReloadAllBuffers"
        ];
        user_default_options = {
          mode = "virtualtext";
          names = false;
          virtualtext = "■ ";
        };
      };
    };
  };
}
