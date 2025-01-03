{ pkgs, ... }:
{
    programs.firefox = {
        enable = true;
        profiles.jann = {
            id = 0;
            name = "jann";
            search.force = true;
            search.default = "DuckDuckGo";
            search.engines = {
                "Nix Packages" = {
                    urls = [{ template = "https://search.nixos.org/packages?query={searchTerms}"; }];
                    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                    definedAliases = [ "@np" ];
                };
                "Nix Options" = {
                    urls = [{ template = "https://search.nixos.org/options?query={searchTerms}"; }];
                    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                    definedAliases = [ "@no" ];
                };
                "Home Manager Options" = {
                    urls = [{ template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=release-24.11"; }];
                    definedAliases = [ "@hm" ];
                    iconUpdateURL = "https://home-manager-options.extranix.com/images/favicon.png";
                    updateInterval = 24 * 60 * 60 * 1000;
                };
                "NixOS Wiki" = {
                    urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
                    iconUpdateURL = "https://wiki.nixos.org/favicon.png";
                    updateInterval = 24 * 60 * 60 * 1000;
                    definedAliases = [ "@nw" ];
                };
            };
            settings = {
                "browserRestoreSession" = true;
                "browser.startup.homepage" = "about:home";
                "signon.rememberSignons" = false;
                "browser.search.isUS" = false;
            };
        };
        policies = {
            Preferences = {
               browser.backspace_action = 0;
               browser.tabs.closeWindowWithLastTab = false;
            };
        };
    };
}
