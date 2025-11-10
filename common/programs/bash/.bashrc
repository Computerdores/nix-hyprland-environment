function go-nix-config() {
    cd /etc/nixos
}

alias ssh="kitten ssh"
alias open=xdg-open
alias q=exit
alias v=nvim

function update-bootctl-default() {
    sudo bootctl set-default @current
}

function fsh() {
    if [ -z "$1" ]; then
        echo "Usage: fsh <shell>"
        return
    fi
    nix develop /etc/nixos#$1
}

# changes prompt color to aqua instead of green
#export PS1='\[\e[0;36;1m\][\u@\h:\w]$\[\e[0m\] '
