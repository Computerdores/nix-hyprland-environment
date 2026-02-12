{ pkgs, inputs, ... }:

{
    imports = [
        inputs.nixvim.homeModules.nixvim
    ];

    programs.nixvim = {
        imports = [
            ./keymaps.nix
            ./plugins/barbar.nix
            ./plugins/nvim-tree.nix
            ./plugins/gitsigns.nix
            ./plugins/fterm.nix
            ./plugins/render-markdown.nix
            ./plugins/treesitter.nix
            ./plugins/cmp.nix
            ./plugins/rustaceanvim.nix
        ];

        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;

        globals.mapleader = " ";

        opts = {
            tabstop = 4;
            shiftwidth = 4;
            expandtab = true;
            number = true;
            relativenumber = true;
        };

        colorschemes.gruvbox = {
            enable = true;
            settings.transparent_mode = true;
        };

        # configure diagnostics
        diagnostic.settings.float = {
            source = true;
            border = "rounded";
            focusable = false;
            focus = false;
        };

        # automatically show diagnostics float when hovering
        extraConfigLua = ''
            vim.o.updatetime = 250
            vim.api.nvim_create_autocmd("CursorHold", {
                callback = function()
                    local pos = vim.api.nvim_win_get_cursor(0);
                    local line = pos[1] - 1;
                    local col = pos[2];

                    local diagnostics = {};
                    for _, d in ipairs(vim.diagnostic.get(0, { lnum = line })) do
                        start = d.col or 0
                        if col >= start and col <= (d.end_col or (start + 1)) then
                            table.insert(diagnostics, d)
                        end
                    end

                    if #diagnostics > 0 then
                        vim.diagnostic.open_float(nil);
                    else
                        vim.lsp.buf.hover({ border = "rounded", focus = false, focusable = false, max_height=20 })
                    end
                end
            })
        '';

        plugins.lualine.enable = true;
        plugins.web-devicons.enable = true;
        # TODO: explore config options for these plugins and potentially move them to separate .nix files
        plugins.which-key.enable = true;
    };
}
