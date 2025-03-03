{
  # gvfs: a userspace virtual filesystem"
  # services.gvfs.enable = true;

  # udisks2: DBus service that allows applications to query and manipulate storage devices
  # When enabled, instructs udisks2 to mount removable drives under `/media/` directory, instead of the
  # default, ACL-controlled `/run/media/$USER/`. Since `/media/` is not mounted as tmpfs by default, it
  # requires cleanup to get rid of stale mountpoints; enabling this option will take care of this at boot.
  services.udisks2.enable = true;

  # devmon: an automatic device mounting daemo
  services.devmon.enable = true;
}
