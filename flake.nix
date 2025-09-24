{
  description = "nixos system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      # url = "/home/berke/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        nixos = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs system;
          };
          modules = [
            ./nixos/configuration.nix
            inputs.home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.berke = import ./home-manager/home.nix;
              home-manager.extraSpecialArgs = {
                pkgs-unstable = import inputs.nixpkgs-unstable {
                  inherit system;
                  config.allowUnfree = true;
                };
                inherit inputs system;
              };
              home-manager.sharedModules = [
                inputs.nixvim.homeManagerModules.nixvim
              ];
            }
          ];
        };
      };
   };
}




