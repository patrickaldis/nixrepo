{pkgs, ...}:
{
  imports = [
    ./programs
    ./files.nix
    ./defaultapps.nix
  ];

  home = {
    homeDirectory = "/home/patrickaldis";
    stateVersion = "22.05";

    packages = with pkgs; [git];
  };
}
