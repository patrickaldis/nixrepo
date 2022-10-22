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
      gamescope
      mangohud

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
      ((emacsPackagesFor emacsPgtkNativeComp).emacsWithPackages
        (epkgs:
          (with epkgs; [
            magit
            projectile
            
            treemacs
            all-the-icons
            treemacs-all-the-icons
            treemacs-projectile
            treemacs-magit

            libvterm
            vterm
            direnv
            doom-modeline

            lsp-mode
            lsp-haskell
            nix-mode
            
            evil
            evil-collection
            evil-leader

            dracula-theme
          ])
        ++
        (with pkgs;
          [python3]
        )
      )
    )
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

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true;
  };
}
