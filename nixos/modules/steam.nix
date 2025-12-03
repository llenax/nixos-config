{ pkgs, ... }:
{
  programs.gamemode.enable = true;
  programs.gamescope = {
    enable = true;
    capSysNice =true;
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
