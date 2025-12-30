{ pkgs, lib, ... }:

{
    programs.thunderbird = {
        enable = true;
        package = (lib.gtkEnablePortals pkgs pkgs.thunderbird);
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
