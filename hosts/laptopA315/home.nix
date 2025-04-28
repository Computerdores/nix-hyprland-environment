{ inputs, config, pkgs, ... }:
let
    utiltool = inputs.utiltool.packages.${pkgs.system}.default;
in {
    imports = [
        ./hyprland
        ./hyprlock.nix
        ./hyprpaper.nix
        ./core/i3bar-river
        ./core/i3status-rust
        ./programs/kitty.nix
        ./programs/firefox.nix
        ./programs/vscode.nix
        ./programs/nnn.nix
        ./programs/neovim.nix
    ];
    programs.bash = {
        enable = true;
        bashrcExtra = builtins.readFile ./.bashrc;
    };
    home = {
        packages = with pkgs; [
            utiltool
            imhex
            ghidra
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

        file."${config.xdg.configHome}/eww" = {
            source = ./eww;
            recursive = true;
        };
        file."${config.xdg.configHome}/hypr/event_handler.sh" = {
            source = ./hyprland/event_handler.sh;
            executable = true;
        };
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    programs.wofi.enable = true;
}
