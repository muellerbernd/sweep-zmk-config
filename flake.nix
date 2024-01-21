# {
#   description = "ZMK flake";
#
#   inputs = {
#     flake-utils.url = "github:numtide/flake-utils";
#     nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
#   };
#
#   outputs = { flake-utils, nixpkgs, ... }:
#     flake-utils.lib.eachDefaultSystem (system:
#       let
#         pkgs = import nixpkgs {
#           inherit system;
#         };
#       in
#       {
#         devShell = pkgs.mkShell {
#
#           buildInputs = with pkgs; [
#             # (python311Packages.pykwalify.overrideAttrs
#             #   (old: {
#             #     doCheck = false;
#             #     pythonImportsCheck = [ ];
#             #     nativeCheckInputs = [ ];
#             #     disabledTests = [ ];
#             #   }))
#             python311Packages.west
#           ];
#         };
#       });
# }
{
  description = "my project description";

  # inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          devShells.default = import ./shell.nix { inherit pkgs; };
        }
      );
}
