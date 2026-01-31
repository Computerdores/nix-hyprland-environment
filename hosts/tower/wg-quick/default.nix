let
    dir = "/etc/nixos/hosts/tower/wg-quick";
    names = [];
in builtins.listToAttrs (map (name: {
    name = name;
    value = {
        configFile = "${dir}/${name}.conf";
    };
}) names)

