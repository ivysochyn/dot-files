-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder plugin
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Treesitter plugin for syntax highlighting
  use({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})
end)
