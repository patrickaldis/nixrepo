{pkgs, config, ...}:
{
  nix.settings = {
    substituters =
      ["https://hyprland.cachix.org"
       "https://nix-gaming.cachix.org"
       "https://nix-community.cachix.org"];
    trusted-public-keys =
      ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
       "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
       "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
    experimental-features =
      ["nix-command"
       "flakes" ];
    trusted-users = ["patrickaldis"];
  };

  nixpkgs.config = {
    allowUnfree = true;                                #NIX
  };
}
