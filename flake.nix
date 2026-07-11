{
    description = "My NixOS System Flake using Home-Manager and Hyprland.";

    inputs = {
        # when updating the nixpkgs version: beware the multiple URLs that it is contained in!
        nixpkgs.url = "github:nixos/nixpkgs/release-26.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland.url = "github:hyprwm/Hyprland";
        rose-pine-hyprcursor = {
            url = "github:ndom91/rose-pine-hyprcursor";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.hyprlang.follows = "hyprland/hyprlang";
        };
        nixvim = {
            url = "github:nix-community/nixvim/nixos-26.05";
        };
        pwndbg = {
            url = "github:pwndbg/pwndbg";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        i3bar-river = {
            url = "github:Computerdores/i3bar-river?ref=master";
            inputs.nixpkgs.follows = "nixpkgs-unstable";
        };
        spicetify-nix.url = "github:Gerg-L/spicetify-nix";
        portal-escape = {
            url = "github:Computerdores/portal-escape";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        private-overlay.url = "git+ssh://git@github.com/Computerdores/nixos-private.git";
        binaryninja = {
            url = "github:jchv/nix-binary-ninja";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
        inputs@{ self, nixpkgs, home-manager, private-overlay, nixpkgs-unstable, binaryninja, ... }:
        let
            lib = import ./lib.nix (nixpkgs.lib.extend (_: _: home-manager.lib));
            system = "x86_64-linux";
            specialArgs = {
                inherit inputs self lib system;
                flakeDir = ./.;
                hyprland-pkgs = inputs.hyprland.packages.${system};
                username = "jann";
                nixpkgs-version = lib.fileContents "${nixpkgs}/.version";
                pkgsUnstable = import nixpkgs-unstable {
                    inherit system;
                    config.allowUnfree = true;
                };
            };
            fullArgs = specialArgs // {
                pkgs = import nixpkgs { inherit system; };
            };
            mkSystem = host: nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/${host}/configuration.nix
                    ./common/modules
                    home-manager.nixosModules.home-manager
                    private-overlay.nixosModules."${host}"
                    binaryninja.nixosModules.binaryninja

                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            extraSpecialArgs = specialArgs;
                            users.jann.imports = [
                                ./hosts/${host}/home.nix
                                private-overlay.homeManagerModules."${host}"
                            ];
                        };
                    }
                ];
            };
        in
        {
            nixosConfigurations.laptopA315 = mkSystem "laptopA315";
            nixosConfigurations.tower = mkSystem "tower";
        }
        // (import ./shells fullArgs);
}
