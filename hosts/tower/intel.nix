# See: https://wiki.nixos.org/wiki/Intel_Graphics
{ config, lib, pkgs, ... }:

{
    services.xserver.videoDrivers = ["modesetting"];
    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            intel-media-driver
            vpl-gpu-rt
        ];
    };
    environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "iHD";
    };
}
