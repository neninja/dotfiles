-- vim: fdm=expr:fdt=FoldTextLua():foldexpr=FoldExprLua():
--# vimrc-pre
local pre_vimrc = "~/vimrc-pre.vim"
if vim.loop.fs_stat(pre_vimrc) then
  vim.cmd('source '..pre_vimrc)
end
--
vim.cmd('source '..DOTFILES_FULLPATH_NVIM..'vimrc')
vim.opt.shadafile = "NONE"
--
vim.pack.add({'https://github.com/nvim-lua/plenary.nvim'})
vim.pack.add({'https://github.com/folke/neodev.nvim'})

require('my.pack.git')
require('my.pack.tree')
vim.pack.add({'https://github.com/whiteinge/diffconflicts'})
require('my.pack.telescope')
require('my.pack.luasnip')
require('my.pack.flash')
require('my.pack.cmp')
require('my.pack.mini')
require('my.pack.treesitter')
require('my.pack.lsp')
require('my.pack.dailypong')

--
----# vimrc-pos
--local local_vimrc = "~/vimrc-local.vim"
--if vim.loop.fs_stat(local_vimrc) then
--  vim.cmd('source '..local_vimrc)
--end
--
--local proj_vimrc = vim.fn.getcwd()..'/.exvrc'
--if vim.loop.fs_stat(proj_vimrc) then
--  vim.cmd('source '..proj_vimrc)
--end
--
