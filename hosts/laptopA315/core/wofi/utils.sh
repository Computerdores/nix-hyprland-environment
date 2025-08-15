#!/usr/bin/env bash

function pick_script() {
    selection=$({
        # list directories as `dirname/`
        find "$1" -mindepth 1 -maxdepth 1 -type d -printf "%f/\n"
        # list .sh files without the suffix
        find "$1" -maxdepth 1 -name '*.sh' -type f -executable -printf "%f\n" | sed "s/.sh//"
    } | wofi -d)

    if [[ -z "$selection" ]]; then
        echo nothing selected
    elif [[ "$selection" == */ ]]; then
        pick_script "$1/$selection"
    else
        path="$1/$selection.sh"
        if [[ -f "$path" ]]; then
            exec "$path"
        else
            eval "$selection"
        fi
    fi
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    pick_script scripts/
fi

