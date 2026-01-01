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

  programs.home-manager.enable = true;
  programs.fish.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
