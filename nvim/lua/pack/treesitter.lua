require("nvim-treesitter.configs").setup({
  -- To install additional languages, do: `:TSInstall <mylang>`. `:TSInstall maintained` to install all maintained
  ensure_installed = { "lua", "php", "dart", "markdown" },
  sync_install = true,
  highlight = {
    enable = true, -- This is a MUST
    additional_vim_regex_highlighting = { "lua", "php", "dart", "markdown" },
    -- additional_vim_regex_highlighting = false,
  },
  indent = {
    -- enable = false, -- Really breaks stuff if true
    enable = true
  },
  -- incremental_selection = {
  -- enable = true,
  -- keymaps = {
  -- init_selection = "gnn",
  -- node_incremental = "grn",
  -- scope_incremental = "grc",
  -- node_decremental = "grm",
  -- },
  -- },
})

vim.cmd([[
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]])
