-- vim: fdm=expr:fdt=FoldTextLua():foldexpr=FoldExprLua():
--# Packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  print('Installing packer close and reopen Neovim...')
end

-- Use a protected require call (pcall) so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Show packer messages in a popup. Looks cooler
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

--# Packages
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'jwalton512/vim-blade'

  use {
    'echasnovski/mini.nvim',
    config = function() require('my.pack.mini') end,
  }

  use {
    'folke/flash.nvim',
    config = function()
      vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require("flash").jump() end, { desc = "Flash [s]earch" })
      require("flash").setup({
        modes = {
          search = {
            enabled = false
          }
        }
      })
    end,
  }

  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function() require('my.pack.copilot') end,
  }

  use {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    config = function()
      require("CopilotChat").setup {
        debug = true,
      }
    end,
  }

  use {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gg', [[:G<CR>]], {})
    end,
  }

  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly',
    config = function() require('my.pack.tree') end,
  }

  use {
    'mfussenegger/nvim-dap',
    config = function() require('my.pack.dap') end,
  }

  use "whiteinge/diffconflicts"

  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
    config = function() require('my.pack.lsp') end,
  }

  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function() require('my.fluttertools') end,
  }

  use {
    'neninja/laravim',
    config = function() require 'laravim'.setup() end,
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    },
    config = function() require('my.pack.cmp') end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('my.pack.treesitter') end,
    -- tag = "v0.9.0", -- vive quebrando taloco
  }

  use {
    'nvim-telescope/telescope.nvim',
    -- tag = "0.1.1", -- attempt to call get_lang on null na preview
    requires = {
      { 'stevearc/aerial.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'xiyaowong/telescope-emoji.nvim' },
      { 'FeiyouG/commander.nvim' },
    },
    config = function() require('my.pack.telescope') end,
  }
end)
