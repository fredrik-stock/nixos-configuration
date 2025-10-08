{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    
    # Selve operativsystemet
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.fredrik = ./home.nix;

        }
      ];
    };

    # Home Manager

    # homeConfigurations."fredrik" = home-manager.lib.homeManagerConfiguration {
    #   pkgs = nixpkgs.legacyPackages.x86_64-linux;
    #   modules = [
    #     ./home.nix
    #   ];
    # };
  };
}
