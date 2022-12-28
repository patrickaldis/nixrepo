{pkgs, nix-doom-emacs, customSettings, ...}:
{
  imports = [
    nix-doom-emacs.hmModule
  ];

  programs.doom-emacs =
    let
      privateWithConf = {configPath}:
        pkgs.linkFarm "doom-private-dir"[
          {
            name = "init.el";
            path = ../../xdgconf/doom/init.el;
          }
          {
            name = "packages.el";
            path = ../../xdgconf/doom/packages.el;
          }
          {
            name = "config.el";
            path = configPath;
          }
        ];
    in
      {
    enable = true;
    doomPrivateDir = privateWithConf
      {
        configPath =
          (pkgs.writeTextFile {
            name = "config.el";
            text = ''
                   (setq fontsize ${if customSettings.hiDPI then "28" else "14"})
                   ${builtins.readFile ../../xdgconf/doom/config.el}
                 '';
          });
      };
    doomPackageDir = privateWithConf {configPath = pkgs.emptyFile;};

    # emacsPackages = pkgs.emacsPackagesFor (pkgs.emacs.override { withPgtk = true; });
  };
}
