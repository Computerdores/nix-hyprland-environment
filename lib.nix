lib: lib.extend (_: _: {
    applySchema = schema: config: (lib.evalModules { modules = [{ options = schema; } config]; }).config;
    openDesktopEntryCommand = de_conf: ("sh -c 'cd ${de_conf.settings.Path}; ${de_conf.exec}'");
})
