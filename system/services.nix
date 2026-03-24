{ ... }:
{
  services.dbus.implementation = "broker";
  services.udisks2.enable = true;
  services.fwupd.enable = true;
  services.upower = {
    enable = true;
    criticalPowerAction = "Hibernate";
  };
  services.logind.settings.Login = {
    HandlePowerKey = "ignore";
    # HandleLidSwitch = "suspend";
  };
  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
  };
  services.udev.extraRules = ''
    KERNEL=="hidraw*", ATTRS{idVendor}=="352d", ATTRS{idProduct}=="2383", TAG+="uaccess"
    KERNEL=="hidraw*", ATTRS{idVendor}=="3554", ATTRS{idProduct}=="f58a", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTR{idVendor}=="048d", ATTR{idProduct}=="c975", MODE="0666"
  '';

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  services.flatpak = {
    enable = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

}
