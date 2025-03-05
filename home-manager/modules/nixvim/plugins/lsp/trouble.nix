{ lib, config, ... }:
{
  options = {
    lsp.trouble.enable = lib.mkEnableOption "Enable trouble plugin";
  };
  config = let
    cfg = config.lsp.trouble;
  in lib.mkIf cfg.enable {
    plugins.trouble.enable = cfg.enable;
  };
}
