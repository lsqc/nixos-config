{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./desktop.nix
    ./modules
    ./host.nix
  ];

  home.username = "lsqc";
  home.homeDirectory = "/home/lsqc";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    htop
    playerctl

    ipcalc
    calc

    # niri
    swaybg
    scrcpy

    fuzzel
    swaylock
    hyprlock

    prismlauncher
    cargo
    onefetch

    cmake
    speedtest-cli

    timer
    clock-rs

    pngquant
    xclip
    scrot
    betterlockscreen

    playerctl
    pamixer
    vlc

    scrcpy
    openvpn

    # dunst
    libnotify

    asciiquarium-transparent
    feh
    comma
    wireguard-tools
    clang
    whois
    killall
    yt-dlp
    usbutils
    fzf
    just
    mtr
    mv
    brightnessctl
    yazi
    pandoc
    opentofu
    tldr
    wl-mirror
    wl-clipboard
    wlr-randr
    hyfetch

    libreoffice-qt-fresh
    arandr
    texliveSmall

    steam
    jameica

    xwayland-satellite
    inputs.helium.packages.x86_64-linux.default

    yubioath-flutter
  ];
}
