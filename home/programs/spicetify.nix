{pkgs, spicetify-nix, ...}:
{
  imports = [
    spicetify-nix.homeManagerModule
  ];
  programs.spicetify = {
    enable = true;
    spotifyPackage = pkgs.spotifywm;
    theme = "catppuccin-mocha";
    # OR
    # theme = spicetify-nix.pkgSets.${pkgs.system}.themes.catppuccin-mocha;
    colorScheme = "flamingo";

    enabledExtensions = [
      "fullAppDisplay.js"
      "songStats.js"
      "keyboardShortcut.js"
      "fullAlbumDate.js"
      "wikify.js"
      "history.js"
      "genre.js"
    ];
  };
}
