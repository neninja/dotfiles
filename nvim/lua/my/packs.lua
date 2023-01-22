-- vim: fdm=expr:fdt=FoldTextLua():foldexpr=FoldExprLua():

local fn = vim.fn
local install_path = fn.stdpath('data') .. '~/.config/nvim/pack/packer/start/packer.nvim'
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

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'editorconfig/editorconfig-vim'

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

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
    config = function() require('my.pack.lsp') end,
  }

  --[[use {
    'natebosch/vim-lsc',
    requires = {{'natebosch/vim-lsc-dart'}}
    config = function() require('my.pack.lsc') end,
  }
  --]]

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'saadparwaiz1/cmp_luasnip', -- Snippets source
      'L3MON4D3/LuaSnip', -- Snippet engine
    },
    config = function() require('my.pack.cmp') end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('my.pack.treesitter') end,
    tag = "v0.8.1", -- vive quebrando taloco
  }

  use {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup {
        -- Linters prefer comment and line to have a space in between markers
        marker_padding = true,
        -- should comment out empty or whitespace only lines
        comment_empty = false,
        -- trim empty comment whitespace
        comment_empty_trim_whitespace = true,
        -- Should key mappings be created
        create_mappings = true,
        -- Normal mode mapping left hand side
        line_mapping = 'gcc',
        -- Visual/Operator mapping left hand side
        operator_mapping = 'gc',
        -- text object mapping, comment chunk,,
        comment_chunk_text_object = 'ic',
        -- Hook function to call before commenting takes place
        hook = nil
      }
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'xiyaowong/telescope-emoji.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'gfeiyou/command-center.nvim' },
      { 'benfowler/telescope-luasnip.nvim' },
    },
    config = function() require('my.pack.telescope') end,
  }
end)
