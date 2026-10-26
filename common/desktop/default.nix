{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ../pcscd.nix
    ../console.nix
    ./emoji.nix
  ];

  # nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  boot = {
    plymouth = {
      enable = true;
      theme = "blahaj";
      themePackages = with pkgs; [ plymouth-blahaj-theme ];
    };
  };

  fonts = {
    packages = with pkgs; [
      liberation_ttf
      dejavu_fonts
      nerd-fonts.comic-shanns-mono
      nerd-fonts.hasklug
    ];
    fontconfig =
      let
        theme-config = import ../../home/lsqc/theme-settings.nix;
      in
      {
        enable = true;
        defaultFonts = {
          serif = [ "Liberation Serif" ];
          sansSerif = [ "Liberation Sans" ];
          monospace = [ "${theme-config.font.family}" ];
          emoji = [ "Apple Color Emoji" ];
        };
      };
  };

  hardware.graphics.enable = true;
  security.polkit.enable = true;

  programs = {
    nix-ld.enable = true;
    seahorse.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  environment = {

    pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];

    variables = {
      BROWSER = "firefox";
      EDITOR = "hx";
    };

    systemPackages = with pkgs; [

      gimp
      inkscape
      keepassxc

      openscad
      discordo

      telegram-desktop
      signal-desktop
      thunderbird
      pidgin

      prusa-slicer
      tor-browser

      pavucontrol
      pkg-config
    ];
  };

  # keyring
  services = {
    gnome.gnome-keyring = {
      enable = true;
    };
  };

  security.pam.services.login.enableGnomeKeyring = true;
}
