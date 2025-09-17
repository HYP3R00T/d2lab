#!/bin/bash
set -euo pipefail

# Trust and install tools defined in mise.toml (includes node=lts)
/usr/local/bin/mise trust /workspaces/d2lab/mise.toml
/usr/local/bin/mise install

# Base OS packages (add curl in case image is minimal)
sudo apt update
sudo apt install -y python3 tmux graphviz curl

# Install D2 only if not already present (idempotent)
if ! command -v d2 >/dev/null 2>&1; then
	curl -fsSL https://d2lang.com/install.sh | sh -s --
fi

# Use node via mise to ensure npm is on PATH in this non-interactive shell.
# This avoids relying on shell init hooks for mise activation.
/usr/local/bin/mise x node@lts -- npm install -g playwright@latest

# Install Chromium (and its system deps) for Playwright. Running inside the
# mise node context ensures the playwright CLI is on PATH. We DO NOT prefix
# with sudo because that would drop the node PATH; the playwright installer
# internally invokes sudo for system dependencies when needed.
/usr/local/bin/mise x node@lts -- playwright install --with-deps chromium \
  || /usr/local/bin/mise x node@lts -- npx -y playwright@latest install --with-deps chromium

echo "setup.sh completed successfully."