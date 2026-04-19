{ pkgs, lib, ... }:

let
    wayland = false; # enabling wayland currently leads to a bug when logging in too early
in {
    sddmAstronautTheme = {
        enable = true;
        subtheme = "astronaut";
        themeOverrides = {
            Background = "${../wallpapers/a_new_view_of_the_moon.jpg}";
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

    services.xserver = {
        enable = !wayland;

        config = lib.mkAfter ''
            # Fixes an issue with washed out colors because of the Intel GPU
            Section "Monitor"
                Identifier "HDMI-2"
                Modeline "1920x1080_58.00"  166.00  1920 2040 2240 2560  1080 1083 1088 1119 -hsync +vsync
                Option "PreferredMode" "1920x1080_58.00"
            EndSection
        '';
    };
}
