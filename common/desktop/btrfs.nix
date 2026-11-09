{ ... }:

{
  services.btrfs = {
    autoScrub = {
      enable = true;
      interval = "daily";
    };
  };
}
