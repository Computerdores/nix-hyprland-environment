{ ... }:

{
    plugins.nvim-tree = {
        enable = true;
    };

    keymaps = [
        {
            mode = "n";
            key = "<leader>t";
            action = "<CMD>NvimTreeFocus<CR>";
            options.desc = "Focus File Tree";
        }
    ];
}
