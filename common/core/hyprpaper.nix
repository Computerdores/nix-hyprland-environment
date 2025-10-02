{ ... }: {
    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = false;
            preload = import ../wallpapers;
            wallpaper = [
                #",/etc/nixos/common/wallpapers/aenami/aenami_the_day_you_left.jpg"
                ",/etc/nixos/common/wallpapers/aenami/aenami_at_last.jpg"
            ];
        };
    };
}
