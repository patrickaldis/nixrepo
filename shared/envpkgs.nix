{lib, pkgs, config, inputs, ...}:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-basic
      dvisvgm dvipng # for preview and export as html
      xcolor parskip etoolbox bibtex
      wrapfig amsmath ulem hyperref capt-of;
      #(setq org-latex-compiler "lualatex")
      #(setq org-preview-latex-default-process 'dvisvgm)
  });
in
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
      swaybg
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
      noisetorch

      #LIB
      libappindicator-gtk3
      libappindicator-gtk2
      libayatana-appindicator-gtk3
      texlive.combined.scheme-full
      # tex
      appimage-run
      ispell

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
      gimp
      vscode
      mixxx
      kitty
      fragments
      stig
      clapper
      foliate
      setzer
      nyxt
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

  programs.noisetorch.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true;
  };
  programs.kdeconnect.enable = true;
}
