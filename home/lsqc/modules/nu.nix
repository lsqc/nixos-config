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

      $env.config.color_config = ($env.config.color_config | merge {
          shape_external:             { fg: "#00d7af", attr: b }
          shape_external_resolved:    { fg: "#00d7af", attr: b }
          shape_internalcall:         { fg: "#00d7af", attr: b }
          shape_custom:               { fg: "#00ff5f", attr: b }
          shape_keyword:              { fg: "#ffff00", attr: b }
          shape_filepath:             { fg: "#5fd7ff", attr: i }
          shape_directory:            { fg: "#5fd7ff", attr: b }
          shape_garbage:              { fg: "#ffffff", bg: "#ff0000", attr: b }
          shape_flag:                 { fg: "#00ff5f", attr: b }
          shape_string:               { fg: "#00ff5f" }
          shape_string_interpolation: { fg: "#00ffff", attr: b }
          shape_raw_string:           { fg: "#af87ff" }
          shape_pipe:                 { fg: "#ffff00" }
          shape_semicolon:            { fg: "#ffff00" }
          shape_redirection:          { fg: "#ffff00", attr: b }
          shape_globpattern:          { fg: "#ffff00", attr: b }
          shape_glob_interpolation:   { fg: "#ffff00", attr: b }
      })
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
