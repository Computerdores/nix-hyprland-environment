# https://wiki.hypr.land/Configuring/Workspace-Rules/
let
    i = import ../../../../common/invisible_characters.nix;
    i0 = (builtins.elemAt i 0);
    i1 = (builtins.elemAt i 1);
in [
    "w[tv1], gapsout:0, gapsin:0"
     ("1, monitor:eDP-1, defaultName:"    + i0 +  "1, persistent:true, default:true")
     ("2, monitor:eDP-1, defaultName:"    + i0 +  "2, persistent:true")
     ("3, monitor:eDP-1, defaultName:"    + i0 +  "3, persistent:true")
     ("4, monitor:eDP-1, defaultName:"    + i0 +  "4, persistent:true")
     ("5, monitor:eDP-1, defaultName:"    + i0 +  "5, persistent:true")
     ("6, monitor:eDP-1, defaultName:"    + i0 +  "6, persistent:true")
     ("7, monitor:eDP-1, defaultName:"    + i0 +  "7, persistent:true")
     ("8, monitor:eDP-1, defaultName:"    + i0 +  "8, persistent:true")
     ("9, monitor:eDP-1, defaultName:"    + i0 +  "9, persistent:true")
    ("10, monitor:eDP-1, defaultName:"    + i0 + "10, persistent:true")
    ("11, monitor:HDMI-A-1, defaultName:" + i1 +  "1, persistent:true, default:true")
    ("12, monitor:HDMI-A-1, defaultName:" + i1 +  "2, persistent:true")
    ("13, monitor:HDMI-A-1, defaultName:" + i1 +  "3, persistent:true")
    ("14, monitor:HDMI-A-1, defaultName:" + i1 +  "4, persistent:true")
    ("15, monitor:HDMI-A-1, defaultName:" + i1 +  "5, persistent:true")
    ("16, monitor:HDMI-A-1, defaultName:" + i1 +  "6, persistent:true")
    ("17, monitor:HDMI-A-1, defaultName:" + i1 +  "7, persistent:true")
    ("18, monitor:HDMI-A-1, defaultName:" + i1 +  "8, persistent:true")
    ("19, monitor:HDMI-A-1, defaultName:" + i1 +  "9, persistent:true")
    ("20, monitor:HDMI-A-1, defaultName:" + i1 + "10, persistent:true")
]
