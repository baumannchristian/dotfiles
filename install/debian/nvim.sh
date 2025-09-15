#!/bin/bash

set -euo pipefail

function up() {
  # cleanup
  sudo rm -rf /usr/local/bin/nvim
  sudo rm -rf /usr/local/share/nvim

  wget -q 'https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz'
  sha256sum nvim-linux-x86_64.tar.gz | grep -q '02b808a3ee8fc30161e07fe3c3edfb24b28bd0295323ac5dbdd8ec7012cac67d'

  sudo tar -xzf nvim-linux-x86_64.tar.gz -C /usr/local --strip-components=1

  rm nvim-linux-x86_64.tar.gz

  echo "nvim successfully installed $(nvim --version | head -n1 | cut -c 6-)"
} 
