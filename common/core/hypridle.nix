{ inputs, pkgs, ... }:

let
    brightness_cmd = "${pkgs.brightnessctl}/bin/brightnessctl";
in {
    services.hypridle = {
        enable = true;
        package = (pkgs.hypridle.overrideAttrs (oldAttrs: { buildInputs = (oldAttrs.buildInputs or []) ++ [ pkgs.brightnessctl ]; }));
        settings = {
            general = {
                lock_cmd = "pidof hyprlock || hyprlock --immediate";
                before_sleep_cmd = "loginctl lock-session";
                after_sleep_cmd  = "hyprctl dispatch dpms on";
            };
            listener = [
                {
                    timeout = 300;                              # 5min
                    on-timeout = "${brightness_cmd} -s set 0";
                    on-resume  = "${brightness_cmd} -r";
                }
                {
                    timeout = 600;                              # 10min
                    on-timeout = "loginctl lock-session";
                }
                {
                    timeout = 630;                              # 10min + 30s
                    on-timeout = "hyprctl dispatch dpms off";
                    on-resume  = "hyprctl dispatch dpms on && ${brightness_cmd} -r";
                }
                {
                    timeout = 1200;                             # 20min
                    on-timeout = "systemctl hibernate";
                }
            ];
        };
    };
}
