{ pkgs, ... }:

pkgs.writeShellScriptBin "sleep-inhibit" ''
    IDLE_FILE="/tmp/idle-inhibit.pid"

    function print-usage() {
        echo "Usage: $0 [true | false | toggle | status]"
    }

    function set-on() {
        if [ -s "$IDLE_FILE" ]; then echo "error: already inhibiting"; exit 1; fi
        exec systemd-inhibit --what=idle sleep infinity </dev/null >/dev/null 2>/dev/null & disown
        echo $! > "$IDLE_FILE"
    }

    function set-off() {
        if [ ! -s "$IDLE_FILE" ]; then echo "error: already not inhibiting"; exit 1; fi
        kill $(cat "$IDLE_FILE")
        echo -n > "$IDLE_FILE"
    }

    if [ $# -eq 1 ]; then
        if [ "$1" == "true" ]; then
            set-on
        elif [ "$1" == "false" ]; then
            set-off
        elif [ "$1" == "toggle" ]; then
            if [ -s "$IDLE_FILE" ]; then
                set-off
            else
                set-on
            fi
        elif [ "$1" == "status" ]; then
            cat "$IDLE_FILE"
        else
            print-usage
        fi
    else
        print-usage
    fi
''
