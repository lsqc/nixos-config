{ ... }:

{
  imports = [

    ./adb.nix
    ./nvidia.nix
    ./audio.nix
    ./printing.nix
    ./yubikey-touch-detector.nix
    ./bootloader.nix
    ./networking.nix
    ./pcscd.nix
  ];
  users.users.lsqc.initialHashedPassword = "$y$j9T$xB197CaW0t2ECiddOMgVc1$KLU3d8tdDz9Q4LYFI/oFnRmgFw14PO0I2Wsdl2J8dgB";
}
