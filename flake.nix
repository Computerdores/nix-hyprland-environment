{
    description = "My NixOS System Flake using Home-Manager and Hyprland.";

    inputs = {
        # when updating the nixpkgs version: beware the multiple URLs that it is contained in!
        nixpkgs.url = "github:nixos/nixpkgs/release-25.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland.url = "github:hyprwm/Hyprland";
        rose-pine-hyprcursor = {
            url = "github:ndom91/rose-pine-hyprcursor";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.hyprlang.follows = "hyprland/hyprlang";
        };
        nixvim = {
            url = "github:nix-community/nixvim/nixos-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        pwndbg = {
            url = "github:pwndbg/pwndbg";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        i3bar-river = {
            url = "github:Computerdores/i3bar-river?ref=workspaces-fix";    # TODO: point to master once #47, #48, #49 are merged
            inputs.nixpkgs.follows = "nixpkgs-unstable";
        };
        spicetify-nix.url = "github:Gerg-L/spicetify-nix";
        portal-escape = {
            url = "github:Computerdores/portal-escape";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        private-overlay.url = "git+ssh://git@github.com/Computerdores/nixos-private.git";
    };

    outputs = inputs@{ self, nixpkgs, home-manager, private-overlay, ... }:
    let
        lib = import ./lib.nix (nixpkgs.lib.extend (_: _: home-manager.lib));
        system = "x86_64-linux";
        specialArgs = {
            inherit inputs self lib system;
            flakeDir = ./.;
            hyprland-pkgs = inputs.hyprland.packages.${system};
            username = "jann";
        };
        fullArgs = specialArgs // { pkgs = import nixpkgs { inherit system; }; };
        mkSystem = path: nixpkgs.lib.nixosSystem {
            inherit system specialArgs;
            modules = [
                ./hosts/${path}/configuration.nix
                ./common/modules
                home-manager.nixosModules.home-manager
                private-overlay.nixosModules.default
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        extraSpecialArgs = specialArgs;
                        users.jann.imports = [
                            ./hosts/${path}/home.nix
                            private-overlay.homeManagerModules.default
                        ];
                    };
                }
            ];
        };
    in {
        nixosConfigurations.laptopA315 = mkSystem "laptopA315";
        nixosConfigurations.tower = mkSystem "tower";
    } // (import ./shells fullArgs);
}
