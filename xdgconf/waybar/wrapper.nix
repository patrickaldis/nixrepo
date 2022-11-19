let
  theme = import ../../theme.nix;
in
{
  xdg.configFile = {
    "waybar/config".source = ./config;
    "waybar/logout".source = ./logout;
    "waybar/swap-sink".source = ./swap-sink;
    "waybar/waybar-mpris".source = ./waybar-mpris;
    "waybar/style.css".text =
      ''
        * {
            border: none;
            font-family: JetBrainsMono Nerd Font Mono;
        }
        body {

        }

        window {
          /*font-weight: bold;*/
        }
        window#waybar {
            color: #ffffff;
            background: rgba(0, 0, 0, 0);
        }
        /*-----module groups----*/
        .modules-right {
          background-color: #${theme.background};
            margin: 10px 8px 0 0;
            border-radius: 20px;
        }
        .modules-center {
          background-color: #${theme.background};
            margin: 10px 0px 0 0;
            border-radius: 20px;
            font-size: 15px;
        }
        .modules-left {
            margin: 10px 0 0 8px;
          background-color: #${theme.background};
            border-radius: 20px;
        }
        /*-----modules indv----*/
        #workspaces button {
            color: #ffffff;
            background-color: #${theme.background};
            border-radius: 20px;
            padding: 1px 5px;
            margin: 3px 3px;
        }
        #workspaces button:hover {
            box-shadow: inherit;
          background: #${theme.primary};
        }

        #workspaces button.active {
          background: #${theme.primary};
            color: #${theme.background};
        }
        button {
            color: #ffffff;
            border: none;
            border-radius: 20px;
        }
        button:hover {
            color: #${theme.primary};
            border-radius: 20px;
            background: #303446;
            box-shadow: inherit;
            text-shadow: inherit;
        }
        #clock,
        #battery,
        #cpu,
        #memory,
        #temperature,
        #network,
        #pulseaudio,
        #custom-media,
        #tray,
        #mode,
        #custom-power,
        #custom-menu,
        #custom-waybar-mpris {
            padding: 0 10px;
        }
        #idle_inhibitor {
            padding: 0 10px;
            font-size: 15px;
        }
        #mode {
            color: #${theme.primary};
            font-weight: bold;
        }
        #custom-power {
            background-color: #${theme.primary};
            color: #${theme.background};
            border-radius: 50px;
            padding: 0px 7px;
            font-size: 20px;
            margin: 3px 3px;
        }
        #custom-power:hover {
            color: #${theme.primary};
            background: #303446;
        }
        /*-----Indicators----*/
        #idle_inhibitor.activated {
            color: #${theme.primary};
        }
        #pulseaudio.muted {
            color: #${theme.primary};
        }
        #battery.charging {
            color: #${theme.primary};
        }
        #battery.warning:not(.charging) {
          color: #e6e600;
        }
        #battery.critical:not(.charging) {
            color: #cc3436;
        }
        #temperature.critical {
            color: #cc3436;
        }
        /*-----Colors----*/
        /*
         *rgba(0,85,102,1),#005566 --> Indigo(dye)
         *rgba(0,43,51,1),#002B33 --> Dark Green
         *rgba(0,153,153,1),#009999 --> Persian Green
         *
         */

      '';
  };
}
