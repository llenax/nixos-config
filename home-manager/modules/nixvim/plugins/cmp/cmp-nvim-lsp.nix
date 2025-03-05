{ lib, config, ... }:
{
  options = {
    cmp.cmp-nvim-lsp.enable = lib.mkEnableOption "Enable cmp-nvim-lsp plugin";
  };
  config = let
    cfg = config.cmp.cmp-nvim-lsp;
  in lib.mkIf cfg.enable {
    plugins.cmp-nvim-lsp = {
      enable = cfg.enable;
    };
  };
}
