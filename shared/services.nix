{pkgs, config, ...}:
{
  services =
    {
      dbus.enable = true;

      gnome =
        {
          gnome-keyring.enable = true;
          at-spi2-core.enable = true;
        };

      pipewire =
        {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };

      xserver = {
        enable = true;
        layout = "gb";
        xkbVariant = "";
        displayManager = {
          sessionPackages = [ pkgs.gnome.gnome-session.sessions ];
          gdm = {
            enable = true;
            wayland = true;
          };
        };
      };

    };
  programs.dconf.enable = true;
  programs.seahorse.enable = true;
}
