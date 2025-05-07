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
                        };
                    };
                };
                blocks = [
                    {
                        block = "cpu";
                        format = " $icon  $utilization ";
                    }
                    {
                        block = "memory";
                        format = " $icon  $mem_used_percents ";
                    }
                    {
                        block = "disk_space";
                        format = " $icon  $used / $total ";
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
                    {
                        block = "menu";
                        text = " POWR ";
                        items = [
                            {   # shutdown
                                display = "     ";
                                cmd = "systemctl poweroff";
                                confirm_msg = " U sure? ";
                            }
                            {   # reboot
                                display = "     ";
                                cmd = "systemctl reboot";
                                confirm_msg = " U sure? ";
                            }
                            {   # hibernate
                                display = "     ";
                                cmd = "hyprlock --immediate & systemctl hibernate";
                            }
                            {   # suspend
                                display = "     ";
                                cmd = "hyprlock --immediate & systemctl suspend";
                            }
                            {   # logout
                                display = "     ";
                                cmd = "hyprctl dispatch exit"; # TODO: graceful logout using uwsm or similar
                                confirm_msg = " U sure? ";
                            }
                            {   # lock
                                display = "     ";
                                cmd = "hyprlock --immediate &";
                            }
                        ];
                    }
                ];
            };
        };
    };
}
