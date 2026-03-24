{
  config,
  lib,
  ...
}:
{
  imports = [
    ./power.nix
    ./specialisation.nix
    # ./cachy-kernel.nix
    # ./module.nix
    ../nvidia.nix
  ];

  hardware = {
    enableRedistributableFirmware = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    amdgpu.initrd.enable = false;
    nvidia = {
      dynamicBoost.enable = true;
      powerManagement.finegrained = true;
      nvidiaPersistenced = true;
      prime = {
        amdgpuBusId = "PCI:53:0:0";
        nvidiaBusId = "PCI:1:0:0";
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        # reverseSync.enable = true;
        # sync.enable = true;
        # allowExternalGpu = false;
      };
    };
  };
  # Keyboard Lighting
  services.hardware.openrgb.enable = true;
  # boot = {
  # kernelParams = [
  #   "initcall_blacklist=acpi_cpufreq_init"
  #   "amd_pstate=passive"
  #   "amd_pstate=active"
  #   # "amd_pstate=guided"
  # ];
  # kernelModules = [
  #   "amd-pstate"
  # ];
  # kernel.sysctl = {
  #   "vm.swappiness" = 60;
  #   "vm.max_map_count" = 2147483642;
  # };
  #
  # };
  services.fstrim.enable = lib.mkDefault true;
  powerManagement.enable = true;

}
