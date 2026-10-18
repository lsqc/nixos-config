{
  lib,
  inputs,
  pkgs,
  ...
}:

{
  imports = [

    ./hardware.nix

    ./adb.nix
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./emulation.nix
    ./logind.nix
    ./printing.nix
    ./resolved.nix
    ./tailscale.nix
    ./yubikey-touch-detector.nix

    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t430
  ];

  services.resolved.enable = lib.mkForce false;

  programs.nix-ld.enable = true;

  networking = {
    hostName = "aquila";
    networkmanager.enable = true;
  };

  users.users.lsqc.initialHashedPassword = "$y$j9T$xB197CaW0t2ECiddOMgVc1$KLU3d8tdDz9Q4LYFI/oFnRmgFw14PO0I2Wsdl2J8dgB";

  environment.systemPackages = [
    inputs.kirikae.packages.x86_64-linux.default
    (pkgs.callPackage ../../../assets/xcursor-plan9/default.nix { })

    pkgs.clang
    pkgs.prismlauncher
    pkgs.dia
  ];
}
