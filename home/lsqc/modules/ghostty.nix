{ config, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {

      theme = "Abernathy";
      window-padding-x = 2;
      window-decoration = false;

      # t420 can't handle shaders vewwy well qwq
      custom-shader = if config.host != "t420" then "${../../static/ghostty-shader.glsl}" else "";

      font-size = config.theme.font.size;
      font-family = "${config.theme.font.family}";

      cursor-color = "#c516f5";
      background = "#000000";

      cursor-style = "block";
      cursor-style-blink = true;
      shell-integration-features = "no-cursor,ssh-terminfo";

      background-opacity = 0.95;
      background-blur = true;
      background-blur-radius = 5;

      # copy-on-select = true;
      mouse-reporting = false;
      confirm-close-surface = false;
      right-click-action = "copy-or-paste";
    };
  };
}
