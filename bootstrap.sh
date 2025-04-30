#!/bin/bash
set -e

echo "🔧 Setting up your Mac..."

# Install Xcode Command Line Tools
echo "📦 Installing Xcode Command Line Tools..."
if ! xcode-select -p &>/dev/null; then
  xcode-select --install
  echo "⏳ Waiting for Xcode Command Line Tools to complete installation..."
  echo "⚠️  Please complete the installation dialog..."
  read -p "Press enter once Xcode Command Line Tools installation is complete..."
else
  echo "✅ Xcode Command Line Tools already installed."
fi

# Install Rosetta 2 (for Apple Silicon Macs)
if [[ $(uname -m) == 'arm64' ]]; then
  echo "📦 Installing Rosetta 2 for Apple Silicon Mac..."
  if ! /usr/bin/pgrep -q oahd; then
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    echo "✅ Rosetta 2 installed."
  else
    echo "✅ Rosetta 2 already installed."
  fi
fi

# Install Nix
echo "📦 Installing Nix..."
if ! command -v nix &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
  # Source nix
  if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  fi
  echo "✅ Nix installed."
else
  echo "✅ Nix already installed."
fi

echo "🎉 Bootstrap complete! You can now proceed with the nix-darwin setup."
