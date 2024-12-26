{
  description = "Modpack do gelinhos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {nixpkgs, utils, ... }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells = rec {
        modpack = pkgs.mkShell {
          name = "modpack";
          nativeBuildInputs = with pkgs; [ packwiz unzip zip yq zsh ];
        };
        default = modpack;
      };
    });
}
