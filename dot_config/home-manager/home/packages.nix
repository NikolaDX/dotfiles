{ pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in {
  home.packages = with pkgs; [
    # General
    neovim
    git
    fastfetch
    

    # Development
    python312
    dotnet-sdk_9
  ];
}

