{pkgs, spicetify-nix, ...}:{
    imports = [spicetify-nix.homeManagerModule ./xdgconf/hypr/hyprland/wrapper.nix];

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

    gtk = {
      enable = true;
      theme = {
        name = "CatppuccinFrappe";
      };
    };
    
    programs.kitty = {
      enable = true;
      font.name = "JetBrains Mono Regular Nerd Font Complete Mono";
      settings =
        {
          "confirm_os_window_close"= 0 ; 
        };
      theme = "Catppuccin-Frappe";
    };

    home.homeDirectory = "/home/patrickaldis";
    home.packages = with pkgs; [ git lutris];
    home.stateVersion = "22.05";
    home.file.".internet/comodo.pem".source = ./xdgconf/internet/comodo.pem;
    home.file.".emacs.d/init.el".source = ./xdgconf/emacs/init.el;
    home.file.".emacs.d/themes/catppuccin-frappe-theme.el".source = ./xdgconf/emacs/catppuccin-frappe-theme.el;
    home.file.".themes/CatppuccinFrappe".source = ./xdgconf/gtk/Catppuccin-Frappe-Pink/Catppuccin-Frappe-Pink;

    xdg.configFile = {
      "hypr/hyprpaper.conf".source = ./xdgconf/hypr/hyprpaper.conf;
      "hypr/batteryscript.sh".source = ./xdgconf/hypr/batteryscript.sh;
      "waybar".source = ./xdgconf/waybar;
      "wofi".source = ./xdgconf/wofi;
      "dunst".source = ./xdgconf/dunst;
      "fish/config.fish".source = ./xdgconf/fish/config.fish;
      "ranger/rifle.conf".source = ./xdgconf/ranger/rifle.conf;
      "qutebrowser/newwindow.sh".source = ./xdgconf/qute/open_url_in_instance.sh;
    };

    services.dunst = {
      enable = true;
    };
    programs.direnv.enable = true;
}
