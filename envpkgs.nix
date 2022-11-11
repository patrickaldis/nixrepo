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
      killall
      gnome.zenity
      playerctl
      gammastep
      brightnessctl
      any-nix-shell
      gamescope
      mangohud

      #UTILTIES
      networkmanagerapplet
      pavucontrol
      blueberry
      baobab
      ranger

      #LIB
      libappindicator-gtk3
      libappindicator-gtk2
      libayatana-appindicator-gtk3

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
      (qutebrowser.override {enableWideVine=true;})
      gnome.nautilus
      gnome.evince
      cinnamon.nemo
      vscode
      kitty
      fragments
      clapper
      foliate
      setzer
      (emacsWithPackagesFromUsePackage {
        package = pkgs.emacsPgtkNativeComp;
        config = ./xdgconf/emacs/init.el;

        extraEmacsPackages = (epkgs:
          (with epkgs; [
            use-package

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
            prescient
            ivy-prescient
            avy
            
            nix-mode
            haskell-mode
            fish-mode
            
            evil
            evil-collection
            evil-leader

            autothemer
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
        );
      })
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
    # emacs = {
    #   enable = false;
    #   package = pkgs.emacs;
    # };
    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true;
  };
  programs.kdeconnect.enable = true;

  #QUTEBROWSER SCRIPT
  systemd.services.qutedaemon = {
    serviceConfig = {
      ExecStart= "qutebrowser -R --nowindow";
      RestartSec="1s";
      Restart="always";
    };
  };
}
