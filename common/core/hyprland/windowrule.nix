# see https://wiki.hyprland.org/Configuring/Window-Rules/ for more
[
    {
        name = "suppress-maximize";
        suppress_event = "maximize";
        "match:class" = ".*";
    }
    {
        name = "maximize-lone-windows";
        rounding = 0;
        border_size = 0;
        "match:float" = 0;
        "match:workspace" = "w[tv1]";
    }
    {
        name = "ghidra-tiling";
        tile = "on";
        "match:class" = "ghidra-Ghidra";
        "match:title" = "CodeBrowser.*";
    }
]
