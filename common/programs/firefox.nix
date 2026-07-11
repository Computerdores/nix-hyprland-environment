{ pkgs, username, config, nixpkgs-version, ... }:
let
    mkPrefs = prefs: builtins.mapAttrs (key: value: { Value = value; Status = "locked"; }) prefs;
    mkExts = exts: builtins.mapAttrs (key: value: value // {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/${key}/latest.xpi";
    }) exts;
in {
    programs.firefox = {
        enable = true;
        configPath = "${config.xdg.configHome}/mozilla/firefox";
        policies = {
            Preferences = mkPrefs {
                "browser.backspace_action" = 0;
                "browser.search.isUS" = false;
                "browser.tabs.closeWindowWithLastTab" = false;
                "browser.tabs.inTitlebar" = 0; # don't treat the tab bar as client side window decoration
                "pdfjs.defaultZoomValue" = "page-fit";
                "privacy.globalprivacycontrol.enabled" = true;
                "security.default_personal_cert" = "Select Automatically";
                "widget.use-xdg-desktop-portal.file-picker" = 1; # 1 = true; 2 = false
            };
            Homepage = {
                URL = "about:home";
                StartPage = "previous-session"; # TODO: this isn't locked for some reason
                Locked = true;
            };
            PasswordManagerEnabled = false;
            PrimaryPassword = false;
            AutofillAddressEnabled = false;
            AutofillCreditCardEnabled = false;
            ExtensionSettings = mkExts {
                "de-DE@dictionaries.addons.mozilla.org" = {
                    installation_mode = "force_installed";
                };
                "uBlock0@raymondhill.net" = {
                    installation_mode = "force_installed";
                    private_browsing = true;
                };
            };
        };
        profiles."${username}" = {
            id = 0;
            name = username;
            search.force = true;
            search.default = "ddg";
            search.engines = {
                "Nix Packages" = {
                    urls = [ { template = "https://search.nixos.org/packages?query={searchTerms}"; } ];
                    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                    definedAliases = [ "@np" ];
                };
                "Nix Options" = {
                    urls = [ { template = "https://search.nixos.org/options?query={searchTerms}"; } ];
                    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                    definedAliases = [ "@no" ];
                };
                "Home Manager Options" = {
                    urls = [
                        {
                            template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=release-${nixpkgs-version}";
                        }
                    ];
                    icon = "https://home-manager-options.extranix.com/images/favicon.png";
                    updateInterval = 24 * 60 * 60 * 1000;
                    definedAliases = [ "@hm" ];
                };
                "NixOS Wiki" = {
                    urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
                    icon = "https://wiki.nixos.org/favicon.png";
                    updateInterval = 24 * 60 * 60 * 1000;
                    definedAliases = [ "@nw" ];
                };
            };
        };
    };
}
