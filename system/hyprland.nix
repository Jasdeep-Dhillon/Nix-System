{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Hypr Utilities
    hypridle
    hyprshot
    hyprpaper
    hyprcursor
    hyprlock
  ];

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
  };
}
