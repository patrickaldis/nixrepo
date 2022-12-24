let
  dotfiles = ../xdgconf;
in
{
  # Config Files:
  home.file = {
    ".internet/comodo.pem".source = "${dotfiles}/internet/comodo.pem";
    ".emacs.d/themes/catppuccin-frappe-theme.el".source = "${dotfiles}/emacs/catppuccin-frappe-theme.el";
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
}
