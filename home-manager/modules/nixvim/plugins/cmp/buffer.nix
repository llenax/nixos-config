{ lib, config, ... }:
{
  options = {
    cmp.buffer.enable = lib.mkEnableOption "Enable cmp buffer plugin";
  };
  config = let
    cfg = config.cmp.buffer;
  in lib.mkIf cfg.enable {
    plugins.cmp-buffer = {
      enable = cfg.enable;
    };
  };
}
