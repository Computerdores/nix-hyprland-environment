{
    description = "Test for a NixOS System with Home Manager via a flake, with everything in a single repo.";

    inputs = {
        home-manager.url = "github:nix-community/home-manager";
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
        nixosConfigurations.nixos-testbed = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
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
    };
}
