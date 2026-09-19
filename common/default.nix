{
  lib,
  ...
}:

{

  imports = [
    ./desktop
    ./dns.nix
    ./packages.nix
    ./pcscd.nix
    ./secrets.nix
    ./ssh.nix
    ./users.nix
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

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
