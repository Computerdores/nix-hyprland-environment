{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        kdePackages.kwallet
    ];

    # auto open wallet using login password
    # requires that wallet "kdewallet" exists
    # To create, create any wallet and rename the files in `~/.local/share/kwalletd/` accordingly
    # then set `Default Wallet=kdewallet` (under `[Wallet]`) and restart ksecretd.
    security.pam.services.login.kwallet = {
        enable = true;
    };
}
