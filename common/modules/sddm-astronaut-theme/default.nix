{ config, lib, pkgs, ... }:

let
    cfg = config.sddmAstronautTheme or {};
    sddm-astronaut-theme = import ./derivation.nix { pkgs = pkgs; subtheme = cfg.subtheme; };
in {
    options.sddmAstronautTheme = {
        enable = lib.mkEnableOption "sddm astronaut theme";
        subtheme = lib.mkOption {
            type = lib.types.str;
            default = "astronaut";
            description = "Which subtheme of the sddm astronaut theme to use.";
        };
    };

    config = lib.mkIf cfg.enable {
        # Apply the configuration value to the derivation
        environment.systemPackages = [
            sddm-astronaut-theme
        ];

        services.displayManager.sddm.extraPackages = [
            sddm-astronaut-theme
        ];
    };
}
