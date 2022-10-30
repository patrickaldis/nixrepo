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
