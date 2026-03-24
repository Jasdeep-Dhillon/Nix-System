{ pkgs, ... }:
{
  boot.extraModulePackages = [ pkgs.linuxKernel.packages.linux_6_19.lenovo-legion-module ];
  environment.systemPackages = with pkgs; [ lenovo-legion ];
}
