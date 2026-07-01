{
  lib,
  ...
}:

{

  imports = [
    ./ssh.nix
    ./users.nix
    ./packages.nix
    ./dns.nix
    ./gc.nix
    ./secrets.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = lib.mkDefault "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  environment = {

    variables = {
      EDITOR = "hx";
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = lib.mkDefault [ 22 ];
  };

  system.stateVersion = "26.05";
}
