{theme, ...}:{
  xdg.configFile = {
    "wofi/config".source = ./config;
    "wofi/style.css".text =
      ''
        window {
        margin: 0px;
        border: 2px solid #${theme.primary};
        background-color: #282a36;
        font-family: JetBrainsMono Nerd Font Mono;
        border-radius: 10px;
        }

        #input {
        margin: 5px;
        border: none;
        color: #f8f8f2;
        background-color: #44475a;
        }
        #input:selected {
            border: none;
        }


        #inner-box {
        margin: 5px;
        border: none;
        background-color: #${theme.background};
        }

        #outer-box {
        margin: 5px;
        border: none;
        background-color: #${theme.background};
        }

        #scroll {
        margin: 0px;
        border: none;
        }

        #text {
        margin: 5px;
        border: none;
        color: #f8f8f2;
        }

        #entry:selected {
        background-color: #44475a;
        border-radius: 5px;
        }

      '';
  };
}
