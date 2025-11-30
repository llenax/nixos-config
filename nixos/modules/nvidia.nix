{
  hardware.nvidia = {
    open = false;                # use the open kernel modules (recommended) // fails with 6.16 kernel currently
    modesetting.enable = true;  # required for Wayland
    prime = {
      offload.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    powerManagement.enable = true;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  boot.blacklistedKernelModules = [ "nouveau" ];
}
