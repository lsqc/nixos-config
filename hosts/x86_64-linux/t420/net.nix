{ ... }:

{
  services.avahi.enable = false;

  networking = {
    firewall.allowPing = false;

    tempAddresses = "default";
    networkmanager = {
      enable = true;

      settings = {
        main = {
          hostname-mode = "none";
        };

        connection = {
          "wifi.cloned-mac-address" = "random";
          "ethernet.cloned-mac-address" = "random";
          "ipv4.dhcp-send-hostname" = "false";
          "ipv4.dhcp-client-id" = "none";
          "ipv6.dhcp-send-hostname" = "false";
        };

        device = {
          "wifi.scan-rand-mac-address" = "true";
        };
      };
    };
  };
}
