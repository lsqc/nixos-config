{ config, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      background = "#000000";
      font-size = config.theme.font.size;
      font-family = "${config.theme.font.family}";
      window-padding-x = 2;
      window-decoration = false;
      custom-shader = "${../../static/ghostty-shader.glsl}";
    };
  };
}
