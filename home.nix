{pkgs, spicetify-nix, ...}:{
    imports = [spicetify-nix.homeManagerModule ./xdgconf/hypr/hyprland.nix];

    programs.spicetify = {
      enable = true;
      theme = "catppuccin-mocha";
      # OR 
      # theme = spicetify-nix.pkgSets.${pkgs.system}.themes.catppuccin-mocha;
      colorScheme = "flamingo";

      enabledExtensions = [
        "fullAppDisplay.js"
        "hidePodcasts.js"
        "songStats.js"
        "keyboardShortcut.js"
        "fullAlbumDate.js"
        "wikify.js"
        "history.js"
        "genre.js"
      ];
      enabledCustomApps = with spicetify-nix.pkgSets.${pkgs.system}.apps;
        [marketplace];
    };
  
    programs.firefox = {
      enable = true;
      package = pkgs.firefox.override {
        cfg = { enableTridactylNative = true; };
      };
    };

    home.homeDirectory = "/home/patrickaldis";
    home.packages = with pkgs; [ git lutris];
    home.stateVersion = "22.05";
    home.file.".internet/comodo.pem".source = ./xdgconf/internet/comodo.pem;
    home.file.".emacs.d/init.el".source = ./xdgconf/emacs/init.el;
    xdg.configFile = {
      "hypr/hyprpaper.conf".source = ./xdgconf/hypr/hyprpaper.conf;
      "hypr/batteryscript.sh".source = ./xdgconf/hypr/batteryscript.sh;
      "waybar".source = ./xdgconf/waybar;
      "wofi".source = ./xdgconf/wofi;
      "dunst".source = ./xdgconf/dunst;
      "fish/config.fish".source = ./xdgconf/fish/config.fish;
    };

    services.dunst = {
      enable = true;
    };
}
