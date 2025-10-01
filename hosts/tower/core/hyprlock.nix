{ ... }: {
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                ignore_empty_input = true;
                grace = 300;
                hide_cursor = true;
                no_fade_in = false;
            };
            background = {
                path = "screenshot";
                blur_passes = 3;
                blur_size = 8;
            };
            input-field = {
                size = "200, 50";
                position = "0, 300";
                outline_thickness = 2;
                placeholder_text = "Input Password...";
                font_family = "JetBrainsMono Nerd Font Mono";
                halign = "center";
                valign = "bottom";
                inner_color = "rgba(49,50,68,0.5)";
                outer_color = "rgba(69,71,90,0.5)";
                check_color = "rgba(20,10,100,1)";
                capslock_color = "rgba(204,136,34,1)";
                font_color = "rgba(200,200,200,1)";
                fade_on_empty = false;
            };
            label = {
                text = "$TIME";
                font_size = 90;
                font_family = "JetBrainsMono Nerd Font Mono ExtraBold";
                position = "0, -250";
                halign = "center";
                valign = "top";
            };
        };
    };
}
