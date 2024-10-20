# this acts like a home.nix for user jann
{ config, pkgs, ... }:

{
    home-manager.users.jann = {
        home = {
            sessionVariables = {
                TEST = "123asd";
            };
        };
        programs.bash.enable = true;
        home.stateVersion = "24.05";
    };
}