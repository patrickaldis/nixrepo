let
  theme = import /home/patrickaldis/.nixrepo/theme.nix;
in
{
  xdg.configFile."hypr/hyprland.conf".text =
''
  #AUTO GENERATED NIX VALUES:
  ${if true then
    ''
      monitor=,preferred,auto,2
    ''
    else
    ''
      monitor=,preferred,auto,1
    ''
   }
  #COLORS:
  general {
    gaps_in=4
    gaps_out=6
    border_size=3
    col.active_border=0xB9${theme.primary}
    col.inactive_border=0x66${theme.secondary}
    layout=master
    apply_sens_to_raw=0
  }

  #SETTINGS:
  ${builtins.readFile ./settings.conf}

  #BINDS:
  ${builtins.readFile ./binds.conf}

  #STARTUP
  ${builtins.readFile ./startup.conf}

  #RULES:
  ${builtins.readFile ./rules.conf}

'';
}
