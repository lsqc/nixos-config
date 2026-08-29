{
  pkgs,
  inputs,
  ...
}:

let
  cli-pkgs = with pkgs; [
    htop
    playerctl
    ipcalc
    calc
    cargo
    clock-rs
    onefetch
    gnumake
    speedtest-cli
    timer
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
    brightnessctl
    yazi
    pandoc
    opentofu
    tldr
    wl-mirror
    wl-clipboard
    wlr-randr
    hyfetch
    scrcpy
    openvpn
    tokei
    jellycli
    zig
    nh
    fpc
  ];

  graphical-stuff = with pkgs; [
    # prismlauncher
    vlc
    swaybg
    libreoffice-qt-fresh
    # arandr
    yubioath-flutter
    inputs.helium.packages.x86_64-linux.default
    steam
    jameica
  ];
in
{
  home.packages =
    with pkgs;
    cli-pkgs
    ++ graphical-stuff
    ++ [

      pngquant
      scrot

      pamixer

      libnotify

      texliveSmall

      xwayland-satellite

    ];
}
