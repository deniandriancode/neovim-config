-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'doums/darcula'

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use "akinsho/toggleterm.nvim"

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "folke/which-key.nvim"

  use "mattn/emmet-vim"

  use "nvim-treesitter/nvim-treesitter"

  use "numToStr/Comment.nvim"

  use "navarasu/onedark.nvim"

  use'othree/html5.vim'
  use 'pangloss/vim-javascript'
  use "evanleck/vim-svelte"
end)
