{pkgs,...}:
{
  system.stateVersion = "22.05";

  boot.loader = {
    efi.canTouchEfiVariables = true;                      #BOOT
    efi.efiSysMountPoint = "/boot/efi";
    systemd-boot = {
      enable = true;
      consoleMode = "1";
    };
  };
  console = {
    earlySetup = true;
    font = "ter-v32n";
    packages = with pkgs; [ terminus_font ];
  };

  virtualisation = {
    libvirtd.enable = true;
    kvmgt.enable = true;
  };

  networking = {
    hostName = "nixos";                                    #NETWORKING
    enableIPv6 = false;
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/London";                                  #LOCALE
  i18n.defaultLocale = "en_GB.utf8";
  console.keyMap = "uk";

  hardware.bluetooth.enable = true;                                 #SOUND
  hardware.opengl.driSupport32Bit = true;
  virtualisation.vmVariant = {
    # following configuration is added only when building VM with build-vm
    virtualisation = {
      memorySize =  8000; # Use 2048MiB memory.
      cores = 4;
      qemu.options = [ "-device virtio-vga-gl" "-display gtk,gl=on"];
    };
  };
  security.rtkit.enable = true;
}
