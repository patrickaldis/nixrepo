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
      any-nix-shell
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
      spotify-unwrapped
      discord
      mailspring
      thunderbird
      wofi
      (qutebrowser.override {enableWideVine=true;})
      gnome.nautilus
      gnome.evince
      cinnamon.nemo
      vscode
      kitty
      deluge
      vlc
      ((emacsPackagesFor emacs).emacsWithPackages
        (epkgs:
          (with epkgs; [
            magit
            git-gutter
            git-gutter-fringe
            
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

            counsel
            ivy-rich
            all-the-icons-ivy-rich
            avy
            
            nix-mode
            haskell-mode
            fish-mode
            
            evil
            evil-collection
            evil-leader

            dracula-theme
          ])
        ++
        (with pkgs;
          [python3]
        )
        ++
        (with epkgs.melpaStablePackages;
          [
            lsp-mode
            lsp-ui
            company
            lsp-treemacs
          ])
        ++
        (with epkgs.melpaPackages;
          [
            lsp-haskell

            python-mode
            lsp-pyright
            flycheck
          ]
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
      enable = false;
      package = pkgs.emacs;
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true;
  };
}
