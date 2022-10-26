# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      # build with your own instance of nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprcontrib.url = "github:hyprwm/contrib";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hyprland, hyprcontrib, spicetify-nix, home-manager, ...}@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system= "x86_64-linux";
      modules = [
        hyprland.nixosModules.default
        { programs.hyprland.enable = true;
        }
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.patrickaldis = import ./home.nix;
            home-manager.extraSpecialArgs = inputs;
          }
        ./configuration.nix
      ];
      specialArgs.inputs = inputs;
    };
  };
}
