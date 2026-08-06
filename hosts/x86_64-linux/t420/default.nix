{
  lib,
  inputs,
  pkgs,
  ...
}:

{
  imports = [

    ./hardware.nix

    ../../../common
    ../../../common/desktop.nix

    ./adb.nix
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./emulation.nix
    ./logind.nix
    ./pcscd.nix
    ./printing.nix
    ./resolved.nix
    ./tailscale.nix
  ];

  services.resolved.enable = lib.mkForce false;

  networking = {
    hostName = "t420";
    networkmanager.enable = true;
    #    resolvconf.enable = true;
  };

  # time shit
  time.timeZone = "Europe/Berlin";

  environment.systemPackages = [
    pkgs.clang
    pkgs.prismlauncher

    inputs.kirikae.packages.x86_64-linux.default
  ];

  programs = {
    nix-ld.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
  };
}
