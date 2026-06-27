{ config, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        fail_timeout = 2000;
        hide_cursor = true;
        ignore_empty_input = true;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 10;
        }
      ];

      label = [
        # clock
        {
          font_size = 40;
          color = "rgb(9918f5)";
          font_family = "${config.theme.font.family}";
          position = "0, 260";
          monitor = "";
          text = "<span>$TIME</span>";
          font_color = "rgba(216, 222, 233, 0.75)";
          shadow_passes = 2;
        }
        # hostname
        {
          size = "200, 50";
          position = "0, 210";
          monitor = "";
          color = "rgb(1fff80)";
          text = "<span><i>${config.host}</i></span>";
          font_family = "${config.theme.font.family}";
          font_color = "rgb(52, 235, 210)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          shadow_passes = 2;
        }
        # user name
        {
          size = "200, 50";
          position = "0, 20";
          monitor = "";
          text = "<span>$USER</span>";
          font_family = "${config.theme.font.family}";
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          shadow_passes = 2;
        }
      ];

      image = [
        {
          monitor = "";
          size = 100;
          path = "~/.local/share/pfp.png";
          position = "0, 100";
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -70";
          monitor = "";
          dots_size = 0.2;
          dots_center = true;
          fade_on_empty = false;
          outline_thickness = 3;
          placeholder_text = "<span>Password...</span>";
          shadow_passes = 2;
        }
      ];
    };
  };
}
