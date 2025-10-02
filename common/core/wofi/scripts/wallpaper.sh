#!/usr/bin/env bash

source ./lib.sh

img_types=("jpg" "jpeg" "png" "webp" "jxl")

function set-wallpaper() {
    hyprctl hyprpaper preload $1 >/dev/null
    hyprctl hyprpaper wallpaper ,$1 >/dev/null
}

selection=$(file-chooser-single /etc/nixos/common/wallpapers )

if [[ -f "$selection" ]]; then
    name=$(basename -- $selection )
    if [[ $(contained "${name##*.}" "$img_types") ]]; then
        set-wallpaper "$selection"
    fi
fi

