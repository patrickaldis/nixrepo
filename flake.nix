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
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
  };

  outputs = { self, nixpkgs, hyprland, hyprcontrib, spicetify-nix, home-manager, nix-doom-emacs,...}@inputs: {
    nixosConfigurations.nixosxps15 = nixpkgs.lib.nixosSystem {
      system= "x86_64-linux";
      modules = [
        hyprland.nixosModules.default
        { programs.hyprland.enable = true;
        }
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.patrickaldis = import ./shared/home.nix;
            home-manager.extraSpecialArgs = nixpkgs.lib.mkMerge(
              [inputs
               {customSettings.hiDPI = true;}
               {theme = import ./shared/theme.nix;}
              ]);
          }
        ./shared
        ./hosts/xps9560.nix
      ];
      specialArgs.inputs = inputs;
      specialArgs.customSettings.hiDPI = true;
    };
    nixosConfigurations.nixosdesktop = nixpkgs.lib.nixosSystem {
      system= "x86_64-linux";
      modules = [
        hyprland.nixosModules.default
        { programs.hyprland.enable = true;
        }
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.patrickaldis = import ./shared/home.nix;
            home-manager.extraSpecialArgs = nixpkgs.lib.mkMerge(
              [inputs
               {customSettings.hiDPI = false;}
               {theme = import ./shared/theme.nix;}
              ]);
          }
        ./shared
        ./hosts/desktop.nix
      ];
      specialArgs.inputs = inputs;
      specialArgs.customSettings.hiDPI = false;
    };
  };
}
