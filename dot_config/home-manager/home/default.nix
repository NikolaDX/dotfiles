{ config, pkgs, ... }:
{
  home.username = "nikola";

  home.homeDirectory =
    if pkgs.stdenv.isDarwin
      then "/Users/nikola"
      else "/home/nikola";

  home.stateVersion = "25.11";

  imports = [
    ./packages.nix
  ];

  programs.fish = {
    enable = true;

    loginShellInit = ''
      # Load Nix environment
      if test -e /etc/profile.d/nix.sh
        bass source /etc/profile.d/nix.sh
      end
    '';
  };

  programs.fish.plugins = [
    {
      name = "bass";
      src = pkgs.fishPlugins.bass.src;
    }
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
