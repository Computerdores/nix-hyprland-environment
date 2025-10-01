{ inputs, pkgs, config, ... }:
{
    home.packages = [ inputs.i3bar-river.packages.${pkgs.system}.hyprland ];    # TODO: use nixpkgs version once #47, #48, #49 are merged and have arrived in nixpkgs
    home.file."${config.xdg.configHome}/i3bar-river/config.toml" = {
        enable = true;
        source = ./config.toml;
    };
}
