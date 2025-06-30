{ ... }:

{
    plugins.nvim-tree = {
        enable = true;
    };

    keymaps = [
        {
            mode = "n";
            key = "<leader>t";
            action = "<CMD>NvimTreeToggle<CR>";
        }
    ];
}
