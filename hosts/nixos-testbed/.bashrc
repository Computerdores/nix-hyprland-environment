function go-nix-config() {
    p=$(pwd)
    cd /etc/nixos
    sudo -s
    cd "$p"
}
