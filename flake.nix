{
  description = "php program";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-root.url = "github:srid/flake-root";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {

      devShells.${system}.default =
        pkgs.mkShell rec {
          
          shellHook = ''
            alias quickshell="quickshell -p $PWD"
          '';

          # Packages
          packages = with pkgs; [
            quickshell
            nerd-fonts.symbols-only
          ];
        };
    };
}
