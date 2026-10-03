args@{ config, pkgs, hyprland-pkgs, username, ... }:

let
    user = config.users.users."${username}";
    uid = user.uid;
    gid = config.users.groups."${user.group}".gid;
    tostr = builtins.toString;
in {
    imports = [
        ./hardware-configuration.nix
        ./intel.nix
        ../../common/core
    ];

    hardware.ckb-next.enable = true;
    hardware.ckb-next.package = pkgs.ckb-next.overrideAttrs (old: {
        cmakeFlags = (old.cmakeFlags or [ ]) ++ [ "-DUSE_DBUS_MENU=0" ];
    }); # workaround for https://github.com/NixOS/nixpkgs/issues/444209

    users.users."${username}".extraGroups = [ "libvirtd" ];

    # virtualisation
    virtualisation = {
        libvirtd.enable = true;
        spiceUSBRedirection.enable = true;
    };
    programs.virt-manager.enable = true;

    services.printing.enable = true;
    services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
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

    # other software
    environment.systemPackages = with pkgs; [
        feishin
        (prismlauncher.override { })
        passt  # needed for virtualisation
    ];

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
            "uid=${tostr uid}"
            "gid=${tostr gid}"
            "fmask=177" # rw-------
            "dmask=077" # rwx------
        ];
    };

    fileSystems."/mnt/win/d" = {
        device = "/dev/disk/by-uuid/4036615436614BCA";
        fsType = "ntfs";
        options = [
            "nofail"
            "uid=${tostr uid}"
            "gid=${tostr gid}"
            "fmask=177" # rw-------
            "dmask=077" # rwx------
        ];
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "25.05"; # don't touch
}
