{ ... }: {
    programs.kitty = {
        enable = true;
        themeFile = "gruvbox-dark-hard";
        shellIntegration.enableBashIntegration = true;
        settings = {
            allow_remote_control = "socket";
            background_opacity = "0.8";
            listen_on = "tcp:localhost:0";
        };
    };
}
