{
  ...
}:

{
  imports = [
    ./desktop.nix
    ./modules
    ./host.nix
    ./programs.nix
  ];

  home.username = "lsqc";
  home.homeDirectory = "/home/lsqc";

  home.stateVersion = "26.11";

  news.display = "silent";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
}
