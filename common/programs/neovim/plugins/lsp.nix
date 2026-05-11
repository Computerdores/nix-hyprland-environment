{ pkgs, ... }:

{
    plugins.lsp = {
        enable = true;
        servers.pyright.enable = true;
    };
    keymaps = [
        {
            mode = "n";
            key = "<leader>u";
            action = "<CMD>lua vim.lsp.buf.references()<CR>";
            options.desc = "Usage search";
        }
    ];
}
