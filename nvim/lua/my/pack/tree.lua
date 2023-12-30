vim.keymap.set("n", "<leader><cr>", [[<cmd>NvimTreeFindFileToggle<CR>]], { noremap=true, silent=true })

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 0,
  files = 0,
  folder_arrows = 0,
}

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    float = {
      enable = false,
    },
  },
  renderer = {
    icons = {
      git_placement = "before",
      modified_placement = "after",
      padding = " ",
      symlink_arrow = "",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
        modified = true,
      },
      glyphs = { -- :h digraph-table
        default = "",
        symlink = "",
        modified = "",
        folder = {
          default = "",
          open = "",
          -- default = "▸",
          -- open = "▾",

          arrow_closed = "",
          arrow_open = "",

          empty = "",
          empty_open = "",

          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
  filters = {
    dotfiles = false,
  },
})
