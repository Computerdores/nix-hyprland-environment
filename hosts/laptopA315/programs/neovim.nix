{ pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        plugins = with pkgs.vimPlugins; [
            nvim-treesitter.withAllGrammars
        ];
        extraConfig = ''
            set tabstop=4
            set shiftwidth=4
            set expandtab
        '';
    };
}
