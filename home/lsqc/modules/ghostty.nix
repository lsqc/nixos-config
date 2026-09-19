{ config, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      window-padding-x = 2;
      window-decoration = false;

      custom-shader = "${../../static/ghostty-shader.glsl}";

      font-size = config.theme.font.size;
      font-family = "${config.theme.font.family}";

      cursor-color = "#c516f5";
      background = "#000000";

      cursor-style = "block";
      cursor-style-blink = true;
      shell-integration-features = "no-cursor";
    };
  };
}
