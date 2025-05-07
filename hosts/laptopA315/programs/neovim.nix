{ pkgs, inputs, ... }:

{
    imports = [
        inputs.nixvim.homeManagerModules.nixvim
    ];

    programs.nixvim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        plugins.treesitter.enable = true;
        colorschemes.gruvbox.enable = true;
        extraConfigVim = ''
            set tabstop=4
            set shiftwidth=4
            set expandtab
            highlight Normal guibg=none ctermbg=none
        '';
    };
}
