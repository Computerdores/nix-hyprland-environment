lib: {
    overrides = lib.mkOption {
        type = lib.types.attrs;
        default = {};
        description = ''
            Override values for the hyprland settings.
            See HM Option: `wayland.windowManager.hyprland.settings`.
        '';
    };
}
