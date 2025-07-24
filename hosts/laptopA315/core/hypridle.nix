{ inputs, pkgs, ... }:

let
    utiltool_pkg = inputs.utiltool.packages.${pkgs.system}.default;
    brightness_cmd = "${pkgs.brightnessctl}/bin/brightnessctl";
    utiltool_cmd = "${utiltool_pkg}/bin/utiltool";
in {
    services.hypridle = {
        enable = true;
        package = (pkgs.hypridle.overrideAttrs (oldAttrs: { buildInputs = (oldAttrs.buildInputs or []) ++ [ utiltool_pkg pkgs.brightnessctl ]; }));
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
                    on-timeout = "${utiltool_cmd} system hibernate";
                }
            ];
        };
    };
}
