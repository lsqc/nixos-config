{ lib, ... }:

{
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = lib.mkForce false;
    };
  };
}
