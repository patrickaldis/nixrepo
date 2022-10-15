{lib, pkgs, config, inputs, ...}:
{
  environment.systemPackages =
    with pkgs;
    [#CMD
      ripgrep
      cmake
      neofetch
      pulseaudio
      wget
      neovim
      killall
      gnome.zenity
      playerctl
      wlsunset
      light
      direnv

      #UTILTIES
      networkmanagerapplet
      pavucontrol
      blueberry

      #LIB
      libappindicator
      gnome.adwaita-icon-theme
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr

      #APPLICATIONS
      spotify
      discord
      mailspring
      thunderbird
      wofi
      qutebrowser
      gnome.nautilus
      cinnamon.nemo
      vscode
      kitty
      ((emacsPackagesFor emacsPgtkNativeComp).emacsWithPackages (epkgs: with epkgs; [
        libvterm
        vterm
      ]))
    ]
    ++
    (with inputs;
    [#HYPRLAND UTILS
      hyprcontrib.packages.x86_64-linux.grimblast
      hyprland.packages.x86_64-linux.waybar-hyprland
    ]
    );

  #SERVICES
  services =
  {
    flatpak.enable = true;
    lorri.enable = true;
    emacs = {
      enable = true;
      package = pkgs.emacsPgtkNativeComp;
    };
  };
}
