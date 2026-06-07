# see https://wiki.hypr.land/Configuring/Basics/Window-Rules/ for more
[
    {
        name = "suppress-maximize";
        match.class = ".*";
        suppress_event = "maximize";
    }
    {
        name = "maximize-lone-windows";
        match = {
            float = 0;
            workspace = "w[tv1]";
        };
        rounding = 0;
        border_size = 0;
    }
    {
        name = "ghidra-tiling";
        match = {
            class = "ghidra-Ghidra";
            title = "CodeBrowser.*";
        };
        tile = true;
    }
]
