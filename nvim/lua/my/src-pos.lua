local local_vimrc = "~/vimrc-local.vim"
if vim.loop.fs_stat(local_vimrc) then
  vim.cmd('source '..local_vimrc)
end

local proj_vimrc = vim.fn.getcwd()..'/.exvrc'
if vim.loop.fs_stat(proj_vimrc) then
  vim.cmd('source '..proj_vimrc)
end
