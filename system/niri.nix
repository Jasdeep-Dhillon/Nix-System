{
  pkgs,
  ...
}:
{
  programs.niri.enable = true;
  services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = with pkgs; [
    nirius
    xwayland-satellite
    jq
    kdePackages.kirigami.unwrapped
  ];
  xdg.portal = {
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    configPackages = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    config.common = {
      default = [ "gnome" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gnome" ];
    };
    config.niri = {
      "org.freedesktop.impl.portal.FileChooser" = [
        "gnome"
        "kde"
      ];
    };
  };

  environment.etc."nvidia/nvidia-application-profiles-rc.d/50-niri.json".text = ''
    {
      "rules": [
        {
          "pattern": {
            "feature": "procname",
            "matches": "niri"
          },
          "profile": "niri"
        }
      ],
      "profiles": [
        {
          "name": "niri",
          "settings": [
            {
              "key": "GLVidHeapReuseRatio",
              "value": 0
            }
          ]
        }
      ]
    }
  '';
  environment.etc."nvidia/nvidia-application-profiles-rc.d/51-stellar-blade.json".text = ''
    {
      "rules": [
        {
          "pattern": {
            "feature": "procname",
            "matches": "SB-Win64-Shipping.exe"
          },
          "profile": "Stellar Blade Fix"
        }
      ],
      "profiles": [
        {
          "name": "Stellar Blade Fix",
          "settings": [
            {
            “key”: “GLShowGraphicsOSD”,
            “value”: true
            },
            {
            “key”: “GLShaderDiskCache”,
            “value”: true
            },
            {
            “key”: “GLVidHeapReuseRatio”,
            “value”: 90
            },
            {
            “key”: “GLThreadedOptimizations”,
            “value”: false
            }
          ]
        }
      ]
    }
  '';

  # hardware.nvidia.forceFullCompositionPipeline = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    GTK_USE_PORTAL = "1";
  };
}
