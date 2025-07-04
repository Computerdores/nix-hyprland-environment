{
    description = "My NixOS System Flake using Home-Manager and Hyprland.";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/release-25.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland.url = "github:hyprwm/Hyprland";
        rose-pine-hyprcursor = {
            url = "github:ndom91/rose-pine-hyprcursor";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        utiltool = {
            url = "github:Computerdores/utiltool?ref=main";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim/nixos-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        pwndbg = {
            url = "github:pwndbg/pwndbg";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nixpkgs, home-manager, utiltool, ... }:
    let
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
    in {
        nixosConfigurations.LaptopA315 = nixpkgs.lib.nixosSystem {
            inherit system specialArgs;
            modules = [
                ./hosts/laptopA315/configuration.nix
                ./common/modules
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        extraSpecialArgs = specialArgs;
                        users.jann.imports = [
                            (utiltool.homeManagerModules.default system)
                            ./hosts/laptopA315/home.nix
                        ];
                    };
                }
            ];
        };
    };
}
