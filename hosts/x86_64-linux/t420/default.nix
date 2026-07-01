{ pkgs, ... }:

{
  imports = [

    ./hardware.nix

    ../../../common
    ../../../common/desktop.nix

    ./adb.nix
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./logind.nix
    ./printing.nix
    ./resolved.nix
    ./pcscd.nix
    ./emulation.nix
  ];

  networking = {
    hostName = "t420";
    networkmanager.enable = true;
    #    resolvconf.enable = true;
  };

  # time shit
  time.timeZone = "Europe/Berlin";

  environment.systemPackages = with pkgs; [ clang ];

  programs = {
    nix-ld.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
  };
}
