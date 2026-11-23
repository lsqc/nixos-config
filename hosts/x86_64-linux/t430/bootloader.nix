{ lib, ... }:

{
  boot.loader = {
    systemd-boot.enable = lib.mkForce false;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      splashImage = ../../../assets/bootsplash.png;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
}
