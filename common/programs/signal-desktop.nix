{ pkgs, ... }:

{
    home.packages = with pkgs; [
        signal-desktop
    ];
    systemd.user.services."signal-desktop" = {
        Unit.After = [ "network.target" ];
        Service.ExecStart = "${pkgs.signal-desktop}/bin/signal-desktop --start-in-tray";
        Install.WantedBy = [ "default.target" ];
    };
}
