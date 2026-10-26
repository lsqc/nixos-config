{ lib, pkgs, ... }:

{
  services.displayManager = {

    sessionPackages = [ pkgs.niri ];
    defaultSession = lib.mkForce "niri";
    gdm = {
      extraPackages = [ pkgs.niri ];
      enable = true;
      settings = { };
    };
  };
}
