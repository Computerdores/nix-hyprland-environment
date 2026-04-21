{ pkgs, ... }:
{
    programs.nix-ld = { # enables running non-nixos-native binaries
        enable = true;
        libraries = with pkgs; [
            # put libs here to be provided to those binaries
        ];
    };
}
