#!/bin/bash

set -euo pipefail

function up() {
  echo -e "Setting up python..."
  if ! command -v python &> /dev/null; then
    echo "python not found - installing python3"
    sudo apt install python3 -y
    sudo apt install python3-venv -y
    sudo apt install python3-pip -y

    local version=$(python3 --version | cut -d " " -f 2 | cut -d "." -f 1,2)
    echo "export PATH=\"\$PATH:/usr/local/lib/python$version\"" >> ~/.zshrc
    echo "alias python='python3'" >> ~/.zshrc
  fi

  echo -e "Successfully added python!"
} 
