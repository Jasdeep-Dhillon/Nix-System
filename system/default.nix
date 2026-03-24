{ ... }:
{
  imports = [

    ./dev
    ./inputs

    ./bluetooth.nix
    ./boot.nix
    ./fonts.nix
    ./lanzaboote.nix
    ./localisation.nix
    ./networking.nix
    ./services.nix
    ./users.nix
    ./gaming.nix
    ./run0.nix
    ./programs.nix
    ./packages.nix
    
    ./sddm.nix
    ./theme.nix
    ./wm.nix
    ./niri.nix
    ./nix-ld.nix
    # ./hyprland.nix
    # ./klassy.nix
  ];

  zramSwap.enable = true;

  # Nix Options
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://hyprland.cachix.org"
        "https://zed.cachix.org"
        "https://cache.garnix.io"
        "https://devenv.cachix.org"
      ];
      trusted-substituters = [
        "https://hyprland.cachix.org"
        "https://zed.cachix.org"
        "https://cache.garnix.io"
        "https://devenv.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "zed.cachix.org-1:/pHQ6dpMsAZk2DiP4WCL0p9YDNKWj2Q5FL20bNmw1cU="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];
    };
  };
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    operation = "switch";
  };

  system.stateVersion = "25.11";
}
