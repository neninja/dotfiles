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
          },
          char = {
            enabled = false
          }
        }
      })
    end,
  }

  -- use {
  --   "zbirenbaum/copilot.lua",
  --   -- por algum motivo é necessário somente na inicialização/auth do windows
  --   event = "InsertEnter",
  --   requires = {
  --     'github/copilot.vim',
  --   },
  --   cmd = "Copilot",
  --   config = function() require('my.pack.copilot') end,
  -- }

  -- use {
  --   'CopilotC-Nvim/CopilotChat.nvim',
  --   branch = 'main',
  --   config = function()
  --     require("CopilotChat").setup {
  --       debug = true,
  --     }
  --   end,
  -- }

  use {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gg', [[:G<CR>]], {})
    end,
  }

  use {
    'nvim-tree/nvim-tree.lua',
    config = function() require('my.pack.tree') end,
  }

  use {
    'mfussenegger/nvim-dap',
    event = 'BufRead',
    config = function() require('my.pack.dap') end,
  }

  use { 'whiteinge/diffconflicts',
    cmd = 'DiffConflicts' -- Carregar sob o comando
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
    'neninja/nvim-dailypong',
    config = function() require('dailypong').setup() end,
  }

  use {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    requires = {
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'L3MON4D3/LuaSnip', after = 'nvim-cmp' },
    },
    config = function() require('my.pack.cmp') end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    -- tag = "0.1.1", -- attempt to call get_lang on null na preview
    event = 'VimEnter',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'xiyaowong/telescope-emoji.nvim' },
      { 'debugloop/telescope-undo.nvim' },
      { 'FeiyouG/commander.nvim' },

      {
        'stevearc/aerial.nvim',
        -- commit = '228fad11393322537d9662c0347f75549a3d6c0a'
      },
    },
    config = function() require('my.pack.telescope') end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('my.pack.treesitter') end,
    -- commit = '3de418e73d5b912096229aaeea8bb7aef5094e0d',
  }
end)
