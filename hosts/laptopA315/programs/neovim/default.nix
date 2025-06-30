{ pkgs, inputs, ... }:

{
    imports = [
        inputs.nixvim.homeManagerModules.nixvim
    ];

    programs.nixvim = {
        imports = [
            ./keymaps.nix
            ./plugins/barbar.nix
            ./plugins/nvim-tree.nix
            ./plugins/gitsigns.nix
            ./plugins/fterm.nix
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

        plugins.lualine.enable = true;
        plugins.web-devicons.enable = true;
        # TODO: explore config options for these plugins and potentially move them to separate .nix files
        plugins.which-key.enable = true;
        plugins.treesitter.enable = true;
        plugins.nvim-tree.enable = true;
    };
}
