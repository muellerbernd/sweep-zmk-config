{
  description = "ZMK flake";

  inputs = {
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      {
        devShell = nixpkgs.mkShell {

          buildInputs = with nixpkgs; [
            python311Packages.west
          ];
        };
      });
}
