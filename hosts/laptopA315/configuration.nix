args@{ inputs, pkgs, hyprland-pkgs, system, ... }:

let
    portal-escape = inputs.portal-escape.packages.${system}.default;
in
{
    imports = [
        ./hardware-configuration.nix
        ../../common/core
        ../../common/core/plymouth.nix
        ../../common/programs/wireshark.nix
        ../../common/udev.nix
    ];

    swapDevices = [
        {
            device = "/var/lib/swapfile";
            size = 16 * 1024;
        }
    ];

    virtualisation.docker.enable = true;

    hardware.ckb-next.enable = true;

    boot.kernelModules = [ "cdc_acm" ];

    # networking
    networking = {
        networkmanager = {
            settings.connectivity = {
                uri = "http://detectportal.firefox.com/canonical.html";
                response = ''<meta http-equiv="refresh" content="0;url=https://support.mozilla.org/kb/captive-portal"/>'';
            };
            dispatcherScripts = [
                {
                    type = "basic";
                    source = "${portal-escape}/bin/portal-escape";
                }
            ];
        };
    };

    services.udev.extraHwdb = ''
        evdev:input:b0011v0001p0001
         KEYBOARD_KEY_71=mute
    '';

    security.pam.services.hyprlock = { };
    programs.hyprlock = {
        enable = true;
        package = pkgs.hyprlock;
    };

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        package = hyprland-pkgs.hyprland;
        portalPackage = hyprland-pkgs.xdg-desktop-portal-hyprland;
    };

    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    # other software
    environment.systemPackages = with pkgs; [
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.05"; # don't touch
}
