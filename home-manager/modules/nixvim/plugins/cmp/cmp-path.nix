{ lib, config, ... }:
{
  options = {
    cmp.cmp-path.enable = lib.mkEnableOption "Enable cmp-path plugin";
  };
  config = let
    cfg = config.cmp.cmp-path;
  in lib.mkIf cfg.enable {
    plugins.cmp-path = {
      enable = cfg.enable;
    };
  };
}
