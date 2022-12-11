let
  theme = import ../../../shared/theme.nix;
in
{customSettings, ...}:{
  xdg.configFile."hypr/hyprland.conf".text =
''
  #AUTO GENERATED NIX VALUES:
  ${if customSettings.hiDPI then
    ''
      monitor=,highrr,auto,2
      exec-once=xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2
    ''
    else
    ''
      monitor=,highrr,auto,1
    ''
   }
  #COLORS:
  general {
    gaps_in=4
    gaps_out=6
    border_size=3
    col.active_border=0xB9${theme.primary}
    col.inactive_border=0x66${theme.background}
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
