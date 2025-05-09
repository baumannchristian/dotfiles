
#!/bin/bash

set -euo pipefail

function up() {
  echo -e "[zig] Downloading zig..."
  wget -q https://ziglang.org/builds/zig-linux-x86_64-0.15.0-dev.208+8acedfd5b.tar.xz -O /tmp/zig.tar.xz

  echo -e "[zig] Unpacking zig..."
  mkdir -p /home/$(whoami)/zig
  tar -xf /tmp/zig.tar.xz -C /home/$(whoami)/zig
  rm /tmp/zig.tar.xz

  echo -e "[zig] Adding zig to PATH..."
  echo -e "#zig\nexport PATH=\"\$PATH:/home/$(whoami)/zig/zig-linux-x86_64-0.15.0-dev.208+8acedfd5b\"" >> ~/.zshrc

  echo -e "[zig] setting up lsp..."
  git clone https://github.com/zigtools/zls /home/$(whoami)/zig/lsp
  cd /home/$(whoami)/zig/lsp
  zig build -Doptimize=ReleaseSafe
  cd -

  echo -e "[zig] add zls to PATH..."
  echo -e "export PATH=\"\$PATH:/home/$(whoami)/zig/lsp/zig-out/bin\"" >> ~/.zshrc
	source ~/.zshrc

  # make sure to update neovim lsp config
  # require('lspconfig')['zls'].setup {
  # on_attach = on_attach,
  # capabilities = capabilities,
  # cmd = {
  #   "zls"
  # }
  # }


  echo -e "[zig] installed successfully."
} 
