#!/usr/bin/env bash

bash -c "nix run nixpkgs#$(fuzzel --dmenu)"
