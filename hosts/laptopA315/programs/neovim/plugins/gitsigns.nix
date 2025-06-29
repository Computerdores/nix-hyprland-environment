{ ... }:

{
    plugins.gitsigns = {
        enable = true;
        settings = {
            current_line_blame = true;
            current_line_blame_opts = {
                delay = 500;
                virt_text_pos = "right_align";
            };
        };
    };
}
