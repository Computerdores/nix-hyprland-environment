lib: lib.extend (_: _: {
    applySchema = schema: config: (lib.evalModules { modules = [{ options = schema; } config]; }).config;
})
