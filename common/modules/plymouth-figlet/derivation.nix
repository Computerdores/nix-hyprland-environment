{ pkgs, config, message, show_logo, ... }:

let
    font = "${pkgs.dejavu_fonts}/share/fonts/truetype/DejaVuSansMono.ttf";
in pkgs.stdenv.mkDerivation rec {
    pname = "plymouth-figlet-theme";
    version = "1.0";

    src = ./.;

    nativeBuildInputs = with pkgs; [ imagemagick figlet ];

    buildPhase = ''
        figlet -f slant "${message}" > text.txt
        magick -background black -fill white -font ${font} -pointsize 24 label:@text.txt header-image.png
    '';

    installPhase = ''
        mkdir -p $out/share/plymouth/themes/figlet
        cp -r ${pkgs.plymouth}/share/plymouth/themes/spinner/*.png $out/share/plymouth/themes/figlet
        rm $out/share/plymouth/themes/figlet/animation-*
        rm $out/share/plymouth/themes/figlet/throbber-*
        cp figlet.plymouth $out/share/plymouth/themes/figlet
        cp header-image.png $out/share/plymouth/themes/figlet
        ${if show_logo then ''cp "${config.boot.plymouth.logo}" "$out/share/plymouth/themes/figlet/watermark.png"'' else ""}
        find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;
    '';
}
