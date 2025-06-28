{ pkgs, inputs, ... }:

{
    imports = [
        inputs.nixvim.homeManagerModules.nixvim
    ];

    programs.nixvim = {
        imports = [
            ./keymaps.nix
            ./plugins/fterm.nix
        ];

        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;

        opts = {
            tabstop = 4;
            shiftwidth = 4;
            expandtab = true;
        };

        colorschemes.gruvbox = {
            enable = true;
            settings.transparent_mode = true;
        };

        # TODO: explore config options for these plugins and potentially move them to separate .nix files
        plugins.lualine.enable = true;
        plugins.barbar.enable = true;
        plugins.web-devicons.enable = true;
        plugins.which-key.enable = true;
        plugins.treesitter.enable = true;
        plugins.nvim-tree.enable = true;
        plugins.gitsigns.enable = true;
    };
}
