{ pkgs, ... }:

let
  apple-color-emoji = pkgs.stdenvNoCC.mkDerivation {
    pname = "apple color emoji";
    version = "local";
    src = ../../assets/applecoloremoji.ttf;
    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      install -Dm664 $src $out/share/fonts/truetype/AppleColorEmoji.ttf
      runHook postInstall
    '';
  };
in
{
  fonts = {
    fontconfig.defaultFonts.emoji = [ "Apple Color Emoji" ];
    packages = [ apple-color-emoji ];
  };
}
