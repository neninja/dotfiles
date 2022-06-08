local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager
    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
end)


local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
vim.g.mapleader = " "
map("n", "<Leader>f", ":Telescope find_files<CR>", opts)

local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
      file_ignore_patterns = { "^./.git/", "^./node_modules/", "^./vendor/" },
      mappings = {
          i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              ["<esc>"] = actions.close,
              ["<c-k>"] = actions.move_selection_previous,
              ["<c-j>"] = actions.move_selection_next,
              ["<c-h>"] = actions.file_split,
              ["<c-v>"] = actions.file_vsplit,
              ["<C-/>"] = "which_key"
          }
      }
  },
  pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
  },
  extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
  }
}
