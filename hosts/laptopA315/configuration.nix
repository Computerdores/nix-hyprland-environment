{ inputs, config, lib, pkgs, ... }: 

{
    imports = [
        ./hardware-configuration.nix
    ];

    sddmAstronautTheme = {
        enable = true;
        subtheme = "escaping-the-well";
    };

    # systemd-boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # networking
    networking.hostName = "LaptopA315";
    networking.networkmanager.enable = true;

    # area info
    time.timeZone = "Europe/Berlin";
    i18n = {
        defaultLocale = "en_GB.UTF-8";
        extraLocaleSettings = {
            LC_ADDRESS = "de_DE.UTF-8";
            LC_IDENTIFICATION = "de_DE.UTF-8";
            LC_MEASUREMENT = "de_DE.UTF-8";
            LC_MONETARY = "de_DE.UTF-8";
            LC_NAME = "de_DE.UTF-8";
            LC_NUMERIC = "de_DE.UTF-8";
            LC_PAPER = "de_DE.UTF-8";
            LC_TELEPHONE = "de_DE.UTF-8";
            LC_TIME = "de_DE.UTF-8";
        };
    };

    services.xserver.xkb = {
        layout = "de";
        variant = "nodeadkeys";
    };

    console.keyMap = "de";

    # users
    users.users.jann = {
        isNormalUser = true;
        description = "Jann Stute";
        extraGroups = [ "networkmanager" "wheel" ]; # wheel is for enabling sudo
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
        package = pkgs.kdePackages.sddm;
        theme = "astronaut";
    };

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    nixpkgs.config.allowUnfree = true;

    # adds a list of installed system packages at /etc/current-system-packages
    # from https://www.reddit.com/r/NixOS/comments/fsummx/comment/kt9fb74/
    environment.etc."current-system-packages".text =
    let
        packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
        sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);
        formatted = builtins.concatStringsSep "\n" sortedUnique;
    in formatted;

    environment.variables = {
        WP = "/etc/nixos/common/wallpapers";
    };

    # other software
    environment.systemPackages = with pkgs; [
        inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
        rose-pine-cursor
        hyprlock
        hyprland-workspaces
        eww
        git
        tldr
        vivaldi
        tree
        btop
    ];

    fonts.packages = with pkgs; [
        font-awesome
        noto-fonts
    ];

    programs.nano = {
        enable = true;
        nanorc = builtins.readFile ./.nanorc;
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.05"; # don't touch
}
