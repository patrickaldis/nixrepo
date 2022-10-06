# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: let
 home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/a7f0cc2d7b271b4a5df9b9e351d556c172f7e903/master.tar.gz";
    sha256="0ydkwprdkiq3xjkqf8j7spwaaaxhdm2ka2ylkzycfz49id4fb2q2";
  };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];
  
  #DEVICE CONFIGURATION
  nixpkgs.config.allowUnfree = true;                                #NIX
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"  "https://nix-community.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
    experimental-features = [ "nix-command" "flakes" ];
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;                      #BOOT
    efi.efiSysMountPoint = "/boot/efi";
    systemd-boot = {
      enable = true;
      consoleMode = "1";
    };
  };

  console= {
    earlySetup = true;
    font = "ter-v32n";
    packages = with pkgs; [ terminus_font ];
  };
  virtualisation.libvirtd.enable = true;

  networking = {
    hostName = "nixos";                                    #NETWORKING
    enableIPv6 = false;
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/London";                                  #LOCALE
  i18n.defaultLocale = "en_GB.utf8";
  console.keyMap = "uk";
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
  };
 
  hardware.bluetooth.enable = true;                                 #SOUND
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.dbus.enable = true;                                      #DBUS

  users.defaultUserShell = pkgs.fish;                               #SHELL
  environment.shells = with pkgs; [ fish ];
  environment.sessionVariables = rec {
    #XCURSOR_SIZE="64";
    GDK_SCALE="2";
    EDITOR="nvim";
    fish_greeting="";
  };
  services.xserver = {
    enable = true;
    displayManager = {
      sessionPackages = [ pkgs.gnome.gnome-session.sessions ];
      gdm = {
        enable = true;
        wayland = true;
      };
    };
  };

  users.users.patrickaldis = {                                      #USERS
    isNormalUser = true;
    initialPassword = "password";
    description = "Patrick Aldis";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    packages = with pkgs; [];
  };

  programs.light.enable = true;
  services.flatpak.enable = true;
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];

  home-manager.users.patrickaldis = {
    home.homeDirectory = "/home/patrickaldis";
    home.packages = with pkgs; [ git lutris];
    home.stateVersion = "22.05";
    xdg.configFile = {
      "hypr/hyprland.conf".source = ./xdgconf/hyprland/hyprland.conf;
      "waybar".source = ./xdgconf/waybar;
      "wofi".source = ./xdgconf/wofi;
    };

    services.dunst = {
      enable = true;
    };
  };
 
  nixpkgs.overlays = [
    (self: super: {
      waybar-hyprland = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/99f607199684071fef8e8a411d4e5d862cd5647a/master.tar.gz";
      sha256 = "04sf1sfia8s2whkmd90hgqmxyyyqaj13cqzsj8jwzp652xygvgk0";
    }))
  ];

  environment.systemPackages = let
  nordvpn = pkgs.stdenv.mkDerivation rec {
    name = "nordvpn";
    src = builtins.fetchurl {
      url = "https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.14.2_amd64.deb";
      sha256 = "1alqh0bzz4y9dpfw8mmg7aa8ffnz46r2gjh3zdbhap3rfkycyxk8";
    };
    unpackCmd = "${pkgs.dpkg}/bin/dpkg-deb -x $curSrc .";
    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
    ];
    builtInputs = with pkgs; [
    ];
    runtimeDependencies = [
    ];
    installPhase = ''
      mkdir -p $out
      cp -r . $out/
    '';
  };
  in with pkgs; [
    ripgrep
  # nordvpn
  wget
  cmake
  swayidle
  mailspring
  neofetch
  pulseaudio
  spotify
  killall
  libappindicator-gtk3
  libayatana-appindicator
  libappindicator-gtk2
  firefox
  neovim
  discord
  pavucontrol
  thunderbird
  blueberry
  openvpn
  xorg.xeyes
  xorg.xprop
  google-chrome
  wofi
  gnome.nautilus
  gnome.adwaita-icon-theme
  stow
  vscode
  waybar-hyprland
  kitty
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  xdg-desktop-portal-wlr
  ((emacsPackagesFor emacsPgtkNativeComp).emacsWithPackages (epkgs: with epkgs; [
    libvterm
    vterm
  ]))

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.emacs= {
    package = pkgs.emacsPgtkNativeComp;
    enable = true;
  };
  services.gnome3.at-spi2-core.enable = true;
  services.davmail = {
    enable = true;
    url = "https://outlook.office365.com/EWS/Exchange.asmx";
  };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
