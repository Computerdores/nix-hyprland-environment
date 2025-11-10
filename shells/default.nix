args@{ lib, ... }:

with builtins; let
    dir = ./.;
    regex = "(.*)\\.nix$";
    files = attrNames (lib.filterAttrs (name: type: type == "regular" && match regex name != null && name != "default.nix") (readDir ./.));
in {
    devShells.x86_64-linux = listToAttrs (map (name: {
        name = lib.removeSuffix ".nix" name;
        value = import (dir+"/${name}") args;
    }) files);
}
