{
  pkgs,
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
    pv
  ];

  graphical-stuff = with pkgs; [
    (pkgs.callPackage ../../assets/xcursor-plan9 { })

    vlc
    swaybg
    libreoffice-qt-fresh
    # arandr
    yubioath-flutter
    steam
    jameica
    ghidra
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
