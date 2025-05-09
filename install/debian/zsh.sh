#!/bin/bash

set -euo pipefail

function up() {
  echo -e "zsh up..."

  sudo apt install zsh zoxide -y

	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	chsh -s $(which zsh)

	git clone https://github.com/zsh-users/zsh-autosuggestions .oh-my-zsh/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting .oh-my-zsh/plugins/zsh-syntax-highlighting

	source ~/.zshrc
} 
