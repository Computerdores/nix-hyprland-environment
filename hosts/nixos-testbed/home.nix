{ config, pkgs, ... }:

{
    programs.bash = {
        enable = true;
        bashrcExtra = builtins.readFile ./.bashrc;
    };
    home = {
        packages = with pkgs; [
            #git
        ];

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
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        xwayland.enable = true;
        systemd.enable = true;

        settings = import ./hyprland/config.nix;
    };
}
