{pkgs, spicetify-nix, ...}:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  imports = [
    spicetify-nix.homeManagerModule
  ];
  programs.spicetify = {
    enable = true;
    spotifyPackage = pkgs.spotify; # For some reason spictify only works with pkgs.spotify
    theme = spicePkgs.themes.catppuccin-mocha;
    colorScheme = "flamingo";

    enabledExtensions =
    with spicePkgs.extensions ; [
      fullAppDisplay
      songStats
      keyboardShortcut
      fullAlbumDate
      wikify
      history
      genre
    ];
  };
}
