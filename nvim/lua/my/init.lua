--# vimrc-pre
local pre_vimrc = "~/vimrc-pre.vim"
if vim.loop.fs_stat(pre_vimrc) then
  vim.cmd('source '..pre_vimrc)
end
--
vim.cmd('source '..DOTFILES_FULLPATH_NVIM..'vimrc')
vim.opt.shadafile = "NONE"

--# packages
vim.pack.add({'https://github.com/nvim-lua/plenary.nvim'})
vim.pack.add({'https://github.com/folke/neodev.nvim'})

require('my.pack.git')
require('my.pack.tree')
require('my.pack.telescope')
require('my.pack.luasnip')
require('my.pack.flash')
require('my.pack.cmp')
require('my.pack.mini')
require('my.pack.lsp')
require('my.pack.dailypong')

vim.pack.add({'https://github.com/elixir-editors/vim-elixir'})
