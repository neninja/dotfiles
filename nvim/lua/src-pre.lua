local pre_vimrc = "~/vimrc-pre.vim"
if vim.loop.fs_stat(pre_vimrc) then
  vim.cmd('source '..pre_vimrc)
end
