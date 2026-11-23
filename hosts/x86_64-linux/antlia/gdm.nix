{
  user,
  ...
}:

{
  system.activationScripts.gdm-profile-picture.text = ''
    mkdir -p /var/lib/AccountsService/icons /var/lib/AccountsService/users

    cp ${../../../assets/pfp.png} /var/lib/AccountsService/icons/${user.name}.png

    echo -e "[User]\nSession=niri\nSystemAccount=false\nIcon=/var/lib/AccountsService/icons/${user.name}.png\n" > /var/lib/AccountsService/users/${user.name}

    chmod 600 /var/lib/AccountsService/users/${user.name}
    chmod 644 /var/lib/AccountsService/icons/${user.name}.png
  '';

  programs.niri.enable = true; # ?!??!

  services.displayManager = {

    defaultSession = "niri";
    gdm = {
      enable = true;
      settings = { };
    };
  };
}
