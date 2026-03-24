{ pkgs, ... }:
{
  # Global git config
  programs.git = {
    enable = true;
    lfs.enable = true;
    package = pkgs.gitFull;
    config = {
      init = {
        defaultBranch = "main";
      };
      # credential.helper = "libsecret";
    };
  };
}
