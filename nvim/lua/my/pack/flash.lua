vim.pack.add({'https://github.com/folke/flash.nvim'})

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
