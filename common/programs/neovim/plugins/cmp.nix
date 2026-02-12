{ ... }:

{
    plugins.cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        settings = {
            mapping = {
                "<C-d>" = "cmp.mapping.scroll_docs(-4)";
                "<C-f>" = "cmp.mapping.scroll_docs(4)";
                "<C-Space>" = ''
                    function(fallback)
                        local cmp = require("cmp")
                        if cmp.visible() then
                            cmp.confirm({ select = true })
                        else
                            cmp.complete()
                        end
                    end
                '';
                "<C-e>" = "cmp.mapping.close()";
                "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
                "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                "<CR>" = "cmp.mapping.confirm({ select = false })";
            };
            window.documentation.border = "rounded";
        };
    };
}
