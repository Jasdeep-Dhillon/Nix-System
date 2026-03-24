{ ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Name = "Legion";
        Experimental = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
  hardware.enableAllFirmware = true;
}
