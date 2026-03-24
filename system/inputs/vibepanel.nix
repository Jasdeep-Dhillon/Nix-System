{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprpaper
    hyprlauncher
    clipse
    inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
