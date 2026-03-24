{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ffmpeg
    yt-dlp
    bat
    wget
    imagemagick
    uutils-coreutils-noprefix
    bottom
    flatpak
    fastfetch
    fd
    eza
    zoxide
    zellij
    dua
    hyperfine
    tokei
    kdePackages.dolphin
    kdePackages.ark
    bazaar
    yazi
    s-tui
  ];
}
