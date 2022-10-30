{pkgs, config,...}:
{
  users.users.patrickaldis = {                                      #USERS
    description = "Patrick Aldis";
    initialPassword = "password";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    isNormalUser = true;
  };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;                               #SHELL
  environment.shells = with pkgs; [ fish ];
  environment.sessionVariables = rec {
    GDK_SCALE="2";
    EDITOR="nvim";
    fish_greeting="";
  };
}
