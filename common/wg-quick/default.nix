let
    dir = "/etc/nixos/common/wg-quick";
    names = []; #["cyberklub" "pp25-staging"];
in builtins.listToAttrs (map (name: {
    name = name;
    value = {
        configFile = "${dir}/${name}.conf";
    };
}) names)

