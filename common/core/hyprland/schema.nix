lib: {
    overrideFunc = lib.mkOption {
        type = lib.types.functionTo lib.types.attrs;
        default = (old: old);
        description = ''
            Override function for the hyprland settings - takes one parameter: old, returns new.
            See HM Option: `wayland.windowManager.hyprland.settings`.
        '';
    };
    extraOnStart = lib.mkOption {
        type = lib.types.str;
        default = "";
        example = ''hl.exec_cmd("echo hello world");'';
        description = ''
            Extra lua code to call on hyprland.start event.
        '';
    };
    monitors = lib.mkOption {
        type = lib.types.listOf lib.types.attrs;
        default = [];
        example = ''
            [
                {
                    output = "HDMI-A-2";
                    mode = "1920x1080@58";
                    position = "0x0";
                    scale = "1";
                }
            ];
        '';
    };
}
