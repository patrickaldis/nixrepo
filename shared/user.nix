{pkgs, config, customSettings, ...}:
{
  users.users.patrickaldis = {                                      #USERS
    description = "Patrick Aldis";
    initialPassword = "password";
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" "kvm" "openrazer"];
    isNormalUser = true;
  };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;                               #SHELL
  environment.shells = with pkgs; [ fish ];
  environment.sessionVariables = rec {
    GDK_SCALE="${if customSettings.hiDPI then "2" else "1"}";
    WLR_RENDERER_ALLOW_SOFTWARE="1";
    TERMCMD="kitty";
    EDITOR="nvim";
    PAGER="nvimpager";
    fish_greeting="";
  };
  services.cron = {
    enable = true;
    systemCronJobs = [
      "@reboot rm -r -f home/patrickaldis/Downloads/*"
    ];
  };
}
