# see also: https://github.com/xhos/nixdots/blob/main/derivs/sddm-astronaut-theme.nix
{ pkgs, subtheme ? "astronaut" }:

pkgs.stdenv.mkDerivation rec {
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
    propagatedBuildInputs = [
        pkgs.kdePackages.qtsvg
        pkgs.kdePackages.qtmultimedia
        pkgs.kdePackages.qtvirtualkeyboard
    ];

    patchPhase = ''
    '';

    buildPhase = ''
        runHook preBuild
        runHook postBuild
    '';
    
    installPhase = ''
        runHook preInstall

        mkdir -p $out/share/sddm/themes
        cp -r $src $out/share/sddm/themes/astronaut

        mkdir -p $out/share/fonts
        cp -r $out/share/sddm/themes/astronaut/Fonts/. $out/share/fonts

        substituteInPlace $out/share/sddm/themes/astronaut/metadata.desktop \
            --replace "ConfigFile=Themes/astronaut.conf" "ConfigFile=Themes/${subtheme}.conf"

        runHook postInstall
    '';
}
