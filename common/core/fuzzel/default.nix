{ pkgs, ... }:
let
    utils = pkgs.runCommand "utils" { } ''
        mkdir -p $out
        cp -r ${./.}/utils.sh ${./.}/lib.sh ${./.}/scripts/ $out/
        chmod +x $out/utils.sh
    '';
in
{
    xdg.desktopEntries.utils = {
        name = "Utils";
        exec = "${utils}/utils.sh";
        categories = [ "Application" ];
        settings = {
            Path = "${utils}";
        };
    };
    programs.fuzzel = {
        enable = true;
        settings = {
            main = {
                font = "JetBrainsMono Nerd Font:size=9";
                show-actions = true;
                width = 75;
                horizontal-pad = 15;
            };
            border = {
                radius = 6;
            };
            colors = {
                background = "282828ff";
                text = "ebdbb2ff";
                selection = "d65d0eff";
                selection-text = "ebdbb2ff";
                match = "ff0000ff";
                selection-match = "ff0000ff";
                prompt = "ebdbb2ff";
                input = "ebdbb2ff";
            };
        };
    };
}
