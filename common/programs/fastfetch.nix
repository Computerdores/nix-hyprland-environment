{ ... }:

{
    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                color = {
                    "1" = "38;2;82;119;195";
                    "2" = "38;2;126;186;228";
                };
            };
            modules = [
                "title"
                "separator"
                "os"
                "host"
                "kernel"
                "uptime"
                "packages"
                "shell"
                "display"
                "de"
                "wm"
                "wmtheme"
                "theme"
                "icons"
                "font"
                "cursor"
                "terminal"
                "terminalfont"
                "cpu"
                "gpu"
                "memory"
                "swap"
                "disk"
                "localip"
                "battery"
                "poweradapter"
                "locale"
                "break"
                "colors"
            ];
        };
    };
}
