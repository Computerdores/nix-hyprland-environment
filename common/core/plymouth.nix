args@{ pkgs, ... }:

let
    theme = "colorful_sliced";
in {
    boot = {
        plymouth = {
            enable = true;
            logo = "${pkgs.nixos-icons}/share/icons/hicolor/128x128/apps/nix-snowflake.png";
            theme = "figlet";
            themePackages = [ (import ../modules/plymouth-figlet/derivation.nix (args // {
                message = "Computerdores";
                show_logo = false;
            })) ];
            # theme = theme;
            # themePackages = [
            #     (pkgs.adi1090x-plymouth-themes.override {
            #         selected_themes = [ theme ];
            #     })
            # ];
        };

        # initrd.systemd.enable = true; # needed for graphical luks unlock - currently somewhat broken
        kernelParams = [
            "splash"
        ];
    };
}
