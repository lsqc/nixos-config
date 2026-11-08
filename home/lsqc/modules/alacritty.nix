{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    theme = "hyper";
    themePackage = pkgs.alacritty-theme;

    settings = {
      keyboard.bindings = [
        {
          key = "K";
          mods = "Control";
          chars = "\\u000c";
        }
      ];

      font = {
        size = config.theme.font.size;
        normal = {
          family = "${config.theme.font.family}";
        };
      };

      colors = {
        cursor = {
          text = "#84c1db";
          cursor = "#c516f5";
        };
      };

      cursor = {
        blink_interval = 500;
        blink_timeout = 0;
        style = {
          blinking = "Always";
          shape = "block";
        };
      };
    };
  };
}
