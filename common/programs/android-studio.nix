{ pkgs, nixpkgs, ... }:
# When uninstalling, delete:
# - ~/Android
# - ~/.android
# - ~/.gradle
# - ~/.config/.android
# - "~/.config/Android Open Source Project"
# - ~/.cache/Google/AndroidStudio*
{
    environment.systemPackages = with pkgs; [
        android-studio
    ];
    nixpkgs.config.android_sdk.accept_license = true;
    programs.adb.enable = true;
}
