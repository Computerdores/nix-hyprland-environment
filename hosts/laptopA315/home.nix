{ config, pkgs, ... }:

{
    programs.bash = {
        enable = true;
        bashrcExtra = builtins.readFile ./.bashrc;
    };
    home = {
        packages = with pkgs; [ ];

        # Home Manager needs a bit of information about you and the
        # paths it should manage.
        username = "jann";
        homeDirectory = "/home/jann";

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
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    # Desktop Environment
    programs.kitty = {
        enable = true;
        shellIntegration.enableBashIntegration = true;
        settings = {
            #allow_remote_control = true;
            background_opacity = "0.8";
        };
    };

    programs.wofi.enable = true;
    programs.nnn.enable = true;
    programs.hyprlock = {
        enable = true;
        settings = import ./hyprlock.nix;
    };
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        xwayland.enable = true;
        systemd.enable = true;

        settings = import ./hyprland/config.nix;
    };

    # other programs
    programs.firefox = {
        enable = true;
        profiles.jann = {
            id = 0;
            name = "jann";
            search.force = true;
            search.default = "DuckDuckGo";
            search.engines = {
                "Nix Packages" = {
                    urls = [{ template = "https://search.nixos.org/packages?query={searchTerms}"; }];
                    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                    definedAliases = [ "@np" ];
                };
                "NixOS Wiki" = {
                    urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
                    iconUpdateURL = "https://wiki.nixos.org/favicon.png";
                    updateInterval = 24 * 60 * 60 * 1000;
                    definedAliases = [ "@nw" ];
                };
            };
        };
        policies = {
           Preferences = {
                browser.backspace_action = 0;
                browser.tabs.closeWindowWithLastTab = false;
            };
        };
    };
}
