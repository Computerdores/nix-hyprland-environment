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

# changes prompt color to aqua instead of green
#export PS1='\[\e[0;36;1m\][\u@\h:\w]$\[\e[0m\] '
