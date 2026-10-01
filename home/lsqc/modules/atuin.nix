{ ... }:

{
  programs.atuin = {
    enable = true;

    flags = [ "--disable-up-arrow" ];

    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      auto_sync = false;
      style = "full";
      inline_height = 20;
      theme.name = "tokyo-night";
      keymap_mode = "vim-normal";
      keymap_cursor = {
        emacs = "blink-block";
      };
    };
    themes = {
      # source: https://gist.github.com/hschne/754a3bea3d1acd725a144d3239382658
      "tokyo-night" = {
        theme.name = "tokyo-night";
        colors = {
          AlertInfo = "#73daca";
          AlertWarn = "#e0af68";
          AlertError = "#f7768e";
          Annotation = "#414868";
          Base = "#a9b1d6";
          Guidance = "#ff9e64";
          Important = "#7aa2f7";
          Title = "#bb9af7";
        };
      };
    };
  };
}
