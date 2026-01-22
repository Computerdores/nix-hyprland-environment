let
    dir = "/etc/nixos/common/wg-quick";
    names = ["cyberklub" "crypto-vpn" "edge"];
in builtins.listToAttrs (map (name: {
    name = name;
    value = {
        configFile = "${dir}/${name}.conf";
    };
}) names)

