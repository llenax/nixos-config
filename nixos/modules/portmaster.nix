{
  systemd.services.portmaster-core = {
    description = "Portmaster Core Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "/home/berke/safing/portmaster/portmaster-start core -- -devmode";
      WorkingDirectory = "/home/berke";
      Restart = "always";
      Environment = "PATH=/run/current-system/sw/bin:/usr/bin:/bin";
    };
  };
}
