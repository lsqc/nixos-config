{
  pkgs,
  lib,
  user,
  ...
}:

let
  keys = import ./keys.nix;
in
{
  users.users.${user.name} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "pcscd"
    ];
    openssh.authorizedKeys.keys = keys.${user.name};
    shell = lib.getExe pkgs.nushell;
  };

  users.users.root.openssh.authorizedKeys.keys = keys.root;
}
