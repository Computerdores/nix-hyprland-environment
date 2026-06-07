args@{ pkgs, ... }:

{
    boot = {
        plymouth = {
            enable = true;
            logo = "${pkgs.nixos-icons}/share/icons/hicolor/128x128/apps/nix-snowflake.png";
            figlet = {
                # from custom module
                message = "Computerdores";
                show_logo = false;
            };
            theme = "figlet";
        };

        kernelParams = [
            "splash"
        ];
    };
}
