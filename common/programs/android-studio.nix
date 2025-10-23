{ pkgs, nixpkgs, ... }:
# When uninstalling, delete:
# - ~/Android
# - ~/.gradle
{
    environment.systemPackages = with pkgs; [
        android-studio
    ];
    nixpkgs.config.android_sdk.accept_license = true;
    programs.adb.enable = true;
}
