args@{ pkgs, ... }:

{
    boot = {
        plymouth = {
            enable = true;
            logo = "${pkgs.nixos-icons}/share/icons/hicolor/128x128/apps/nix-snowflake.png";
            figlet = { # from custom module
                message = "Computerdores";
                show_logo = false;
            };
            theme = "figlet";
        };

        # initrd.systemd.enable = true; # needed for graphical luks unlock - currently somewhat broken
        kernelParams = [
            "splash"
        ];
    };
}
