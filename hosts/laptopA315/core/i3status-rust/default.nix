{ pkgs, ... }:
{
    programs.i3status-rust = {
        enable = true;
        bars = {
            default = {
                theme = "gruvbox-dark";
            };
        };
    };
}
