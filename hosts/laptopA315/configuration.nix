{ inputs, config, lib, pkgs, ... }: 

{
    imports = [
        ./hardware-configuration.nix
    ];

    sddmAstronautTheme = {
        enable = true;
        subtheme = "astronaut";
        themeOverrides = {
            Background = "${../../common/wallpapers/escaping_the_well.jpg}";
            PartialBlur = "false";
            WarningColor = "#ffffff";
        };
    };
    hardware.ckb-next.enable = true;

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
    users.groups.nixos-config = {};
    users.users.jann = {
        isNormalUser = true;
        description = "Jann Stute";
        extraGroups = [ "networkmanager" "wheel" "nixos-config" ]; # wheel is for enabling sudo
        initialPassword = "1";
        uid = 1000;
    };

    programs.ssh.startAgent = true;
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

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
        tldr
        tree
        btop
        fastfetch
        socat # needed for hyprland event handler script
        pwndbg
    ];

    fonts.packages = with pkgs; [
        font-awesome
        noto-fonts
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    programs.git = {
        enable = true;
        lfs.enable = true;
    };

    programs.nano = {
        enable = true;
        nanorc = builtins.readFile ./.nanorc;
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.05"; # don't touch
}
