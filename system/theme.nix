{ pkgs, ... }:
{
  # imports = [ ./sddm.nix ];
  environment.systemPackages = with pkgs; [
    graphite-cursors
    xdg-user-dirs
  ];
  qt = {
    enable = true;
  };
}
