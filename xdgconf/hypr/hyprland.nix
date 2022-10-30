{pkgs}:{
  xdg.configFile."hypr/hyprland.conf".text =
''

  # Please note not all available settings / options are set here.
  # For a full list, see the wiki (basic and advanced configuring)
  #

  monitor=,preferred,auto,2

  input {
      kb_file=
      kb_layout=gb
      kb_variant=
      kb_model=
      kb_options=
      kb_rules=

      follow_mouse=1

      sensitivity=0.25
      touchpad {
          natural_scroll=yes
      }

  }

  general {
      gaps_in=4
      gaps_out=6
      border_size=3
      col.active_border=0xB9FA768B
      col.inactive_border=0x66282A2E

      layout=master
      apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)

      damage_tracking=full # leave it on full unless you hate your GPU and want to make it suffer
  }

  decoration {
      rounding=12
      blur=1
      blur_size=16 # minimum 1
      blur_passes=3 # minimum 1
      blur_new_optimizations=1
      inactive_opacity=0.8
  }

  animations {
      enabled=1
      animation=windows,1,7,default
      animation=border,1,10,default
      animation=fade,1,10,default
      animation=workspaces,1,6,default
  }

  master {
      new_is_master=false
  }

  dwindle {
      pseudotile=0 # enable pseudotiling on dwindle
  }

  gestures {
      workspace_swipe=true
      workspace_swipe_distance=400
      workspace_swipe_cancel_ratio=0.35
      workspace_swipe_min_speed_to_force=10
  }
  misc {
      disable_hyprland_logo=true
      disable_splash_rendering=true
  }

  # example window rules
  # for windows named/classed as abc and xyz
  #windowrule=move 69 420,abc
  #windowrule=size 420 69,abc
  #windowrule=float,abc
  #windowrule=pseudo,abc
  #windowrule=monitor 0,xyz

  #PROGRAMS
  bind=ALTSHIFT,RETURN,exec,kitty
  bind=ALT,F,exec,nemo
  bind=ALT,S,exec,qutebrowser
  bind=ALT,D,exec,emacsclient -c --eval '(load-file "~/.emacs.d/init.el")'
  bind=ALT,P,exec,wofi

  #NAVIGATION
  bind=ALT,k,layoutmsg,cycleprev
  bind=ALT,j,layoutmsg,cyclenext
  bind=ALT,h,movefocus,l
  bind=ALT,SPACE,exec,pkill -SIGUSR1 '^.waybar-wrapped$'
  bind=ALTSHIFT,k,layoutmsg,swapprev
  bind=ALTSHIFT,j,layoutmsg,swapnext
  bind=ALTSHIFT,h,layoutmsg,swapwithmaster
  bind=ALT,M,fullscreen,1
  bind=ALTSHIFT,SPACE,fullscreen,0

  bind=ALT,T,togglefloating,active
  bind=ALTSHIFT,T,pseudo

  bind=ALTSHIFT,C,killactive
  bind=ALTSHIFT,Q,exec,sh ~/.config/waybar/logout

  #WORKSPACES
  bind=ALT,1,workspace,1
  bind=ALT,2,workspace,2
  bind=ALT,3,workspace,3
  bind=ALT,4,workspace,4
  bind=ALT,5,workspace,5
  bind=ALT,6,workspace,6
  bind=ALT,7,workspace,7
  bind=ALT,8,workspace,8
  bind=ALT,9,workspace,9
  bind=CTRLALT,K,workspace,-1
  bind=CTRLALT,J,workspace,+1

  bind=ALTSHIFT,1,movetoworkspacesilent,1
  bind=ALTSHIFT,2,movetoworkspacesilent,2
  bind=ALTSHIFT,3,movetoworkspacesilent,3
  bind=ALTSHIFT,4,movetoworkspacesilent,4
  bind=ALTSHIFT,5,movetoworkspacesilent,5
  bind=ALTSHIFT,6,movetoworkspacesilent,6
  bind=ALTSHIFT,7,movetoworkspacesilent,7
  bind=ALTSHIFT,8,movetoworkspacesilent,8
  bind=ALTSHIFT,9,movetoworkspacesilent,9

  #MOUSE
  bindm=CTRL,mouse:272,movewindow
  bindm=ALT,mouse:272,resizewindow

  #BRIGHTNESS
  bind=,XF86MonBrightnessUp,exec,light -A 10
  bind=,XF86MonBrightnessDown,exec,light -U 10

  #VOLUME
  bind=,XF86AudioRaiseVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ +5%
  bind=,XF86AudioLowerVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ -5%
  bind=,XF86AudioMute,exec,pactl set-sink-mute @DEFAULT_SINK@ toggle

  #MEDIA CONTROLS
  bind=,XF86AudioNext,exec,playerctl next
  bind=,XF86AudioPrev,exec,playerctl previous
  bind=,XF86AudioPlay,exec,playerctl play-pause

  bind=CTRL,Print,exec,grimblast copy window
  bind=ALT,Print,exec,grimblast copy area
  bind=,Print,exec,grimblast copy screen

  #STARTUP
  exec-once=hyprpaper
  exec-once=waybar
  exec-once=xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2
  exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
  exec-once=systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

  #Programs
  exec-once=discord --start-minimized
  exec-once=flatpak run com.rtosta.zapzap --hideStart
  exec-once=wlsunset
  exec-once=nm-applet --indicator
  exec-once=emacs --daemon
  exec-once=nix-shell -p libnotify acpi --run "sh ~/.config/hypr/batteryscript.sh"

  #swayidle -w \
  #	timeout 300 'swaylock -f -c 000000' \
  #	timeout 600 'swaymsg "output * dpms off"' \
  #		resume 'swaymsg "output * dpms on"' \
  #	before-sleep 'swaylock -f -c 000000'
  #sleep 1 && hyprctl dispatch dpms off

  #FLOATING RULES
  windowrule=float,pavucontrol
  windowrule=tile,spotify
  windowrule=float,nm-connection-editor
  windowrule=float,blueberry.py
  windowrule=float,nemo#org.gnome.Nautilus
  windowrule=float,title:Add URL#org.gnome.Nautilus

  #BLURRING
  # blurls=notifications
  # blurls=waybar

  #Okay this should now be the config again:
  ${builtins.readFile ./hyprland.conf}

'';
}
