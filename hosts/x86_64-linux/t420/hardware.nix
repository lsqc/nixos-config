{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      kernelModules = [ ];
      availableKernelModules = [
        "ehci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
        "sr_mod"
        "sdhci_pci"
      ];
    };
    kernelParams = [
      "nouveau.runpm=0"
      "acpi_osi=Linux"
    ];
    kernelModules = [ ];
    extraModulePackages = [ ];
    kernelPackages = pkgs.linuxPackages_zen;
  };

  fileSystems = {

    "/" = {
      device = "/dev/mapper/crypted";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

    "/nix" = {
      device = "/dev/mapper/crypted";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

    "/.swapvol" = {
      device = "/dev/mapper/crypted";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

    "/home" = {
      device = "/dev/mapper/crypted";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

    "/boot" = {
      device = "/dev/disk/by-partlabel/disk-main-ESP";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    bluetooth.enable = false;
  };

}
