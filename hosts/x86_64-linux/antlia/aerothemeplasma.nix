{ ... }: {

  services.desktopManager.plasma6.enable = true;
  # services.displayManager.defaultSession = "aerothemeplasma";

  programs.aeroshell = {
    enable = true;
    fonts.segoe.enable = true;
    polkit.enable = true;
    aerothemeplasma = {
      enable = true;
      # sddm.enable = true;
      # plymouth.enable = true;
    };
  };
}
