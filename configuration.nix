{ config, lib, pkgs, ... }: 

{
    imports = [
        ./hardware-configuration.nix
    ];

    # systemd-boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "en_GB.UTF-8";

    # users
    users.users.jann = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # enable sudo
        initialPassword = "1";
        uid = 1000;
    };

    # copy config to system
    system.copySystemConfiguration = true;

    system.stateVersion = "24.05"; # don't touch
}