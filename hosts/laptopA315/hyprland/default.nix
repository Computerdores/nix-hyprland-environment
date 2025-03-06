{ pkgs, ... }: {
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        xwayland.enable = true;   
        systemd.enable = true;

        settings = {
            "$terminal" = "kitty";
            "$fileManager" = "$terminal -e nnn -a";
            "$menu" = "wofi --show drun";
            "$mainMod" = "SUPER";

            monitor      = import ./monitor.nix;
            exec-once    = import ./exec-once.nix;
            env          = import ./env.nix;
            input        = import ./input.nix;
            device       = import ./device.nix;
            general      = import ./general.nix;
            decoration   = import ./decoration.nix;
            animations   = import ./animations.nix;

            # layouts
            dwindle      = import ./dwindle.nix;
            master       = import ./master.nix;

            gestures     = import ./gestures.nix;
            misc         = import ./misc.nix;
            windowrulev2 = import ./windowrulev2.nix;
            bind         = import ./bind.nix;
            bindm        = import ./bindm.nix;
        };
    };
}
