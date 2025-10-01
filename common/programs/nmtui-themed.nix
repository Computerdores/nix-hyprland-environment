{ pkgs, ...}:
{
    environment.systemPackages = [
        (pkgs.symlinkJoin {
            name = "nmtui";
            paths = [ pkgs.networkmanager ];
            buildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
                wrapProgram $out/bin/nmtui \
                    --set NEWT_COLORS "root=white,default"
            '';
        })
    ];
}

