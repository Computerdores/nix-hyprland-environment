{ inputs, lib, pkgs, system, username, ... }:

{
    imports = [
        ../../common/core/ssh-luks-unlock.nix
        ../../common/core/sddm.nix
        ../../common/programs/thunderbird.nix
        ../../common/programs/nmtui-themed.nix
        ../../common/programs/nix-ld.nix
        ../../common/programs/sleep-inhibit.nix
        ../../common/programs/audio.nix
        ../../common/programs/kwallet.nix
        ../../common/core/nix.nix
    ];

    hardware.bluetooth.enable = true;

    # systemd-boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # networking
    networking = {
        networkmanager.enable = true;
        firewall = {
            allowedTCPPorts = [ 8000 1337 ];
            allowedUDPPorts = [ 9 ];
        };
        interfaces.enp34s0.wakeOnLan.enable = true;  # also requires UDP port 9 exception for firewall
        extraHosts = ''
            192.168.188.1   fritz.box
            192.168.188.47  tower
            192.168.188.49  laptopA315
            192.168.188.138 laptopA315-ethernet
            192.168.188.159 edge
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
        openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMRMNRuoiANZpFGcgzVdYvwfpNF839KRyeLVzJA0s5jQ jann@tower"
        ];
    };

    # fix qt apps under sudo
    security.sudo.extraConfig = ''
        Defaults env_keep += "WAYLAND_DISPLAY XDG_RUNTIME_DIR DISPLAY XAUTHORITY"
    '';

    # general ssh setup
    programs.ssh.startAgent = true;
    services.openssh = {
        enable = true;
        settings.PasswordAuthentication = false;
    };

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
        python3
        file
        libqalculate
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
}
