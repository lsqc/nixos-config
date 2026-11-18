{ pkgs, ... }:
{
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
      pkgs.nerd-fonts.bigblue-terminal
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
}
