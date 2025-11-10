{ pkgs, ... }:

{
    environment.systemPackages = [
        (pkgs.symlinkJoin {
            name = "localsend";
            paths = [ pkgs.localsend ];
            buildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
                wrapProgram $out/bin/localsend_app \
                    --set GTK_USE_PORTAL "1"
            '';
        })
    ];
}
