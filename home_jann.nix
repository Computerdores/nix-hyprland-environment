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
                "$terminal" = "sh -c \"kitty &> out.log\"";
                "$fileManager" = "nnn";
                "$menu" = "wofi --show drun";
                "$mainMod" = "SUPER";
                bind = [
                    "$mainMod, Q, exec, $terminal"
                    "$mainMod, C, killactive"
                    "$mainMod, M, exit"
                    "$mainMod, E, exec, $fileManager"
                    "$mainMod, V, togglefloating"
                    "$mainMod, R, exec, $menu"
                    "$mainMod, P, pseudo"       # dwindle
                    "$mainMod, J, togglesplit"  # dwindle

                    "$mainMod, left, movefocus, l"
                    "$mainMod, right, movefocus, r"
                    "$mainMod, up, movefocus, u"
                    "$mainMod, down, movefocus, d"

                    #todo
                ];
                
                input = {
                    kb_layout = "de";
                    kb_model = "pc105";
                    follow_mouse = 1;
                    touchpad.natural_scroll = true;
                };

                monitor = [
                    ",1920x1080@60,0x0,1"
                ];

                env = [
                    "XCURSOR_SIZE,24"
                    "QT_QPA_PLATFORMTHEME,qt5ct"
                ];
                debug.disable_logs = false;
                debug.enable_stdout_logs = true;
            };
        };
    };
}