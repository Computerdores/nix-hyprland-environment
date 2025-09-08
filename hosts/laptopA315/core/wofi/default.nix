{ pkgs, ... }:
let
    utils = pkgs.runCommand "utils" {} ''
        mkdir -p $out
        cp -r ${./.}/utils.sh ${./.}/lib.sh ${./.}/scripts/ $out/
        chmod +x $out/utils.sh
    '';
in {
    xdg.desktopEntries.utils = {
        name = "Utils";
        exec = "uwsm app -- ${utils}/utils.sh";
        categories = [ "Application" ];
        settings = {
            Path = "${utils}";
        };
    };
    programs.wofi = {
        enable = true;
        settings = {
            key_expand = "Right";
        };
        style = ''
            * {
                font-family: "JetBrainsMono Nerd Font";
                color: #ebdbb2;
            }
            #input {
                background-color: #282828;
            }
            #window {
                background-color: #282828;
            }
            #entry, #entry * {
                background-color: #282828;
            }
            #entry:selected, #entry:selected * {
                background-color: #d65d0e;
            }
        '';
    };
}

