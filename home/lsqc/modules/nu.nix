{ config, ... }: {

  programs.nushell = {
    enable = true;
    shellAliases = config.programs.zsh.shellAliases;
    settings = {
      show_banner = false;
      completions.external = {
        enable = true;
        max_results = 200;
      };
    };
  };
}
