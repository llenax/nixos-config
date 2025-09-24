{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.luks.devices."luks-9f36eb52-9a3c-4a24-8f65-d4379d3a5e3d".device = "/dev/disk/by-uuid/9f36eb52-9a3c-4a24-8f65-d4379d3a5e3d";
}
