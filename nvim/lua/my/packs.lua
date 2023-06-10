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

  use {
    'vimwiki/vimwiki',
    config = function() require('my.pack.vimwiki') end,
  }

  use {
    'echasnovski/mini.nvim',
    config = function() require('my.pack.mini') end,
  }

  use 'justinmk/vim-sneak'

  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function() require('my.pack.copilot') end,
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
    '~/dev/nvim-packs/laravim'
  }

  use {
    'nenitf/cu.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('cu-nvim').setup({
        env = {
          api_token = vim.env.CLICKUP_API_TOKEN,
          user_id = vim.env.CLICKUP_USER_ID,
          default_workspace = vim.env.CLICKUP_WORKSPACE_ID,
          default_space = vim.env.CLICKUP_SPACE_ID,
        }
      })
    end,
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
    run = ':TSUpdate',
    config = function() require('my.pack.treesitter') end,
    tag = "v0.9.0", -- vive quebrando taloco
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = "0.1.1", -- attempt to call get_lang on null na preview
    requires = {
      { 'stevearc/aerial.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'xiyaowong/telescope-emoji.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'gfeiyou/command-center.nvim' },
      { 'benfowler/telescope-luasnip.nvim' },
    },
    config = function() require('my.pack.telescope') end,
  }
end)

require 'laravim'.setup()
