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
      # doomPackageDir = ../xdgconf/doompkgs;
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

        content.javascript.can_access_clipboard = true;

        downloads.remove_finished = 4000;

        colors = {

          downloads = {
            bar.bg = "#${theme.background}";
          };

          tabs = {
            bar.bg = "#${theme.background}";
            even = {
              bg = "#${theme.background''}";
              fg = "#${theme.neutral}";
            };
            odd = {
              bg = "#${theme.background'}";
              fg = "#${theme.neutral}";
            };
            selected.even = {
              bg = "#${theme.background}";
              fg = "#${theme.secondary}";
            };
            selected.odd= {
              bg = "#${theme.background}";
              fg = "#${theme.secondary}";
            };
            indicator = {
              system = "none";
              error = "#f38ba8";
            };
          };

          completion = {
            category = {
              bg = "#${theme.background}";
              fg = "#${theme.tertiary}";
            };
            even = {
              bg = "#${theme.background''}";
            };
            odd = {
              bg = "#${theme.background'}";
            };
            item.selected = {
              bg = "#${theme.tertiary}";
              fg = "#${theme.background'}";
            };
            match.fg = "#${theme.primary}";
          };

          hints = {
            bg = "#${theme.tertiary}";
            fg = "#${theme.background'}";
            match.fg = "#${theme.primary}";
          };

          statusbar.url = {
            success.http.fg = "#${theme.tertiary}";
            success.https.fg = "#${theme.primary}";
          };

          webpage.bg = "#${theme.background}";
          webpage.preferred_color_scheme = "dark";
        };

        hints.border = "1px solid #${theme.background'}";
      };
      extraConfig = ''c.tabs.padding = {"bottom": 3, "left": 5, "right": 5, "top": 3}'';
    };

    home.homeDirectory = "/home/patrickaldis";
    home.packages = with pkgs; [ git lutris];
    home.stateVersion = "22.05";

    # Config Files:
    home.file = {
      ".internet/comodo.pem".source = "${dotfiles}/internet/comodo.pem";
      ".emacs.d/themes/catppuccin-frappe-theme.el".source = "${dotfiles}/emacs/catppuccin-frappe-theme.el";
      ".themes/CatppuccinFrappe".source = "${dotfiles}/gtk/Catppuccin-Frappe-Pink/Catppuccin-Frappe-Pink";
      ".cabal/config".source = "${dotfiles}/cabal/config";
      "Pictures/someday_UltraHD.png".source = "${dotfiles}/hypr/hyprpaper/someday_UltraHD.png";
    };

    xdg.configFile = {
      "hypr/hyprpaper.conf".source = "${dotfiles}/hypr/hyprpaper/hyprpaper.conf";
      "hypr/batteryscript.sh".source = "${dotfiles}/hypr/batteryscript.sh";
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
