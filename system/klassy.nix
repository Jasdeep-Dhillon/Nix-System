{ pkgs, ... }:
let
  klassyBuild =
    {
      lib,
      stdenv,
      fetchFromGitHub,
      cmake,
      kdePackages,
    }:
    stdenv.mkDerivation rec {
      pname = "klassy";
      version = "6.4.breeze6.4.0";

      src = fetchFromGitHub {
        owner = "paulmcauley";
        repo = pname;
        rev = version;
        sha256 = "sha256-+bYS2Upr84BS0IdA0HlCK0FF05yIMVbRvB8jlN5EOUM=";
      };

      cmakeFlags = [
        "-DCMAKE_INSTALL_PREFIX=$out"
        "-DBUILD_TESTING=OFF"
        "-DKDE_INSTALL_USE_QT_SYS_PATHS=ON"
        "-DBUILD_QT5=OFF"
      ];

      nativeBuildInputs = [
        cmake
        kdePackages.extra-cmake-modules
        kdePackages.wrapQtAppsHook
      ];

      buildInputs = [
        kdePackages.kdecoration
        kdePackages.kcoreaddons
        kdePackages.kguiaddons
        kdePackages.kconfigwidgets
        kdePackages.kiconthemes
        kdePackages.kwayland
        kdePackages.kwindowsystem
        kdePackages.kirigami
        kdePackages.frameworkintegration
        kdePackages.kcmutils
        kdePackages.qtsvg
      ];

      patchPhase = ''
        runHook prePatch
        runHook postPatch
      '';

      meta = with lib; {
        description = "A highly customizable binary Window Decoration and Application Style plugin for recent versions of the KDE Plasma desktop";
        homepage = "https://github.com/paulmcauley/klassy";
        license = with licenses; [
          gpl2Only
          gpl2Plus
          gpl3Only
          bsd3
          mit
        ];
      };
    };
in
{
  # klassy = pkgs.callPackage klassyBuild { };
  environment.systemPackages = [
    (pkgs.kdePackages.callPackage
    klassyBuild
    { })
  ];
}
