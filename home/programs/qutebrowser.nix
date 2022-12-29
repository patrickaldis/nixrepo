{pkgs, theme, ...}:
{
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

      editor.command = ["kitty" "-e" "nvim" "-f" "{file}" "-c" "normal {line}G{column0}l"];

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
}
