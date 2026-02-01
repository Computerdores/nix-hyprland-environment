lib: {
    overrideFunc = lib.mkOption {
        type = lib.types.functionTo lib.types.attrs;
        default = {};
        description = ''
            Override function for the hyprland settings - takes one parameter: old, returns new.
            See HM Option: `wayland.windowManager.hyprland.settings`.
        '';
    };
}
