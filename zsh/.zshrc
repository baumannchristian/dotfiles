# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git tmux zsh-autosuggestions zsh-syntax-highlighting)

# tmux
# ZSH_TMUX_AUTOSTART=true

# initialize zsh
export ZSH=/home/christian/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

eval "$(/usr/bin/zoxide init zsh)"

export PATH="$PATH:~/.npm-global/lib:/home/christian/.npm-global/lib/node_modules"

# aliases 
alias n="export NVIM_APPNAME=nvim;export MYVIMRC=~/.config/nvim/init.lua;nvim"
# alias vi='nvim'
# alias vim='nvim'
alias nlazy="export NVIM_APPNAME=nvim-lazy;export MYVIMRC=~/.config/nvim-lazy/init.lua;nvim"
alias nconf="cd ~/.config/nvim && nvim"
alias ll="ls -la"
alias dotfiles="cd ~/source/dotfiles && nvim"

# git
function lazy_gitpush(){ git add .; git commit -m"$*"; git push }
alias ccp=lazy_gitpush

# zig
export PATH="$PATH:/home/christian/zig"
alias zr="zig run"
alias ziglings="cd ~/source/repos/zig/exercises/exercises && n"
export PATH="$PATH:/home/christian/zig/zig-linux-x86_64-0.15.0-dev.208+8acedfd5b"
export PATH="$PATH:/home/christian/zig/lsp/zig-out/bin"

# go
export PATH="$PATH:/usr/local/go/bin"
export PATH=$PATH:/home/christian/go/bin

# dotnet
export DOTNET_ROOT=/usr/local/bin/dotnet
export PATH="$PATH:/home/christian/.dotnet/tools"
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:DOTNET_ROOT

# python
export PATH="$PATH:/usr/local/lib/python3.11"
alias python='python3'
export PATH="$PATH:/usr/local/bin/node/node-v18.13.0-linux-x64/bin/node"
export PATH="$PATH:/home/christian/.local/bin"

# rust
export PATH="$HOME/.cargo/env:$HOME/.cargo/bin:$PATH"

# o
priv=~/.private/env.sh && [ -f $priv ] && [ -x $priv ] && . $priv 
