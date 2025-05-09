-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'christoomey/vim-tmux-navigator', lazy=false }

  use 'folke/tokyonight.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "nvim-telescope/telescope-file-browser.nvim"

  use {
    'nvim-lualine/lualine.nvim'
  }

  use {
    'kyazdani42/nvim-tree.lua'
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use 'nvim-treesitter/playground'

  use {"akinsho/toggleterm.nvim", tag = '*'}

  use { "folke/trouble.nvim", requires = {"kyazdani42/nvim-web-devicons"}}
 
  use({
    "iamcco/markdown-preview.nvim",
    -- run = function() vim.fn["mkdp#util#install"]() end,
  })
  
  use {
    'stevearc/oil.nvim',
    config = function() require('oil').setup() end
  }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- use {
  --   'prettier/vim-prettier',
  --   run = 'npm install --frozen-lockfile --production'
  -- }

  use 'github/copilot.vim'

  use 'ThePrimeagen/harpoon'
  use 'windwp/nvim-autopairs'

  use 'nvim-tree/nvim-web-devicons'
--
  -- method signature preview
  use 'Issafalcon/lsp-overloads.nvim'

  -- debugging
  -- use 'mfussenegger/nvim-dap'
  -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  
  use 'numToStr/comment.nvim'
end)
