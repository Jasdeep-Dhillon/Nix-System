{ pkgs, ... }:
{
  programs.fish.enable = true;
  security.polkit.enable = true;
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  environment.shells = [ pkgs.nushell ];
}
