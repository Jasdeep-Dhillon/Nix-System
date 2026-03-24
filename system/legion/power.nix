{ ... }:
{
  powerManagement = {
    cpuFreqGovernor = "performance";
  };
  services.system76-scheduler = {
    enable = true;
    useStockConfig = false;
    assignments = {
      "sound-server" = {
        nice = -15;
        ioClass = "realtime";
        ioPrio = 0;
        matchers = [
          "pipewire"
          "pipewire-pulse"
          "jackd"
        ];
      };
      "recording" = {
        nice = -9;
        ioClass = "best-effort";
        ioPrio = 0;
        matchers = [
          "amsynth"
          "easyeffects"
          "jamesdsp"
          "jitsi"
          "mumble"
          "obs"
          "teams"
          "wireplumber"
          "zoom"
          "bitwig-studio"
          "include name=\"Bitwig*\""
        ];
      };
      "games" = {
        nice = -5;
        ioClass = "best-effort";
        ioPrio = 0;
        matchers = [
          "lutris"
          "steam"
          "heroic"
          "itch"
          "vrcompositor"
          "vrdashboard"
          "vrmonitor"
          "vrserver"
          "include descends=\"lutris\""
          "include descends=\"heroic\""
          "include descends=\"itch\""
          "include descends=\"steam\""
        ];
      };
      "comp-games" = {
        nice = -20;
        class = "rr";
        prio = 90;
        ioClass = "best-effort";
        ioPrio = 4;
        matchers = [
          "Overwatch.exe"
          "cs2"
          "ULTRAKILL.exe"
          "deadlock.exe"
        ];
      };
      "desktop-environment" = {
        nice = -3;
        ioClass = "best-effort";
        ioPrio = 0;
        matchers = [
          "niri"
          "cosmic-comp"
          "gnome-shell"
          "i3wm"
          "kwin"
          "sway"
          "Hyprland"
          "gamescope"
          "Xorg"
        ];
      };
      "session-services" = {
        nice = 9;
        ioClass = "idle";
        matchers = [
          "include cgroup=\"/user.slice/*.service\" parent=\"systemd\""
          "include cgroup=\"/user.slice/*/session.slice/*\" parent=\"systemd\""
          "exclude cgroup=\"/user.slice/*app-dbus*\""
        ];
      };
      "system-services" = {
        nice = 12;
        ioClass = "idle";
        matchers = [
          "include cgroup=\"/system.slice/*\""
        ];
      };
      "package-manager" = {
        nice = 15;
        class = "batch";
        ioClass = "idle";
        matchers = [
          # "include name=\"apt-*\""
          # "include name=\"dpkg-*\""
          # "apt"
          # "dpkg"
          "flatpak"
          "fwupd"
          "packagekitd"
          "update-initramfs"
        ];
      };
      "batch" = {
        nice = 19;
        class = "idle";
        ioClass = "idle";
        matchers = [
          "include name=\"sbuild-*\""
          "\"7z\""
          "\"7za\""
          "\"7zr\""
          "ar"
          "boinc"
          "c++"
          "cargo"
          "clang"
          "cmake"
          "cpp"
          "FAHClient"
          "FAHCoreWrapper"
          "fossilize-replay"
          "g++"
          "gcc"
          "gradle"
          "javac"
          "ld"
          "lld"
          "make"
          "mold"
          "mvn"
          "ninja"
          "rust-analyzer"
          "rustc"
          "sbuild"
          "tar"
          "tracker-miner-fs-3"
          "unrar"
          "zip"
        ];
      };
    };
    settings = {
      processScheduler = {
        enable = true;
        useExecsnoop = false;
        pipewireBoost.enable = true;
        foregroundBoost = {
          enable = true;
          foreground = {
            nice = 0;
            ioClass = "best-effort";
            ioPrio = 0;
          };
          background = {
            nice = 6;
            ioClass = "idle";
          };
        };
      };
      cfsProfiles = {
        enable = true;
        responsive.preempt = "full";
      };
    };
    exceptions = [
      "include descends=\"chrt\""
      "include descends=\"gamemoderun\""
      "include descends=\"ionice\""
      "include descends=\"nice\""
      "include descends=\"taskset\""
      "include descends=\"schedtool\""
      "chrt"
      "dbus"
      "dbus-broker"
      "gamemoderun"
      "ionice"
      "nice"
      "rtkit-daemon"
      "systemd"
      "taskset"
      "schedtool"
    ];
  };
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    pd.enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 1;
      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 1;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "balanced";
      START_CHARGE_THRESH_BAT0 = 0;
      STOP_CHARGE_THRESH_BAT0 = 1;
      RESTORE_DEVICE_STATE_ON_STARTUP = 1;
      DEVICES_TO_ENABLE_ON_STARTUP = "bluetooth wifi wwan";
      DEVICES_TO_DISABLE_ON_SHUTDOWN = "bluetooth wifi wwan";
      DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE = "bluetooth wifi wwan";
    };
  };
}
