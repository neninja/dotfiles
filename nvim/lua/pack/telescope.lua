local map = vim.keymap.set

map('n', '<leader>f', [[:Telescope find_files<CR>]], {noremap = true})
map('n', '<leader>b', [[:Telescope buffers<CR>]], {noremap = true})
map('n', '<leader>m', [[:Telescope oldfiles<CR>]], {noremap = true})
map('n', '<leader>xx', [[:Telescope diagnostics<CR>]], {noremap = true})
map('n', '<c-f>', [[:Telescope live_grep<CR>]], {})
map('n', '<leader><cr>', [[:Telescope file_browser<CR>]], {})
map('n', '<leader>e', [[:Telescope emoji<CR>]], {})
map('n', '<leader>n', [[:Telescope command_palette<CR>]], {})
map('n', '<leader><tab>', [[:Telescope luasnip<CR>]], {})

local actions = require("telescope.actions")
local fb_actions = require "telescope".extensions.file_browser.actions
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "^./.git/", "^./node_modules/", "^./vendor/", "tags" },
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
    file_browser = {
      mappings = {
        ["i"] = {
          ["<c-y>"] = fb_actions.create_from_prompt,
        },
      },
    },
    command_palette = {
      {
        "File",
        { "file browser (leader-cr)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
        { "search word (c-f)", ":lua require('telescope.builtin').live_grep()", 1 },
        { "files (leader-f)",     ":lua require('telescope.builtin').find_files()", 1 },
        { "buffers (leader-b)", ":Telescope buffers" },
      },
      {
        "Coding",
        { "LSP errors", ":Trouble document_diagnostic" }
      },
      {
        "Help",
        { "tips", ":help tips" },
        { "cheatsheet", ":help index" },
        { "summary", ":help summary" },
        { "quick reference", ":help quickref" },
        { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
      },
      {
        "Vim",
        { "reload vimrc", ":Sov" },
        { 'check health', ":checkhealth" },
        { "commands", ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "vim options", ":lua require('telescope.builtin').vim_options()" },
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
        { 'cursor line', ':set cursorline!' },
        { 'cursor column', ':set cursorcolumn!' },
        { "spell checker", ':set spell!' },
      },
      {
        "NN",
        { ":pwd to git dir", ":call NN_SetGitDir()" },
        { "generate tags (ctags)", ":call NN_ctags()" },
        { "commit aula", ":call NN_GitAula()" },
      }
    }
  }
}
require("telescope").load_extension "emoji"
require("telescope").load_extension "file_browser"
require("telescope").load_extension "file_browser"
require("telescope").load_extension "luasnip"
require("telescope").load_extension "command_palette"

require("telescope-emoji").setup({
  action = function(emoji)
    vim.fn.setreg("+", emoji.value)
  end,
})
