#!/usr/bin/env bash

function file-chooser-multi() {
    pwd=$(pwd)
    idir="$1"
    if [[ -z "$1" ]]; then
        idir=$(pwd)
    fi
    cd "$idir"

    t=$(mktemp -u)
    mkfifo "$t"

    kitty sh -c "yazi --chooser-file $t; echo >> $t" 2>/dev/null &
    output=$(cat "$t")

    rm "$t"
    cd "$pwd"
    echo "$output"
}

function file-chooser-single() {
    file-chooser-multi $@ | head -n 1
}

function contained {
    target=$1
    shift
    for candidate in "$@"; do
        if [[ "$candidate" == "$target" ]]; then
            return 1
        fi
    done
    return 0
}
