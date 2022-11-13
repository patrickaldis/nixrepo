# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./user.nix
      ./nixsettings.nix
      ./services.nix
      ./system.nix
      ./envpkgs.nix
      ./hardware-configuration.nix
    ];
  
  #DEVICE CONFIGURATION
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/99f607199684071fef8e8a411d4e5d862cd5647a/master.tar.gz";
      sha256 = "04sf1sfia8s2whkmd90hgqmxyyyqaj13cqzsj8jwzp652xygvgk0";
    }))
  ];
}
