{ config, lib, pkgs, ... }:

{
    assertions = [
        {
            assertion = config.boot.initrd.systemd.enable;
            message = "systemd required in initrd";
        }
    ];
    boot.initrd = {
        availableKernelModules = [ "r8169" ]; # support for network card
        systemd = {
            extraBin.unlock = pkgs.writeShellScript "unlock" ''systemctl default'';
            users.root.shell = "/bin/unlock";
            network = {
                enable = true;
                networks."10-ethernet" = {
                    matchConfig.Name = "enp*";
                    networkConfig.DHCP = true;
                    linkConfig.RequiredForOnline = "routable";
                };
            };
        };
        network = {
            enable = true;
            ssh = {
                enable = true;
                port = 2222;
                # set all root users as authorized to unlock LUKS
                authorizedKeys = with lib; concatLists (mapAttrsToList (name: user: if elem "wheel" user.extraGroups then user.openssh.authorizedKeys.keys else []) config.users.users);
                hostKeys = [ "/etc/secrets/initrd/ssh_host_ed25519_key" ];
            };
        };
    };
}
