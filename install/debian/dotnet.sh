#!/bin/bash

set -euo pipefail

function up() {
  echo -e "Install dotnet"

  dotnet8="https://download.visualstudio.microsoft.com/download/pr/ca6cd525-677e-4d3a-b66c-11348a6f920a/ec395f498f89d0ca4d67d903892af82d/dotnet-sdk-8.0.403-linux-x64.tar.gz"

  echo -e "Downloading dotnet sdk..."
	wget -q $dotnet8
  echo -e "Unpacking dotnet sdk..."
	sudo mkdir -p /usr/local/bin/dotnet && sudo tar zxf dotnet-sdk-8.0.403-linux-x64.tar.gz -C /usr/local/bin/dotnet/
	sudo ln -s /usr/local/bin/dotnet/dotnet /usr/bin/dotnet

	# omnisharp
	sudo mkdir -p /usr/local/bin/omnisharp-roslyn
  echo -e "Downloading omnisharp..."
	sudo wget -q https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.14/omnisharp-linux-x64-net6.0.tar.gz
  echo -e "Unpacking omnisharp..."
	sudo tar zxf omnisharp-linux-x64-net6.0.tar.gz -C /usr/local/bin/omnisharp-roslyn/ 
	sudo chmod 700 /usr/local/bin/omnisharp-roslyn/
  sudo chown -R christian:christian /usr/local/bin/omnisharp-roslyn/
  
  rm ./dotnet-sdk-8.0.403-linux-x64.tar.gz
  rm ./omnisharp-linux-x64-net6.0.tar.gz

  # make sure to add lsp config to nvim lsp.lua
    # local pid = vim.fn.getpid()
    # local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"
    #
    # require('lspconfig')['omnisharp'].setup {
    #   cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    #   on_attach = on_attach,
    #   capabilities = capabilities,
    #   -- organize_imports_on_format = true,
    #   -- enable_import_completion = true,
    #   -- enable_roslyn_analyzers = true,
    # }

  echo -e "dotnet successfully installed!"
} 

