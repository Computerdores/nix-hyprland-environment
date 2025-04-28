{ pkgs, config, ... }:
{
    home.packages = [ pkgs.i3bar-river ];
    home.file."${config.xdg.configHome}/i3bar-river/config.toml" = {
        enable = true;
        source = ./config.toml;
    };
}
