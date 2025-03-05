{ lib, ... }:
{
  imports = map (file: import ./${file}) (lib.attrNames(
    lib.filterAttrs(filename: kind:
      filename != "default.nix" &&
        (kind == "regular" || kind == "directory")
    )
    (builtins.readDir ./.)
  ));
}
