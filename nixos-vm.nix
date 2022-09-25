{config, pks, ...}:

{
  imports = 
    [ 
      ./configuration.nix
      <nixpkgs/nixos/modules/virtualisation/qemu-vm.nix>
    ];

  virtualisation.qemu.options = ["-vga none" "-device virtio-vga-gl" "-display gtk,gl=on"];
}