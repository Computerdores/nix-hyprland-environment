{ pkgs, ... }:

{
    services.playerctld.enable = true;
    environment.systemPackages = with pkgs; [
        playerctl
        wiremix
    ];
}
