{ lib, ... }:
{
  networking.hostName = "legion"; # Define your hostname.
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = (lib.lists.range 1714 1764) ++ [ 4000 ];
    allowedUDPPorts = (lib.lists.range 1714 1764) ++ [ 4000 ];
  };
}
