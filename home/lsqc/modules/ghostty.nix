{ config, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      window-padding-x = 2;
      window-decoration = false;

      custom-shader = "${../../static/ghostty-shader.glsl}";
      background = "#000000";
      font-size = config.theme.font.size;
      font-family = "${config.theme.font.family}";
      cursor-color = "#c516f5";
    };
  };
}
