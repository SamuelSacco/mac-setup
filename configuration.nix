{ pkgs, ... }:
{
  # Disable nix-darwin's management of Nix (use Determinate Systems instead)
  nix.enable = false;
  
  # Enable flakes (this will be managed by Determinate, so we can remove this too)
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
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
