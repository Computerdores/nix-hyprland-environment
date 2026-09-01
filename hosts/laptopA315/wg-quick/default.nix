let
    dir = "/etc/nixos/hosts/laptopA315/wg-quick";
    names = [
        "cyberklub-admin"
        "crypto-vpn"
        "edge"
    ];
in
builtins.listToAttrs (
    map (name: {
        name = name;
        value = {
            configFile = "${dir}/${name}.conf";
        };
    }) names
)
