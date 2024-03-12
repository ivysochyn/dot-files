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
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- LSP-zero plugin
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.api.nvim_command, 'MasonUpdate')
            end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    -- Markdown previewer
    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
    }

    -- Nvim Linter
    use 'mfussenegger/nvim-lint'

    -- Copilot
    use 'github/copilot.vim'
end)
