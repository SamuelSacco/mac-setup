{ pkgs, ... }:

{
  # Enable Nix daemon
  services.nix-daemon.enable = true;
  
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # System packages - just VSCode and iTerm2
  environment.systemPackages = [
    pkgs.vscode
    pkgs.iterm2
  ];
  
  # Required for nix-darwin
  system.stateVersion = 4;
  
  # Platform specification
  nixpkgs.hostPlatform = "aarch64-darwin";
}