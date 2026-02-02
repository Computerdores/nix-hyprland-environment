{ pkgs, lib, ... }:

{
    programs.thunderbird = {
        enable = true;
        package = (lib.gtkEnablePortals pkgs pkgs.thunderbird);
        preferences = {
            "intl.regional_prefs.use_os_locales"   = true;

            # General
            ## Thunderbird Start Page
            "mailnews.start_page.enabled"          = false;
                                                   
            # Appearance                           
            ## Window Layout                       
            "mail.tabs.drawInTitlebar"             = false; # hide gnome exit button in titlebar
            "mail.tabs.autoHide"                   = false;
                                                   
            ## Sorting and Threading               
            ### Default Threading:                 
            "mailnews.default_view_flags"          =  1;
                                                   
            ### Default Sort by:                   
            "mailnews.default_sort_type"           = 18;
                                                   
            ### Default Sort Order:                
            "mailnews.default_sort_order"          =  1;

            # Privacy & Security
            ## Privacy
            ### Web Content
            "privacy.globalprivacycontrol.enabled" = true;

            ## Security
            ### Certificates
            "security.default_personal_cert"       = "Select Automatically";

            # Calendar
            "calendar.week.start"                  = 1;
        };
    };
}
