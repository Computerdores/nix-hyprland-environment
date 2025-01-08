{
    description = "Test for a NixOS System with Home Manager via a flake, with everything in a single repo.";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland.url = "github:hyprwm/Hyprland";
        rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
        specialArgs = { inherit inputs; };
    in {
        nixosConfigurations.nixos-testbed = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules= [
                ./hosts/nixos-testbed/configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.jann = import ./hosts/nixos-testbed/home.nix;
                }
            ];
        };
        nixosConfigurations.LaptopA315 = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./hosts/laptopA315/configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.extraSpecialArgs = specialArgs;
                    home-manager.users.jann = import ./hosts/laptopA315/home.nix;
                }
            ];
        };
    };
}
