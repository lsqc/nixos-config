{
  lib,
  user,
  ...
}:

{
  imports = [
    ./desktop.nix
    ./modules
    ./host.nix
    ./programs.nix
  ];

  home = {
    username = "${user.name}";
    homeDirectory = "/home/${user.name}";
    stateVersion = "26.11";
  };

  theme = import ./theme-settings.nix;

  news.display = "silent";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];

  # nixpkgs.config.allowUnfree = true;
}
