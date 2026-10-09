{ config, ... }: {

  programs.nushell = {
    enable = true;
    shellAliases = config.programs.zsh.shellAliases;

    extraConfig = ''

      $env.config.table.mode = "compact"
      $env.EDITOR = "hx"

      let ssh = (
        ($env.SSH_CLIENT? | is-not-empty) or ($env.SSH_TTY? | is-not-empty) or ($env.SSH_CONNECTION? | is-not-empty)
      )

      let hostname = ((sys host) | get hostname)

      $env.PROMPT_INDICATOR = { ||
          return ((ansi purple_bold) + " λ ")
      }

      $env.PROMPT_COMMAND = { ||
          let dir = ((ansi cyan_bold) + (pwd | str replace $env.HOME "~") + (ansi reset))
          let host = if $ssh {
            (ansi --escape { fg: "#ff005f", attr: b }) + $"\(($hostname)\)" + (ansi reset) + " "
          } else {
              ""
          }
          return (" " + $host + $dir + ((ansi --escape { fg: "#5f00ff"}) + ">" + (ansi reset)))
      }
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
