{ pkgs, ... }:
{
    programs.i3status-rust = {
        enable = true;
        bars = {
            default = {
                theme = "gruvbox-dark";
                settings = {
                    icons = {
                        icons = "material-nf";
                        overrides = {
                            memory_mem = "";
                            cpu = "";
                            disk_drive = "";
                        };
                    };
                };
            };
        };
    };
}
