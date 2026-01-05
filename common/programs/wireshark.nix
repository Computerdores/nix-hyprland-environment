{ pkgs, username, ... }:

{
    programs.wireshark = {
        enable = true;
        dumpcap.enable = true;
        package = pkgs.wireshark;
    };
    users.users."${username}".extraGroups = [ "wireshark" ];
}
