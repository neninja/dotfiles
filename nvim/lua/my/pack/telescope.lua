local map = vim.keymap.set
local silent_noremap = {noremap = true, silent = true}

map('n', '<leader>n', [[:Telescope command_center<CR>]], silent_noremap)

local actions = require("telescope.actions")
local fb_actions = require "telescope".extensions.file_browser.actions
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "^.git",
      "^android", "^linux", "^ios", "^macos", "^windows", "^build", -- flutter
      "^node_modules",
      "^vendor",
      "^tags",
    },
    mappings = {
      i = {
        ["<c-up>"] = actions.cycle_history_prev,
        ["<c-down>"] = actions.cycle_history_next,
        ["<esc>"] = actions.close,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-h>"] = actions.file_split,
        ["<c-v>"] = actions.file_vsplit,
        ["<C-/>"] = "which_key"
      }
    }
  },
  pickers = {},
  extensions = {
    emoji = {
      action = function(emoji)
        vim.fn.setreg("+", emoji.value)
      end,
    },
    file_browser = {
      mappings = {
        ["i"] = {
          ["<c-y>"] = fb_actions.create_from_prompt,
        },
      },
    },
  }
}

require("command_center").add({
  {
    description = ":pwd to git dir",
    cmd = ":call NN_SetGitDir()<CR>",
    category = "git",
  },
  {
    description = "commit aula `vim README.md -c \"call NN_GitAula()\"`",
    cmd = ":call NN_GitAula()<CR>",
    category = "git",
  },
  {
    description = "generate tags (ctags)",
    cmd = ":call NN_ctags()<CR>",
    category = "ctags",
  },
  {
    description = "Search for a buffer",
    cmd = ":Telescope buffers<CR>",
    keybindings = {"n", "<leader>b", silent_noremap},
    category = "telescope",
  },
  {
    description = "Search inside current buffer",
    cmd = ":Telescope current_buffer_fuzzy_find<CR>",
    category = "telescope",
  },
  {
    description = "Search for a file inside project (:pwd)",
    cmd = ":Telescope find_files<CR>",
    keybindings = {"n", "<leader>f", silent_noremap},
    category = "telescope",
  },
  {
    description = "Search for a file inside project (:pwd) with hidden files",
    cmd = ":Telescope find_files hidden=true<CR>",
    category = "telescope",
  },
  {
    description = "Find recent files (MRU)",
    cmd = ":Telescope oldfiles<CR>",
    keybindings = {"n", "<leader>m", silent_noremap},
    category = "telescope",
  },
  {
    description = "Find word inside :pwd",
    cmd = ":Telescope live_grep<CR>",
    keybindings = {"n", "<c-f>", silent_noremap},
    category = "telescope",
  },
  {
    description = "Find a helptag",
    cmd = ":Telescope help_tags<CR>",
    category = "telescope",
  },
  {
    description = "Find a man page",
    cmd = ":Telescope man_pages<CR>",
    category = "telescope",
  },
  {
    description = "File browser",
    cmd = ":Telescope file_browser<CR>",
    keybindings = {"n", "<leader><cr>", silent_noremap},
    category = "telescope",
  },
  {
    description = "Find a emoji",
    cmd = ":Telescope emoji<CR>",
    category = "telescope",
    keybindings = {"n", "<leader>e", silent_noremap},
  },
  {
    description = "Find a snippet",
    cmd = ":Telescope luasnip<CR>",
    keybindings = {"n", "<leader><tab>", silent_noremap},
    category = "telescope",
  },
  {
    description = "Find a highlight",
    cmd = ":Telescope highlights<CR>",
    category = "telescope",
  },
  {
    description = "Find a command",
    cmd = ":Telescope commands<CR>",
    category = "telescope",
  },
  {
    description = "Show vim tips",
    cmd = ":h tips<CR>",
    category = "nvim",
  },
  {
    description = "Show vim cheatsheet",
    cmd = ":h index<CR>",
    category = "nvim",
  },
  {
    description = "Reload vimrc",
    cmd = ":Sov<CR>",
    category = "nvim",
  },
  {
    description = "Check health",
    cmd = ":checkhealth<CR>",
    category = "nvim",
  },
  {
    description = "Toggle cursorline",
    cmd = function()
      if(vim.o.cursorline) then
        vim.o.cursorline = false
      else
        vim.o.cursorline = true
      end
    end,
    category = "nvim",
  },
  {
    description = "Toggle colorcolumn",
    cmd = function()
      if(vim.o.colorcolumn == '81') then
        vim.o.colorcolumn = ''
      else
        vim.o.colorcolumn = '81'
      end
    end,
    category = "nvim",
  },
  {
    description = "Vim keymaps",
    cmd = ":lua require('telescope.builtin').keymaps()<CR>",
    category = "nvim",
  },
  {
    description = "Vim options",
    cmd = ":lua require('telescope.builtin').vim_options()<CR>",
    category = "nvim",
  },
  {
    description = "Toggle dark/light colorscheme",
    cmd = function()
      if(vim.o.background == 'dark') then
        vim.o.background = 'light'
      else
        vim.o.background = 'dark'
      end
    end,
    category = "nvim",
  },
  {
    description = "Check lsp diagnostic",
    cmd = ":TroubleToggle document_diagnostics<CR>",
    keybindings = {"n", "<leader>xx", silent_noremap},
    category = "lsp",
  },
  {
    description = "Update packages",
    cmd = ":PackerSync<CR>",
    category = "packages",
  },
})

require("telescope").load_extension "emoji"
require("telescope").load_extension "file_browser"
require("telescope").load_extension "luasnip"
require("telescope").load_extension "command_center"
