{ pkgs, ... }:

{
  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];

      config.niri = {
        default = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Access" = "gtk";
        "org.freedesktop.impl.portal.Notification" = "gtk";
        "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
      };
      # config.niri = {
      #   default = [
      #     "gnome"
      #     "gtk"
      #   ];
      #   "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      # };
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "firefox.desktop";

        "application/pdf" = "firefox.desktop";

        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";

        "x-scheme-handler/mailto" = "thunderbird.desktop";
      };
    };
  };
}
