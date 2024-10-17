-- vim: fdm=expr:fdt=FoldTextLua():foldexpr=FoldExprLua():
--# vimrc-pre
local pre_vimrc = "~/vimrc-pre.vim"
if vim.loop.fs_stat(pre_vimrc) then
  vim.cmd('source '..pre_vimrc)
end

--# vimrc
vim.cmd('source '..DOTFILES_FULLPATH_NVIM..'vimrc')

--# plugins
require('my.packs')

--# vimrc-pos
local local_vimrc = "~/vimrc-local.vim"
if vim.loop.fs_stat(local_vimrc) then
  vim.cmd('source '..local_vimrc)
end

local proj_vimrc = vim.fn.getcwd()..'/.exvrc'
if vim.loop.fs_stat(proj_vimrc) then
  vim.cmd('source '..proj_vimrc)
end
