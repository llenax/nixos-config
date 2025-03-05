{ lib, config, ... }:
{
  options = {
    lsp.none-ls.enable = lib.mkEnableOption "Enable none-ls plugin";
  };
  config = let
    cfg = config.lsp.none-ls;
  in lib.mkIf cfg.enable {
    plugins.none-ls = {
      enable = cfg.enable;
      sources = {
        diagnostics = {};
        formatting = {};
      };
    };
  };
}
