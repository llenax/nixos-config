{
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  services.resolved = {
    enable = true;
    dnssec = "allow-downgrade";
    extraConfig = ''
      DNS=1.1.1.1 1.0.0.1
      FallbackDNS=
      Domains=~.
    '';
  };
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      settings = {
        connection = {
          "ipv4.ignore-auto-dns" = true;
          "ipv6.ignore-auto-dns" = true;
        };
        ipv4 = {
          method = "auto";
          never-default = false;
          may-fail = false;
        };
        ipv6 = {
          method = "auto";
          never-default = false;
          may-fail = false;
        };
      };
    };
  };
}
