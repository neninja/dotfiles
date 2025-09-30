vim.pack.add({'https://github.com/nvim-treesitter/nvim-treesitter'})

require("nvim-treesitter.install").update()
require("nvim-treesitter.configs").setup({
  -- To install additional languages, do: `:TSInstall <mylang>`. `:TSInstall maintained` to install all maintained
  ensure_installed = { "c", "vim", "query", "lua", "php", "dart", "markdown" },
  sync_install = true,
  highlight = {
    enable = true, -- This is a MUST
    additional_vim_regex_highlighting = { "lua", "php", "dart", "markdown" },
    -- additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false, -- Really breaks stuff if true
  },
})
local aucmd_dict = {
  FileType = {
    {
      pattern = "php",
      callback = function()
        vim.opt_local.foldenable=false
        vim.opt_local.foldmethod="expr"
        vim.opt_local.foldexpr="nvim_treesitter#foldexpr()"
      end,
    },
    {
      pattern = "lua",
      callback = function()
        vim.cmd([[TSBufEnable indent]])
      end,
    },
  }
}
for event, opt_tbls in pairs(aucmd_dict) do
  for _, opt_tbl in pairs(opt_tbls) do
    vim.api.nvim_create_autocmd(event, opt_tbl)
  end
end
