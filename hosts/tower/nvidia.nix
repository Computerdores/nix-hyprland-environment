# See: https://nixos.wiki/wiki/Nvidia
{ config, lib, pkgs, ... }:

{
    services.xserver.videoDrivers = ["nvidia"];
    hardware = {
        graphics.enable = true;
        nvidia = {
            modesetting.enable = true;
            # powerManagement.enable = true;
            # powerManagement.finegrained = false;
            open = true;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.stable;
        };
    };
}
