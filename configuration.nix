# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  hyprland = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      hyprland.nixosModules.default
      (import "${home-manager}/nixos")
    ];
  
  #DEVICE CONFIGURATION
  nixpkgs.config.allowUnfree = true;                                #NIX
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #nix.nixPath = [ "nixos-config=/home/patrickaldis/.nixrepo/configuration.nix" "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos" "/nix/var/nix/profiles/per-user/root/channels"];

  boot.loader.efi.canTouchEfiVariables = true;                      #BOOT
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.systemd-boot = {
    enable = true;
    consoleMode = "1";
  };
  console= {
    earlySetup = true;
    font = "ter-v32n";
    packages = with pkgs; [ terminus_font ];
  };

  networking.hostName = "nixos";                                    #NETWORKING
  networking.enableIPv6 = true;
  networking.networkmanager.enable = true;

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
  };

  users.users.patrickaldis = {                                      #USERS
    isNormalUser = true;
    description = "Patrick Aldis";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    packages = with pkgs; [];
  };

  programs.hyprland = {                                             #USER-SPECIFIC ( WILL CHANGE )
    enable = true;
    package = hyprland.packages.${pkgs.system}.default;
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
  };
 
  environment.systemPackages = with pkgs; [
  killall
  firefox
  neovim
  discord
  pavucontrol
  thunderbird
  blueberry
  openvpn
  xorg.xeyes
  xorg.xprop
  git
  google-chrome
  lxappearance
  wofi
  rofi
  gnome.nautilus
  gnome.adwaita-icon-theme
  waybar
  stow
  vscode
  kitty
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
