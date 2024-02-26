-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-telescope/telescope-ui-select.nvim'},
      }
    }

    -- use({ 'rose-pine/neovim', as = 'rose-pine' })
    -- vim.cmd('colorscheme rose-pine')

    use({ 'sainnhe/everforest', as = 'everforest' })
    vim.cmd.set('background=dark')
    vim.cmd('let g:everforest_background = "medium"')
    vim.cmd('let g:everforest_better_performance = 1')
    vim.cmd.colorscheme('everforest')


    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('m4xshen/autoclose.nvim')
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- TODO - delete
    use {
        'jakemason/ouroboros',
        requires = { {'nvim-lua/plenary.nvim'} }
        }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
              -- LSP Support
              {'neovim/nvim-lspconfig'},             -- Required
              {                                      -- Optional
                  'williamboman/mason.nvim',
                  run = function()
                      pcall(vim.cmd, 'MasonUpdate')
                  end,
              },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp',},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'L3MON4D3/LuaSnip'},
        }
    }


end)

