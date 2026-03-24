{ pkgs, lib, ... }:
let
  background-package = pkgs.stdenvNoCC.mkDerivation {
    name = "background-image";
    src = ../wallpapers/lock.jpg;
    dontUnpack = true;
    installPhase = ''
      cp $src $out
    '';
  };
  avatar-package = pkgs.stdenvNoCC.mkDerivation {
    name = "avatar-package";
    src = ../dots/avatar.jpg;
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out/share/sddm/faces
      cp $src $out/share/sddm/faces/arc.face.icon
    '';
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    theme = lib.mkForce "breeze";
    wayland.enable = true;
    wayland.compositor = "kwin";
    extraPackages = with pkgs.kdePackages; [
      breeze-icons
      kirigami
      libplasma
      plasma5support
      qtsvg
      qtvirtualkeyboard
    ];
  };
  environment.systemPackages = with pkgs.kdePackages; [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background="${background-package}"
    '')
    avatar-package
    plasma-desktop
    plasma-workspace
    breeze
    breeze-icons
    ocean-sound-theme
  ];
  services.desktopManager.plasma6.enableQt5Integration = true;
}
