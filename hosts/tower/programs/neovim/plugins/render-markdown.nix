{ pkgs, ... }:

{
    plugins.render-markdown = {
        enable = true;
        settings = {
            link = {
                enabled = true;
            };
            quote = { repeat_linebreak = true; };
            win_options = {
                showbreak = {
                    default = "";
                    rendered = "  ";
                };
                breakindent = {
                    default = false;
                    rendered = true;
                };
                breakindentopt = {
                    default = "";
                    rendered = "";
                };
            }; 
            latex = {
                enable = false;
            };
        };
    };
}
