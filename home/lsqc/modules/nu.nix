{ config, ... }: {

  programs.nushell = {
    enable = true;
    shellAliases = config.programs.zsh.shellAliases;

    extraConfig = ''
      $env.PROMPT_INDICATOR = { ||
          return ((ansi purple_bold) + " λ ")
      }
      $env.PROMPT_COMMAND = { ||
          let dir = ((ansi cyan_bold) + (pwd | str replace $env.HOME "~") + (ansi reset))
          return (" " + $dir + ((ansi --escape { fg: "#5f00ff"}) + ">" + (ansi reset)))
      }

      $env.config.table.mode = "compact"

    '';

    settings = {
      show_banner = false;
      completions.external = {
        enable = true;
        max_results = 200;
      };
    };
  };
}
