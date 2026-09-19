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
  ];

  services.resolved.enable = lib.mkForce false;

  programs.nix-ld.enable = true;

  networking = {
    hostName = "t420";
    networkmanager.enable = true;
    #    resolvconf.enable = true;
  };

  environment.systemPackages = [
    pkgs.clang
    pkgs.prismlauncher
    pkgs.dia

    inputs.kirikae.packages.x86_64-linux.default
  ];

}
