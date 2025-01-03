{ inputs, config, lib, pkgs, ... }: 

{
    imports = [
        ./hardware-configuration.nix
    ];

    nixpkgs.config.allowUnfree = true;

    # systemd-boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # networking
    networking.hostName = "nixos-testbed";
    networking.networkmanager.enable = true;

    # area info
    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "en_GB.UTF-8";

    console = {
        keyMap = "de";
    };

    # users
    users.users.jann = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # enable sudo
        initialPassword = "1";
        uid = 1000;
    };

    services.openssh = {
        enable = true;
        settings.PasswordAuthentication = false;
    };

    xdg.portal = {
        enable = true;
        extraPortals = [
            pkgs.xdg-desktop-portal-gtk
        ];
    };

    security.pam.services.hyprlock = {};
    programs.hyprlock= {
        enable = true;
        package = pkgs.hyprlock;
    };

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
    };

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    environment.systemPackages = with pkgs; [
        hyprlock
	hyprland-workspaces
        eww
        git
        tldr
        vivaldi
    ];

    fonts.packages = with pkgs; [
        font-awesome
        noto-fonts
    ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.05"; # don't touch
}
