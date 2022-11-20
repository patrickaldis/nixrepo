{pkgs, config,...}:
{
  users.users.patrickaldis = {                                      #USERS
    description = "Patrick Aldis";
    initialPassword = "password";
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" "kvm"];
    isNormalUser = true;
  };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;                               #SHELL
  environment.shells = with pkgs; [ fish ];
  environment.sessionVariables = rec {
    GDK_SCALE="2";
    WLR_RENDERER_ALLOW_SOFTWARE="1";
    TERMCMD="kitty";
    EDITOR="nvim";
    fish_greeting="";
  };
  services.cron = {
    enable = true;
    systemCronJobs = [
      "@reboot rm -r -f home/patrickaldis/Downloads/*"
    ];
  }; 
}
