{ pkgs, ... }:
{
  # Disable nix-darwin's management of Nix (use Determinate Systems instead)
  nix.enable = false;
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # System packages
  environment.systemPackages = [
    pkgs.vscode
    pkgs.iterm2
  ];
  
  # Create symlinks for command-line tools
  system.activationScripts.extraActivation.text = ''
    # Set up VS Code CLI
    echo "Setting up VS Code CLI..." >&2
    VSCODE_PATH=$(find /nix/store -name "code" -type f -path "*/Applications/Visual Studio Code.app/Contents/Resources/app/bin/*" | head -n 1)
    if [ -n "$VSCODE_PATH" ]; then
      mkdir -p /usr/local/bin
      ln -sf "$VSCODE_PATH" /usr/local/bin/code
      echo "VS Code CLI set up at /usr/local/bin/code" >&2
    else
      echo "Could not find VS Code binary" >&2
    fi
  '';
  
  # Required for nix-darwin
  system.stateVersion = 4;
  
  # Platform specification
  nixpkgs.hostPlatform = "aarch64-darwin";
}
