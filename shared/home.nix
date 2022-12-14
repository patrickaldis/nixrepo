{pkgs, spicetify-nix, nix-doom-emacs, theme, ...}:
let
  dotfiles = ../xdgconf;
in
{
    imports = [
      spicetify-nix.homeManagerModule
      nix-doom-emacs.hmModule
      ../xdgconf/hypr/hyprland/wrapper.nix
      ../xdgconf/waybar/wrapper.nix
      ../xdgconf/dunst/wrapper.nix
      ../xdgconf/wofi/wrapper.nix
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

    programs.doom-emacs = {
      enable = true;
      doomPrivateDir = ../xdgconf/doom;
      # emacsPackages = pkgs.emacsPackagesFor (pkgs.emacs.override { withPgtk = true; });
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
          new_position.unrelated = "next";
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
    # Config Files:
    home.file.".internet/comodo.pem".source = "${dotfiles}/internet/comodo.pem";
    # home.file.".emacs.d/init.el".source = "${dotfiles}/emacs/init.el";
    home.file.".emacs.d/themes/catppuccin-frappe-theme.el".source = "${dotfiles}/emacs/catppuccin-frappe-theme.el";
    home.file.".themes/CatppuccinFrappe".source = "${dotfiles}/gtk/Catppuccin-Frappe-Pink/Catppuccin-Frappe-Pink";
    home.file."Pictures/someday_UltraHD.png".source = "${dotfiles}/hypr/hyprpaper/someday_UltraHD.png";

    xdg.configFile = {
      "hypr/hyprpaper.conf".source = "${dotfiles}/hypr/hyprpaper/hyprpaper.conf";
      "hypr/batteryscript.sh".source = "${dotfiles}/hypr/batteryscript.sh";
      # "wofi".source = "${dotfiles}/wofi";
      # "dunst".source = "${dotfiles}/dunst";
      "stig".source = "${dotfiles}/stig";
      "fish/config.fish".source = "${dotfiles}/fish/config.fish";
      "ranger/rifle.conf".source = "${dotfiles}/ranger/rifle.conf";
      "qutebrowser/newwindow.sh".source = "${dotfiles}/qute/open_url_in_instance.sh";
      "qutebrowser/qutedaemon.sh".source = "${dotfiles}/qute/qutedaemon.sh";
    };

    xdg.mimeApps = {
      enable = true;
      defaultApplications =
        let
          browser = "org.qutebrowser.qutebrowser.desktop";
          pdf = "org.gnome.Evince.desktop";
        in
        {
          "application/pdf" = [pdf];
          "text/html" = [browser];
          "x-scheme-handler/http" = [browser];
          "x-scheme-handler/https" = [browser];
          "x-scheme-handler/about" = [browser];
          "x-scheme-handler/unknown" = [browser];
        };
    };

    services.dunst = {
      enable = true;
    };
    programs.direnv.enable = true;
}
