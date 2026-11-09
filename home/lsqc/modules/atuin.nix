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
      keymap_mode = "vim-insert";
      keymap_cursor = {
        emacs = "blink-block";
      };
    };
    themes = {
      # source: https://gist.github.com/hschne/754a3bea3d1acd725a144d3239382658; modified
      "tokyo-night" = {
        theme.name = "tokyo-night";
        colors = {
          AlertInfo = "#73daca";
          AlertWarn = "#e0af68";
          AlertError = "#fc2850";
          Annotation = "#414868";
          Base = "#ffffff";
          Guidance = "#ff9e64";
          Important = "#7aa2f7";
          Title = "#bb9af7";
        };
      };
    };
  };
}
