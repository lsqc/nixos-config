{ ... }:

{
  services.xserver.xkb = (import ./xkb.nix).xkb;

  console = {
    enable = true;
    font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true;
  };
}
