# see also: https://github.com/xhos/nixdots/blob/main/derivs/sddm-astronaut-theme.nix
{ pkgs, lib, theme ? "astronaut", themeOverrides ? null, ... }:
let
    overwriteConfig = (pkgs.formats.ini {}).generate "${theme}.conf.user" { General = themeOverrides; };
in pkgs.stdenv.mkDerivation rec {
    pname = "sddm-astronaut-theme";
    version = "11c0bf6147bbea466ce2e2b0559e9a9abdbcc7c3";
    dontBuild = true;

    src = pkgs.fetchFromGitHub {
        owner = "Keyitdev";
        repo = "sddm-astronaut-theme";
        rev = version;
        hash = "sha256-gBSz+k/qgEaIWh1Txdgwlou/Lfrfv3ABzyxYwlrLjDk=";
    };

    dontWrapQtApps = true;

    buildPhase = ''
        runHook preBuild
        runHook postBuild
    '';
    
    installPhase = ''
        runHook preInstall

        mkdir -p $out/share/sddm/themes
        cp -r . $out/share/sddm/themes/astronaut

        mkdir -p $out/share/fonts
        cp -r $out/share/sddm/themes/astronaut/Fonts/. $out/share/fonts

        substituteInPlace $out/share/sddm/themes/astronaut/metadata.desktop \
            --replace "ConfigFile=Themes/astronaut.conf" "ConfigFile=Themes/${theme}.conf"

        ${lib.optionalString (lib.isAttrs themeOverrides) ''
            #install -dm755 $out/share/sddm/themes/astronaut/Themes
            cp ${overwriteConfig} $out/share/sddm/themes/astronaut/Themes/${theme}.conf.user
        ''}

        runHook postInstall
    '';

    meta = with lib; {
        description = "Series of modern looking themes for SDDM.";
        homepage = "https://github.com/Keyitdev/sddm-astronaut-theme";
        license = licenses.gpl3;
        platforms = platforms.linux;
    };
}
