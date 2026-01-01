{
  description = "NixOS pahujlica";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      mkHome = system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { 
	    inherit system;
	    config.allowUnfree = true;
	  };
          modules = [ ./home/default.nix ];
        };
    in
    {
      homeConfigurations = {
        nikola-linux = mkHome "x86_64-linux";
        nikola-darwin = mkHome "aarch64-darwin";
      };
    };
}
