{ inputs, config, pkgs, ... }:
{
    imports = [
        (import ../../common/core/hyprland {
            overrides.monitor = [
                "eDP-1,preferred,0x0,1"
                ",preferred,auto-right,1"
            ];
        })
        ../../common/core/hyprlock.nix
        ../../common/core/hyprpaper.nix
        ../../common/core/i3bar-river
        ./core/i3status-rust.nix
        ../../common/core/wofi
        ../../common/core/hypridle.nix
        ../../common/programs/kitty.nix
        ../../common/programs/firefox.nix
        ../../common/programs/vscode.nix
        ../../common/programs/neovim
        ../../common/programs/clion.nix
        ../../common/programs/yazi.nix
        ../../common/programs/bash
        ../../common/programs/fastfetch.nix
    ];
    home = {
        packages = with pkgs; [
            imhex
        ];

        # Home Manager needs a bit of information about you and the
        # paths it should manage.
        username = "jann";
        homeDirectory = "/home/jann";

        pointerCursor = {
            name = "BreezeX-RosePine-Linux";
            package = pkgs.rose-pine-cursor;
            size = 24;
            gtk.enable = true;
        };

        # This value determines the Home Manager release that your
        # configuration is compatible with. This helps avoid breakage
        # when a new Home Manager release introduces backwards
        # incompatible changes.
        #
        # You can update Home Manager without changing this value. See
        # the Home Manager release notes for a list of state version
        # changes in each release.
        stateVersion = "24.05";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
