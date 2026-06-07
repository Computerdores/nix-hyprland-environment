# https://wiki.hypr.land/Configuring/Workspace-Rules/
let
    i = import ../../invisible_characters.nix;
    i0 = (builtins.elemAt i 0);
    i1 = (builtins.elemAt i 1);
in
[
    {
        workspace = "w[tv1]";
        gaps_out  = 0;
        gaps_in   = 0;
    }
    { workspace = "1";  monitor = "0"; default_name = i0 +  "1"; persistent = true; default = true; }
    { workspace = "2";  monitor = "0"; default_name = i0 +  "2"; persistent = true; }
    { workspace = "3";  monitor = "0"; default_name = i0 +  "3"; persistent = true; }
    { workspace = "4";  monitor = "0"; default_name = i0 +  "4"; persistent = true; }
    { workspace = "5";  monitor = "0"; default_name = i0 +  "5"; persistent = true; }
    { workspace = "6";  monitor = "0"; default_name = i0 +  "6"; persistent = true; }
    { workspace = "7";  monitor = "0"; default_name = i0 +  "7"; persistent = true; }
    { workspace = "8";  monitor = "0"; default_name = i0 +  "8"; persistent = true; }
    { workspace = "9";  monitor = "0"; default_name = i0 +  "9"; persistent = true; }
    { workspace = "10"; monitor = "0"; default_name = i0 + "10"; persistent = true; }
    { workspace = "11"; monitor = "1"; default_name = i1 +  "1"; persistent = true; default = true; }
    { workspace = "12"; monitor = "1"; default_name = i1 +  "2"; persistent = true; }
    { workspace = "13"; monitor = "1"; default_name = i1 +  "3"; persistent = true; }
    { workspace = "14"; monitor = "1"; default_name = i1 +  "4"; persistent = true; }
    { workspace = "15"; monitor = "1"; default_name = i1 +  "5"; persistent = true; }
    { workspace = "16"; monitor = "1"; default_name = i1 +  "6"; persistent = true; }
    { workspace = "17"; monitor = "1"; default_name = i1 +  "7"; persistent = true; }
    { workspace = "18"; monitor = "1"; default_name = i1 +  "8"; persistent = true; }
    { workspace = "19"; monitor = "1"; default_name = i1 +  "9"; persistent = true; }
    { workspace = "20"; monitor = "1"; default_name = i1 + "10"; persistent = true; }
]
