{ lib, config, ... }:
{
  options = {
    cmp.path.enable = lib.mkEnableOption "Enable cmp path plugin";
  };
  config = let
    cfg = config.cmp.path;
  in lib.mkIf cfg.enable {
    plugins.cmp-path = {
      enable = cfg.enable;
    };
  };
}
