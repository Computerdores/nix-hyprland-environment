{ pkgs, ... }:

(pkgs.buildFHSEnv {
    name = "ctf-env";
    targetPkgs = pkgs: with pkgs; [
        frida-tools
        unzip
        nmap
        binwalk
        gdb
        gcc
        jadx
        (python3.withPackages (python-pkgs: with python-pkgs; [
            pwntools
            pycryptodome
            ipykernel
            jupyter
            pytest
            z3-solver
            requests
            flask
            matplotlib
        ]))
    ];
    runScript = "bash";
    shellHook = ''
        export PS1="(ctf) $PS1"
    '';
}).env
