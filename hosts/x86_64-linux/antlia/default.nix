{ ... }:

{
  imports = [

    ./adb.nix
    ./audio.nix
    ./printing.nix
    ./yubikey-touch-detector.nix
    ./bootloader.nix
    ./networking.nix
    ./pcscd.nix
  ];
}
