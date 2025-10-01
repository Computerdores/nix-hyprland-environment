{ pkgs, ... }:

{
    extraPlugins = [
        pkgs.vimPlugins.FTerm-nvim
    ];

    extraPackages = with pkgs; [
        bashInteractive
    ];

    keymaps = [
        {
            mode = "n";
            key = "<A-i>";
            action = "<CMD>lua require('FTerm').toggle()<CR>";
        }
        {
            mode = "t";
            key = "<A-i>";
            action = "<CMD>lua require('FTerm').toggle()<CR>";
        }
    ];

    extraConfigLua = ''
        require('FTerm').setup({
            dimensions = {
                width = 0.85,
                height = 0.85,
            },
            cmd = 'env -u SHELL bash',
        })
    '';
}
