{
  user,
  lib,
  pkgs,
  ...
}:

{

  # profile picture
  system.activationScripts.gdm-profile-picture.text = ''
    mkdir -p /var/lib/AccountsService/{icons,users}
    cp ${../../../assets/pfp.png} /var/lib/AccountsService/icons/${user.name}/face.png
    echo -e "[User]\nIcon=/var/lib/AccountsService/icons/${user.name}\n" > /var/lib/AccountsService/users/${user.name}
  '';
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
