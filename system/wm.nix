{ pkgs, ... }:
{
 
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal
    kdePackages.xdg-desktop-portal-kde
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    kdePackages.qt6ct
    nwg-look
    wiremix
    wl-clipboard
    hyprpicker
    runapp
    catppuccin-qt5ct
    quickshell
    nautilus
  ];

  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  xdg.portal.enable = true;
  xdg.mime.enable = true;
  xdg.menus.enable = true;
}
