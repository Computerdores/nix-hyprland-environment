args@{ pkgs, lib, config, ... }:
let
    moduleName = "xdg-desktop-portal-termfilechooser";
    package = pkgs.xdg-desktop-portal-termfilechooser;
    cfg = config.${moduleName};
in {
    options.${moduleName} = {
        enable = lib.mkEnableOption moduleName;
    };

    config = lib.mkIf cfg.enable {
        xdg.portal = {
            config.hyprland."org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
            extraPortals = [ package ];
        };

        environment.systemPackages = [ package ];
    };
}