{lib, pkgs, config, inputs, ...}:
{
  environment.systemPackages =
    with pkgs;
    [#CMD
      ripgrep
      socat
      cmake
      neofetch
      pulseaudio
      wget
      neovim
      swayidle
      nvimpager
      killall
      gnome.zenity
      playerctl
      gammastep
      brightnessctl
      any-nix-shell
      gamescope
      mangohud

      #CODING
      ghc
      haskell-language-server

      #UTILTIES
      networkmanagerapplet
      pavucontrol
      pdfarranger
      blueberry
      baobab
      ranger

      #LIB
      libappindicator-gtk3
      libappindicator-gtk2
      libayatana-appindicator-gtk3
      texlive.combined.scheme-full
      appimage-run

      gnome.adwaita-icon-theme
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr

      #GNOME
      gnomeExtensions.appindicator

      #APPLICATIONS
      spotify-unwrapped
      discord
      mailspring
      thunderbird
      lutris
      wofi
      gnome.nautilus
      gnome.evince
      cinnamon.nemo
      vscode
      mixxx
      kitty
      fragments
      stig
      clapper
      foliate
      setzer
      ((emacsPackagesFor emacsPgtkNativeComp).emacsWithPackages (epkgs:
        [python3]
        ++
        [epkgs.vterm]
      ))
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
    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true;
  };
  programs.kdeconnect.enable = true;
}
