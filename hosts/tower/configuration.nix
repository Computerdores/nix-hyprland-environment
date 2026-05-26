args@{ inputs, config, lib, pkgs, hyprland-pkgs, flakeDir, system, username, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./intel.nix
        ../../common/core/sddm.nix
        ../../common/programs/thunderbird.nix
        ../../common/programs/nmtui-themed.nix
        ../../common/programs/nix-ld.nix
        ../../common/programs/sleep-inhibit.nix
        ../../common/programs/audio.nix
    ];

    # TODO: remove the following once the default kernel version boots again
    boot.kernelPackages = pkgs.linuxPackages_6_18; # 6.12.76 and 6.12.78 don't boot and this was the oldest, newer version

    hardware.ckb-next.enable = true;
    hardware.ckb-next.package = pkgs.ckb-next.overrideAttrs (old: {
        cmakeFlags = (old.cmakeFlags or [ ]) ++ [ "-DUSE_DBUS_MENU=0" ];
    }); # workaround for https://github.com/NixOS/nixpkgs/issues/444209
    hardware.bluetooth.enable = true;

    # systemd-boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # networking
    networking = {
        # firewall.enable = false;
        hostName = "tower";
        networkmanager.enable = true;
        wg-quick.interfaces = import ./wg-quick;
        extraHosts = ''
            192.168.188.159 edge
            192.168.188.49  laptopA315
        '';
    };

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
    users.groups.nixos-config = { };
    users.users."${username}" = {
        isNormalUser = true;
        description = "Jann Stute";
        extraGroups = [
            "networkmanager"
            "wheel"
            "nixos-config"
        ]; # wheel is for enabling sudo
        initialPassword = "1";
        uid = 1000;
    };

    services.printing.enable = true;
    services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
    };

    services.tailscale = {
        enable = true;
    };

    programs.ssh.startAgent = true;
    services.openssh = {
        enable = true;
        settings.PasswordAuthentication = false;
    };

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

    nix.settings = {
        experimental-features = [
            "nix-command"
            "flakes"
        ];
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };

    nixpkgs.config.allowUnfree = true;

    # adds a list of installed system packages at /etc/current-system-packages
    # from https://www.reddit.com/r/NixOS/comments/fsummx/comment/kt9fb74/
    environment.etc."current-system-packages".text =
        let
            packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
            sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);
            formatted = builtins.concatStringsSep "\n" sortedUnique;
        in
        formatted;

    environment.variables = {
        WP = "/etc/nixos/common/wallpapers";
    };

    # other software
    environment.systemPackages = with pkgs; [
        inputs.rose-pine-hyprcursor.packages.${system}.default
        rose-pine-cursor
        tldr
        tree
        btop
        fastfetch
        inputs.pwndbg.packages.${system}.default
        hyprshot
        bluetuith
        zip
        unzip
        dig
        (lib.gtkEnablePortals pkgs pkgs.localsend)
        signal-desktop
        feishin
        file
        python3
        libqalculate
        (prismlauncher.override { })
    ];

    fonts.packages = with pkgs; [
        font-awesome
        noto-fonts
        nerd-fonts.jetbrains-mono
    ];

    programs.binary-ninja = {
        enable = true;
        package = pkgs.binary-ninja-personal-wayland;
    };

    programs.git = {
        enable = true;
        lfs.enable = true;
        config = {
            init = {
                defaultBranch = "main";
            };
        };
    };

    programs.ghidra = {
        enable = true;
        gdb = true;
    };

    programs.kdeconnect.enable = true;

    programs.ausweisapp = {
        enable = true;
        openFirewall = true;
    };

    programs.steam = {
        enable = true;
        localNetworkGameTransfers.openFirewall = true;
    };

    fileSystems."/mnt/win/c" = {
        device = "/dev/disk/by-uuid/2C08BD3A08BD03BC";
        fsType = "ntfs";
        options = [
            "nofail"
        ];
    };

    fileSystems."/mnt/win/d" = {
        device = "/dev/disk/by-uuid/4036615436614BCA";
        fsType = "ntfs";
        options = [
            "nofail"
        ];
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "25.05"; # don't touch
}
