{
  description = "Basic Mac Setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, mac-app-util, ... }:
  {
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix
        mac-app-util.darwinModules.default
      ];
    };
  };
}
