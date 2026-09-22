{ ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        identityFile = [
          "~/.ssh/id_ed25519_sk"
          "~/.ssh/id_ed25519_sk2"
          "~/.ssh/id_ed25519_sk3"
          "~/.ssh/id_ed25519"
        ];
      };
    };
  };
}
