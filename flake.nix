{
  description = "nixos system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
    stylix.url = "github:danth/stylix/release-24.11";

    nixvim = {
      url = "github:nix-community/nixvim";
      # url = "/home/berke/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      system = "x86_64-linux";
      wallpaper = {
        path = ./images/wallpapers/wp-00.jpg;
      };
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
                inherit inputs system wallpaper;
              };
              home-manager.sharedModules = [
                inputs.stylix.homeManagerModules.stylix
                inputs.spicetify-nix.homeManagerModules.default
                inputs.nixvim.homeManagerModules.nixvim
              ];
            }
          ];
        };
      };
   };
}




