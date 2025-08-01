{ inputs, config, pkgs, ... }:
let
    utiltool = inputs.utiltool.packages.${pkgs.system}.default;
in {
    imports = [
        ./core/hyprland
        ./core/hyprlock.nix
        ./core/hyprpaper.nix
        ./core/i3bar-river
        ./core/i3status-rust.nix
        ./core/wofi.nix
        ./core/hypridle.nix
        ./programs/kitty.nix
        ./programs/firefox.nix
        ./programs/vscode.nix
        ./programs/neovim
        ./programs/clion.nix
        ./programs/yazi.nix
        ./programs/bash
        ./programs/fastfetch.nix
    ];
    programs.utiltool = {
        enable = true;
        system = {
            lock_script = "loginctl lock-session";
        };
    };
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
