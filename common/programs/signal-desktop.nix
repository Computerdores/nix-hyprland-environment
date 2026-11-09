{ pkgs, ... }:

{
    home.packages = with pkgs; [
        signal-desktop
    ];
    systemd.user.services."signal-desktop" = {
        Unit.After = [ "network.target" "hyprland-session.target" "graphical-session.target" ];
        Service = {
            ExecStart = "${pkgs.signal-desktop}/bin/signal-desktop --start-in-tray";
            Restart = "on-failure";
            RestartSec = "3";
        };
        Install.WantedBy = [ "graphical-session.target" ];
    };
}
