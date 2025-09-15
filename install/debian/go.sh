#!/bin/bash

set -euo pipefail

function up() {
  echo -e "Installing go"

  echo -e "Downloading go..."
  wget -q https://go.dev/dl/go1.25.0.linux-amd64.tar.gz -P ~/Downloads
  rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.25.0.linux-amd64.tar.gz

  echo -e "Download go language server"
  go install golang.org/x/tools/gopls@latest

  rm ./go1.25.0.linux-amd64.tar.gz

  echo -e "Successfully installed go!"
} 

