{ lib, config, pkgs, ... }:
{
  imports = map (file: ./${file}) (lib.attrNames(
    (lib.filterAttrs(filename: type:
      filename != "default.nix" &&
        (type == "regular" && builtins.match ".*\\.nix" filename != null)
    ))
    (builtins.readDir ./.)
  ));

  options = {
    treesitter.enable = lib.mkEnableOption "Enable treesitter plugin";
  };

  config = lib.mkIf config.treesitter.enable {
    plugins.treesitter = {
      enable = config.treesitter.enable;

      nixvimInjections = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        php
      ];

      settings = {
        highlight.enable = true;
        indent.enable = false;
      };
    };
  };
}
