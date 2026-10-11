{ config, ... }:
{
    programs.hyprshot = {
        enable = true;
        saveLocation = "${config.xdg.userDirs.pictures}/screenshots";
    };
}
