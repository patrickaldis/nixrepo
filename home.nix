{pkgs, spicetify-nix, ...}:
let
  theme = import ./theme.nix;
in
{
    imports = [
      spicetify-nix.homeManagerModule
      ./xdgconf/hypr/hyprland/wrapper.nix
      ./xdgconf/waybar/wrapper.nix
      ./xdgconf/dunst/wrapper.nix
      ./xdgconf/wofi/wrapper.nix
    ];

    programs.spicetify = {
      enable = true;
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

    programs.qutebrowser = {
      enable = true;
      package = (pkgs.qutebrowser.override {enableWideVine=true;});
      settings = {
        tabs = {
          last_close = "close";
          title.alignment = "center";
          title.format = "{current_title}";
          indicator.width = 0;
        };
        statusbar.show = "in-mode";
        url = {
          start_pages = "https://patrickaldis.github.io/newtabpage/";
          default_page = "https://patrickaldis.github.io/newtabpage/";
        };

        fonts = {
          default_family = "JetBrainsMono Nerd Font Mono";
          tabs.selected = "12pt default_family";
          tabs.unselected = "12pt default_family";
        };

        content.pdfjs = true;

        downloads.remove_finished = 4000;

        colors = {
          downloads = {
            bar.bg = "#11111b";
          };
          tabs = {
            bar.bg = "#11111b";
            even = {
              bg = "#585b70";
              fg = "#9399b2";
            };
            odd = {
              bg = "#45475a";
              fg = "#9399b2";
            };
            selected.even = {
              bg = "#1e1e2e";
              fg = "#cdd6f4";
            };
            selected.odd= {
              bg = "#1e1e2e";
              fg = "#cdd6f4";
            };
            indicator = {
              system = "none";
              error = "#f38ba8";
            };
          };
        };
      };
      extraConfig = ''c.tabs.padding = {"bottom": 3, "left": 5, "right": 5, "top": 3}'';
    };

    home.homeDirectory = "/home/patrickaldis";
    home.packages = with pkgs; [ git lutris];
    home.stateVersion = "22.05";
    home.file.".internet/comodo.pem".source = ./xdgconf/internet/comodo.pem;
    # home.file.".emacs.d/init.el".source = ./xdgconf/emacs/init.el;
    home.file.".emacs.d/themes/catppuccin-frappe-theme.el".source = ./xdgconf/emacs/catppuccin-frappe-theme.el;
    home.file.".themes/CatppuccinFrappe".source = ./xdgconf/gtk/Catppuccin-Frappe-Pink/Catppuccin-Frappe-Pink;
    home.file."Pictures/someday_UltraHD.png".source = ./xdgconf/hypr/hyprpaper/someday_UltraHD.png;

    xdg.configFile = {
      "hypr/hyprpaper.conf".source = ./xdgconf/hypr/hyprpaper/hyprpaper.conf;
      "hypr/batteryscript.sh".source = ./xdgconf/hypr/batteryscript.sh;
      # "wofi".source = ./xdgconf/wofi;
      # "dunst".source = ./xdgconf/dunst;
      "stig".source = ./xdgconf/stig;
      "fish/config.fish".source = ./xdgconf/fish/config.fish;
      "ranger/rifle.conf".source = ./xdgconf/ranger/rifle.conf;
      "qutebrowser/newwindow.sh".source = ./xdgconf/qute/open_url_in_instance.sh;
      "qutebrowser/qutedaemon.sh".source = ./xdgconf/qute/qutedaemon.sh;
    };

    services.dunst = {
      enable = true;
    };
    programs.direnv.enable = true;
}
