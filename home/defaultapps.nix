{
  xdg.mimeApps = {
    enable = true;
    defaultApplications =
      let
        browser = "org.qutebrowser.qutebrowser.desktop";
        pdf = "org.gnome.Evince.desktop";
      in
        {
          "application/pdf" = [pdf];
          "text/html" = [browser];
          "x-scheme-handler/http" = [browser];
          "x-scheme-handler/https" = [browser];
          "x-scheme-handler/about" = [browser];
          "x-scheme-handler/unknown" = [browser];
        };
  };
}
