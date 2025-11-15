{ pkgs, config, ... }:
{
    programs.i3status-rust = {
        enable = true;
        bars = {
            default = {
                settings = {
                    theme = {
                        theme = "gruvbox-dark";
                        overrides = {
                            alternating_tint_bg = "#111111";
                            alternating_tint_fd = "#111111";
                        };
                    };
                    icons = {
                        icons = "material-nf";
                        overrides = {
                            memory_mem = "";
                            cpu = "";
                            disk_drive = "";
                            eye = "󰈈";      # nf-md-eye
                            eye-off = "󰈉";  # nf-md-eye-off
                        };
                    };
                };
                blocks = [
                    {
                        block = "toggle";
                        command_on = ''
                            sleep-inhibit true
                        '';
                        command_off = ''
                            sleep-inhibit false
                        '';
                        command_state = "sleep-inhibit status";
                        interval = 1;
                        format = " $icon ";
                        icon_on = "eye";
                        icon_off = "eye-off";
                        state_on = "warning";
                    }
                    {
                        block = "backlight";
                        minimum = 0;
                    }
                    {
                        block = "cpu";
                        format = " $icon  $utilization ";
                    }
                    { block = "temperature"; }
                    {
                        block = "net";
                        format = " $icon {$ssid|Wired Connection} ";
                        format_alt = " ^icon_net_down $speed_down.eng(prefix:K) ^icon_net_up $speed_up.eng(prefix:K) ";
                    }
                    { block = "sound"; }  # todo
                    {
                        block = "battery";
                        full_format         = " $icon $percentage ";
                        charging_format     = " $icon $percentage ";
                        not_charging_format = " $icon $percentage ";
                        empty_format        = " $icon $percentage ";
                    }
                    {
                        block = "time";
                        timezone = "Europe/Berlin";
                        interval = 1;
                        format = " $icon $timestamp.datetime(f:'%d. %B %H:%M:%S', l:de_DE) ";
                    }
                ];
            };
        };
    };
}
