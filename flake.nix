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
    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = { self, nixpkgs, hyprland, hyprcontrib, spicetify-nix, ...}@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system= "x86_64-linux";
      modules = [
        hyprland.nixosModules.default
        { programs.hyprland.enable = true; }
        ./configuration.nix
      ];
      specialArgs.inputs = inputs;
    };
  };
}
