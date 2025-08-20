#!/bin/bash

/usr/local/bin/mise trust /workspaces/drawlab/mise.toml && /usr/local/bin/mise install
sudo apt update && sudo apt install -y python3 tmux graphviz
curl -fsSL https://d2lang.com/install.sh | sh -s --
npm install -g playwright
npx playwright install --with-deps chromium