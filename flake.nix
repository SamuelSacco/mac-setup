{
  description = "Basic Mac Setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  {
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix
      ];
    };
  };
}