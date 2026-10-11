{ config, ... }:
{
    xdg.userDirs = {
        download = "${config.home.homeDirectory}/downloads";
        pictures = "${config.home.homeDirectory}/pictures";
    };
}
