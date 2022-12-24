{pkgs, nix-doom-emacs, ...}:
{
  imports = [
    nix-doom-emacs.hmModule
  ];

  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ../../xdgconf/doom;
    doomPackageDir = pkgs.linkFarm "doom-packages-dir" [
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
        path = pkgs.emptyFile;
      }
    ];

    # emacsPackages = pkgs.emacsPackagesFor (pkgs.emacs.override { withPgtk = true; });
  };
}
