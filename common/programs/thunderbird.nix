{ pkgs, ... }:

{
    programs.thunderbird = {
        enable = true;
        package = (pkgs.symlinkJoin {
            name = "thunderbird-nogtk";
            paths = [ pkgs.thunderbird ];
            buildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
                wrapProgram $out/bin/thunderbird \
                    --set GTK_USE_PORTAL "1"
            '';
        });
        preferences = {
            "mail.tabs.drawInTitlebar"    = false; # hide gnome exit button in titlebar
            "mail.tabs.autoHide"          = false;

            "mailnews.start_page.enabled" = false;
            "mailnews.default_sort_type"  = 18;
            "mailnews.default_sort_order" =  1;
            "security.default_personal_cert" = "Select Automatically";
        };
    };
}
