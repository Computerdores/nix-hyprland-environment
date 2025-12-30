lib: lib.extend (_: _: {
    applySchema = schema: config: (lib.evalModules { modules = [{ options = schema; } config]; }).config;
    openDesktopEntryCommand = de_conf: ("sh -c 'cd ${de_conf.settings.Path}; ${de_conf.exec}'");
    gtkEnablePortals = pkgs: pkg: pkgs.symlinkJoin {
            name = pkg.name;
            paths = [ pkg ];
            buildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
                wrapProgram $out/bin/${pkg.meta.mainProgram} \
                    --set GTK_USE_PORTAL "1"
            '';
    };
})
