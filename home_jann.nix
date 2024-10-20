# this acts like a home.nix for user jann
{ config, pkgs, ... }:

{
    home-manager.users.jann = {
        home = {
            stateVersion = "24.05";
        };
        programs.bash.enable = true;
        programs.kitty.enable = true;
        wayland.windowManager.hyprland = {
            enable = true;
            package = pkgs.hyprland;
            xwayland.enable = true;
            systemd.enable = true;

            settings = {
                "$terminal" = "kitty";
                "$mainMod" = "SUPER";
                bind = [
                    "$mainMod, Q, exec, $terminal"
                    "$mainMod, C, killactive"
                    "$mainMod, M, exit"
                ];
                input = {
                    kb_layout = "de";
                    kb_model = "pc105";
                };
                monitor = [
                    ",192x1080@60,0x0,1"
                ];
            };
        };
    };
}