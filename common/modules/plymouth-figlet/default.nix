args@{ config, lib, pkgs, ... }:

let
    cfg = config.boot.plymouth.figlet or {};
    themePackage = import ./derivation.nix (args // {
        message = cfg.message;
        show_logo = cfg.show_logo;
    });
in {
    options.boot.plymouth.figlet = {
        message = lib.mkOption {
            type = lib.types.str;
            default = "Computerdores";
            description = "The text that is rendered via figlet.";
        };
        show_logo = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Whether to show the nixos logo below the progress bar.";
        };
    };

    config = lib.mkIf (config.boot.plymouth.theme == "figlet") {
        boot.plymouth.themePackages = [ themePackage ];
    };
}
