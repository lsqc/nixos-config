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
      theme.name = "autumn";
      keymap_mode = "vim-normal";
      keymap_cursor = {
        emacs = "blink-block";
      };
    };
  };
}
