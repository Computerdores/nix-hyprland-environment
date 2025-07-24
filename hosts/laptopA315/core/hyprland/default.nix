{ pkgs, config, ... }: {
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        xwayland.enable = true;   
        systemd.enable = false;

        settings = {
            "$terminal" = "uwsm app -- kitty";
            "$fileManager" = "uwsm app -T -- yazi";
            "$menu" = "uwsm app -- wofi --show drun";
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
            workspace    = import ./workspace.nix;
            windowrulev2 = import ./windowrulev2.nix;
            bind         = import ./bind.nix;
            bindm        = import ./bindm.nix;
        };
    };
}
