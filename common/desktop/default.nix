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
    ./emulation.nix
    ./btrfs.nix
  ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

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

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      nerd-fonts.comic-shanns-mono
      nerd-fonts.hasklug
      nerd-fonts.symbols-only
    ];
    fontconfig =
      let
        theme-config = import ../../home/lsqc/theme-settings.nix;
      in
      {
        enable = true;
        defaultFonts = {
          serif = [
            "Liberation Serif"
            "Noto Serif CJK HK"
          ];
          sansSerif = [
            "Liberation Sans"
            "DejaVu Sans"
            "Symbols Nerd Font"
            "Noto Sans Symbols 2"
            "Noto Sans CJK HK"
            "Unifont"
          ];
          monospace = [
            theme-config.font.family
            "Symbols Nerd Font Mono"
            "DejaVu Sans Mono"
            "Noto Sans Symbols 2"
            "Noto Sans Mono CJK HK"
            "Unifont"
          ];
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
