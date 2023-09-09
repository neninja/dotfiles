-- vim: fdm=expr:fdt=FoldTextLua():foldexpr=FoldExprLua():
--# Setup Telescope
local actions = require("telescope.actions")
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
  }
}

-- https://github.com/tmhedberg/SimpylFold/issues/130#issuecomment-1074049490
-- Ao abrir um buffer cujo deveria conter folds fechados,
-- o telescope ignora-os e na primeira modificação são acionados
vim.api.nvim_create_autocmd('BufRead', {
   callback = function()
      vim.api.nvim_create_autocmd('BufWinEnter', {
         once = true,
         command = 'normal! zxzR' -- zM para fechar todos folds
      })
   end
})
--# Mapeamentos
local map = vim.keymap.set
local silent_noremap = {noremap = true, silent = true}

map('n', '<leader>n', [[:Telescope commander<CR>]], silent_noremap)
--# Extensões
--## Commander
local commander = require("commander")
commander.setup({
      components = {
        "DESC",
        "KEYS",
        "CAT",
      },
      sort_by = {
        "DESC",
        "KEYS",
        "CAT",
        "CMD"
      },
      integration = {
        telescope = {
          enable = false,
        },
      }
    })
commander.add({
  {
    desc = ":pwd to git dir",
    cmd = ":call NN_SetGitDir()<CR>",
    cat = "git",
  },
  {
    desc = "commit aula `vim README.md -c \"call NN_GitAula()\"`",
    cmd = ":call NN_GitAula()<CR>",
    cat = "git",
  },
  {
    desc = "generate tags (ctags)",
    cmd = ":call NN_ctags()<CR>",
    cat = "ctags",
  },
  {
    desc = "Search for a buffer",
    cmd = ":Telescope buffers<CR>",
    keys = {"n", "<leader>b", silent_noremap},
    cat = "telescope",
  },
  {
    desc = "Search for symbols with Aerial",
    cmd = ":Telescope aerial<CR>",
    keys = {"n", "<leader>a", silent_noremap},
    cat = "telescope",
  },
  {
    desc = "Toggle symbols showing with Aerial",
    cmd = ":AerialToggle<CR>",
    cat = "aerial",
  },
  {
    desc = "Search inside current buffer",
    cmd = ":Telescope current_buffer_fuzzy_find<CR>",
    cat = "telescope",
  },
  {
    desc = "Search for a file inside project (:pwd)",
    cmd = function()
      require("telescope.builtin").find_files({
        hidden = true,
        cwd = vim.fn.getcwd(),
      })
    end,
    keys = {"n", "<leader>f", silent_noremap},
    cat = "telescope",
  },
  {
    desc = "Search for a file inside project (:pwd) with hidden files",
    cmd = ":Telescope find_files hidden=true<CR>",
    cat = "telescope",
  },
  {
    desc = "Find recent files (MRU)",
    cmd = ":Telescope oldfiles<CR>",
    keys = {"n", "<leader>m", silent_noremap},
    cat = "telescope",
  },
  {
    desc = "Find word inside :pwd",
    cmd = ":Telescope live_grep<CR>",
    keys = {"n", "<c-f>", silent_noremap},
    cat = "telescope",
  },
  {
    desc = "Find a helptag",
    cmd = ":Telescope help_tags<CR>",
    keys = {"n", "<leader>h", silent_noremap},
    cat = "telescope",
  },
  {
    desc = "Find a man page",
    cmd = ":Telescope man_pages<CR>",
    cat = "telescope",
  },
  {
    desc = "Find a emoji",
    cmd = ":Telescope emoji<CR>",
    cat = "telescope",
    keys = {"n", "<leader>em", silent_noremap},
  },
  {
    desc = "Find a snippet",
    cmd = ":Telescope luasnip<CR>",
    keys = {"n", "<leader><tab>", silent_noremap},
    cat = "telescope",
  },
  {
    desc = "Find a highlight",
    cmd = ":Telescope highlights<CR>",
    cat = "telescope",
  },
  {
    desc = "Find a command",
    cmd = ":Telescope commands<CR>",
    cat = "telescope",
  },
  {
    desc = "Show vim tips",
    cmd = ":h tips<CR>",
    cat = "nvim",
  },
  {
    desc = "Show vim cheatsheet",
    cmd = ":h index<CR>",
    cat = "nvim",
  },
  {
    desc = "Check health",
    cmd = ":checkhealth<CR>",
    cat = "nvim",
  },
  {
    desc = "Toggle relativenumber",
    cmd = function()
      if(vim.o.relativenumber) then
        vim.o.relativenumber = false
      else
        vim.o.relativenumber = true
      end
    end,
    cat = "nvim",
  },
  {
    desc = "Toggle cursorline",
    cmd = function()
      if(vim.o.cursorline) then
        vim.o.cursorline = false
      else
        vim.o.cursorline = true
      end
    end,
    cat = "nvim",
  },
  {
    desc = "Toggle colorcolumn",
    cmd = function()
      if(vim.o.colorcolumn == '81') then
        vim.o.colorcolumn = ''
      else
        vim.o.colorcolumn = '81'
      end
    end,
    cat = "nvim",
  },
  {
    desc = "Vim keymaps",
    cmd = ":lua require('telescope.builtin').keymaps()<CR>",
    cat = "nvim",
  },
  {
    desc = "Vim options",
    cmd = ":lua require('telescope.builtin').vim_options()<CR>",
    cat = "nvim",
  },
  {
    desc = "Toggle dark/light colorscheme",
    cmd = function()
      if(vim.o.background == 'dark') then
        vim.o.background = 'light'
      else
        vim.o.background = 'dark'
      end
    end,
    cat = "nvim",
  },
  {
    desc = "Update packages",
    cmd = ":PackerSync<CR>",
    cat = "packages",
  },
  {
    desc = "Search for TODO|FIXME",
    cmd = ":call NN_Tasks()<CR>",
    cat = "todo",
  },
  {
    desc = "Update vimwiki index",
    cmd = ":VimwikiRebuildTags<CR>:VimwikiGenerateTagLinks TODO backlog STARTED XXX<CR>",
    cat = "vimki",
  },

})
--# Carregamento de extensões
require("telescope").load_extension "emoji"
require("telescope").load_extension "luasnip"
require("telescope").load_extension "commander"
require('telescope').load_extension "aerial"
