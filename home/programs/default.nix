{
  imports = [
    ./doom.nix
    ./dunst.nix
    ./gtk.nix
    ./hyprland.nix
    ./kitty.nix
    ./qutebrowser.nix
    ./spicetify.nix
    ./waybar.nix
    ./wofi.nix
  ];

  # Single-line config
  programs = {
    direnv.enable = true;
  };
}
