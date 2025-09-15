#!/bin/bash

set -euo pipefail

function up() {
  version="v22.17.0"
  sudo mkdir -p /usr/local/bin/node/bin
  wget -q https://nodejs.org/dist/$version/node-$version-linux-x64.tar.xz
  sudo tar xf node-$version-linux-x64.tar.xz -C /usr/local/bin/node/
  sudo ln -sf /usr/local/bin/node/node-$version-linux-x64/bin/node /usr/bin/node
  sudo ln -sf /usr/local/bin/node/node-$version-linux-x64/bin/npm /usr/bin/npm

  rm ./node-$version-linux-x64.tar.xz

  echo "Node $version successfully installed!"
} 
