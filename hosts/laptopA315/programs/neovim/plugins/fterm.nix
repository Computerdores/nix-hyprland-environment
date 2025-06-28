{ pkgs, ... }:

{
    keymaps = [
        {
            mode = "n";
            key = "<A-i>";
            action = "<CMD>lua require('FTerm').toggle()<CR>";
        }
    ];

    extraPlugins = [
        pkgs.vimPlugins.FTerm-nvim
    ];

    extraConfigLua = ''
        require('FTerm').setup({
            dimensions = {
                width = 0.85,
                height = 0.85,
            },
        })
    '';
}
