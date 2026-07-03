extra_args':
args@{ lib, pkgs, config, hyprland-pkgs, ... }:
let
    extra_args = lib.applySchema (import ./schema.nix lib) extra_args';
in
{
    xdg.portal = {
        enable = true;
        extraPortals = [
            pkgs.kdePackages.xdg-desktop-portal-kde
            config.wayland.windowManager.hyprland.portalPackage
        ];
        configPackages = [ config.wayland.windowManager.hyprland.package ];
        config.hyprland.default = [
            "hyprland"
            "kde"
        ];
    };
    wayland.windowManager.hyprland = {
        enable = true;
        package = hyprland-pkgs.hyprland;
        configType = "lua";
        portalPackage = hyprland-pkgs.xdg-desktop-portal-hyprland;
        xwayland.enable = true;
        systemd.enable = true;

        settings = extra_args.overrideFunc {
            config = {
                decoration   = import ./decoration.nix;
                input        = import ./input.nix;
                general      = import ./general.nix;
                misc         = import ./misc.nix;

                dwindle.preserve_split = true;
            };

            device         = import ./device.nix;
            gesture      = import ./gestures.nix;

            workspace_rule = import ./workspace_rule.nix;
            window_rule    = (import ./window_rule.nix) ++ extra_args.windowRules;

            monitor = extra_args.monitors;
        };

        extraConfig = builtins.readFile ./config.lua + ''
            hl.bind("SUPER + T", hl.dsp.exec_cmd("${lib.openDesktopEntryCommand config.xdg.desktopEntries.utils}"))

            -- Autostart
            hl.on("hyprland.start", function ()
              hl.exec_cmd("i3bar-river")
              hl.exec_cmd("ckb-next -b")
              hl.exec_cmd("wl-clip-persist --clipboard both")
              ${extra_args.extraOnStart}
            end)
        '';
    };
    home.packages = with pkgs; [
        brightnessctl
        hyprshutdown
        wl-clip-persist
    ];
}
