# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }: let
 home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/a7f0cc2d7b271b4a5df9b9e351d556c172f7e903/master.tar.gz";
    sha256="0ydkwprdkiq3xjkqf8j7spwaaaxhdm2ka2ylkzycfz49id4fb2q2";
  };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./user.nix
      ./nixsettings.nix
      ./services.nix
      ./system.nix
      ./envpkgs.nix
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];
  
  #DEVICE CONFIGURATION
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];

  home-manager.users.patrickaldis = {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox.override {
        cfg = { enableTridactylNative = true; };
      };
    };

    home.homeDirectory = "/home/patrickaldis";
    home.packages = with pkgs; [ git lutris];
    home.stateVersion = "22.05";
    home.file.".internet/comodo.pem".source = ./xdgconf/internet/comodo.pem;
    home.file.".emacs.d/init.el".source = ./xdgconf/emacs/init.el;
    xdg.configFile = {
      "hypr/hyprland.conf".source = ./xdgconf/hyprland/hyprland.conf;
      "waybar".source = ./xdgconf/waybar;
      "wofi".source = ./xdgconf/wofi;
      "dunst".source = ./xdgconf/dunst;
      "fish/config.fish".source = ./xdgconf/fish/config.fish;
    };

    services.dunst = {
      enable = true;
    };
        };


  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/99f607199684071fef8e8a411d4e5d862cd5647a/master.tar.gz";
      sha256 = "04sf1sfia8s2whkmd90hgqmxyyyqaj13cqzsj8jwzp652xygvgk0";
    }))
  ];
}
