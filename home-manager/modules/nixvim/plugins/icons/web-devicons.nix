{ lib, config, ... }:
{
  options = {
    web-devicons.enable = lib.mkEnableOption "Enable web-devicons plugin";
  };
  config = let
    cfg = config.web-devicons;
  in lib.mkIf cfg.enable {
    plugins.web-devicons.enable = cfg.enable;
  };
}
