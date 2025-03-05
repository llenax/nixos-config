{ lib, ... }:
{
  imports = map (file: import ./${file}) (lib.attrNames(
    lib.filterAttrs(filename: kind:
      filename != "default.nix" &&
        (kind == "regular" && builtins.match ".*\\.nix" filename != null || kind == "directory")
    )
    (builtins.readDir ./.)
  ));
}
