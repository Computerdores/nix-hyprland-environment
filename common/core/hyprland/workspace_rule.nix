# https://wiki.hypr.land/Configuring/Workspace-Rules/
{ host, ... }:
let
    m0 = if host == "laptopA315" then "eDP-1" else "0"; # TODO: this is a workaround, remove once https://github.com/hyprwm/Hyprland/discussions/15014 is fixed; also see readme
    m1 = "1";
in [
    {
        workspace = "w[tv1]";
        gaps_out  = 0;
        gaps_in   = 0;
    }
    { workspace = "1";  monitor = m0; default_name = "m0-" +  "1"; persistent = true; default = true; }
    { workspace = "2";  monitor = m0; default_name = "m0-" +  "2"; persistent = true; }
    { workspace = "3";  monitor = m0; default_name = "m0-" +  "3"; persistent = true; }
    { workspace = "4";  monitor = m0; default_name = "m0-" +  "4"; persistent = true; }
    { workspace = "5";  monitor = m0; default_name = "m0-" +  "5"; persistent = true; }
    { workspace = "6";  monitor = m0; default_name = "m0-" +  "6"; persistent = true; }
    { workspace = "7";  monitor = m0; default_name = "m0-" +  "7"; persistent = true; }
    { workspace = "8";  monitor = m0; default_name = "m0-" +  "8"; persistent = true; }
    { workspace = "9";  monitor = m0; default_name = "m0-" +  "9"; persistent = true; }
    { workspace = "10"; monitor = m0; default_name = "m0-" + "10"; persistent = true; }
    { workspace = "11"; monitor = m1; default_name = "m1-" +  "1"; persistent = true; default = true; }
    { workspace = "12"; monitor = m1; default_name = "m1-" +  "2"; persistent = true; }
    { workspace = "13"; monitor = m1; default_name = "m1-" +  "3"; persistent = true; }
    { workspace = "14"; monitor = m1; default_name = "m1-" +  "4"; persistent = true; }
    { workspace = "15"; monitor = m1; default_name = "m1-" +  "5"; persistent = true; }
    { workspace = "16"; monitor = m1; default_name = "m1-" +  "6"; persistent = true; }
    { workspace = "17"; monitor = m1; default_name = "m1-" +  "7"; persistent = true; }
    { workspace = "18"; monitor = m1; default_name = "m1-" +  "8"; persistent = true; }
    { workspace = "19"; monitor = m1; default_name = "m1-" +  "9"; persistent = true; }
    { workspace = "20"; monitor = m1; default_name = "m1-" + "10"; persistent = true; }
]
