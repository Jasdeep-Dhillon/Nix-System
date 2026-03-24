{
  pkgs,
  inputs,
  ...
}:
{
  users.users.arc = {
    isNormalUser = true;
    description = "Arc";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
      "gamemode"
    ];

    packages = [
      inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    shell = pkgs.nushell;
  };
}
