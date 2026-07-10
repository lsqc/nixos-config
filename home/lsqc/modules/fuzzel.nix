{
  config,
  ...
}:

{
  programs.fuzzel = {

    enable = true;

    settings = {
      colors = {
        text = "ffffffff";
        background = "000000ee";
        input = "e8fc03ff";
        selection-text = "37faa2ff";
        selection = "1f1f1fff";
        selection-match = "00ff08ff";
      };
      border = {
        radius = 0;
      };
      main = {
        enable-mouse = false;
        use-bold = true;
        placeholder = "...";
        font = "${config.theme.font.family}:size=${toString config.theme.font.size}";
      };
    };
  };
}
