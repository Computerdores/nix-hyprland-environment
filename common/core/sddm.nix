{ pkgs, ... }:

{
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
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
        theme = "astronaut";
    };
}
