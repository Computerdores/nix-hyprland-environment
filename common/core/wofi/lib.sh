#!/usr/bin/env bash

# have to user choose one or more files
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

# have the user choose one file
function file-chooser-single() {
    file-chooser-multi $@ | head -n 1
}

# usage: contained <e> [<0>...<n>]
# return 0 if any argument "0"..."n" is equal to argument "e"
function contained {
    target=$1
    shift
    for candidate in "$@"; do
        if [[ "$candidate" == "$target" ]]; then
            return 0
        fi
    done
    return 1
}
