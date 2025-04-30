# Mac Setup with Nix

This repository contains my personal Mac setup using Nix and nix-darwin. It provides a reproducible way to configure a new Mac with my preferred settings and applications.

## Prerequisites

- macOS (tested on macOS Ventura and later)
- Administrator access

## Getting Started

### For a brand new Mac:

1. Install Xcode Command Line Tools (which includes Git):
   ```bash
   xcode-select --install
   ```
2. Clone this repository:

   ```bash
   git clone https://github.com/samuelsacco/mac-setup.git
   cd mac-setup
   ```

3. Run the bootstrap script:

   ```bash
   ./bootstrap.sh
   ```

4. Build and apply the nix-darwin configuration:
   ```bash
   nix run nix-darwin -- switch --flake .
   ```

## What's Included

- Essential development tools (neovim, vscode)
- Terminal utilities (iterm2)
- System monitoring (stats)
- Productivity tools (raycast)
- Custom macOS settings
- Web browsers (Firefox, Chrome)

## Customizing

To customize this configuration for your own use:

1. Fork this repository
2. Edit `configuration.nix` to change included packages
3. Modify macOS settings as needed
4. Update username in `flake.nix`
