{ pkgs, ... }:

let
    wayland = false; # enabling wayland currently leads to a bug when logging in too early
in {
    sddmAstronautTheme = {
        enable = true;
        subtheme = "astronaut";
        themeOverrides = {
            Background = "${../wallpapers/escaping_the_well.jpg}";
            PartialBlur = "false";
            WarningColor = "#ffffff";
        };
    };

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = wayland;
        package = pkgs.kdePackages.sddm;
        theme = "astronaut";
    };
    services.xserver.enable = !wayland;
}
