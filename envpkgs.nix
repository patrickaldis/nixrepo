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
      vscode
      kitty
      ((emacsPackagesFor emacsPgtkNativeComp).emacsWithPackages (epkgs: with epkgs; [
        libvterm
        vterm
      ]))
    ]
    ++
    [#HYPRLAND UTILS
      inputs.hyprcontrib.packages.x86_64-linux.grimblast
      inputs.hyprland.packages.x86_64-linux.waybar-hyprland
    ];
}
