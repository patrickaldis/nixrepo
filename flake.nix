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

  outputs =
    { self,
      nixpkgs,
      hyprland,
      hyprcontrib,
      spicetify-nix,
      home-manager,
      nix-doom-emacs,
      ...}@inputs:
    let
      defaultSystem = {hostFile, customSettings}:
        nixpkgs.lib.nixosSystem {
          system= "x86_64-linux";
          modules = [
            hyprland.nixosModules.default
            { programs.hyprland.enable = true;
            }
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.patrickaldis = import ./home;
              home-manager.extraSpecialArgs = nixpkgs.lib.mkMerge(
                [inputs
                 {customSettings = customSettings;}
                 {theme = import ./shared/theme.nix;}
                ]);
            }
            ./shared
            hostFile
          ];
          specialArgs.inputs = inputs;
          specialArgs.customSettings = customSettings;
        };
    in
      {
        nixosConfigurations.nixosxps15 = defaultSystem
          ({
            hostFile = ./hosts/xps9560.nix;
            customSettings = {
              hiDPI = true;
            };
          });
        nixosConfigurations.nixosdesktop = defaultSystem
          ({
            hostFile = ./hosts/desktop.nix;
            customSettings = {
              hiDPI = false;
            };
          });
      };
}
