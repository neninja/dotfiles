-- THANKS http://lua-users.org/lists/lua-l/2020-01/msg00345.html
local fullpath = debug.getinfo(1,"S").source:sub(2)
fullpath = io.popen("realpath '"..fullpath.."'", 'r'):read('*all'):gsub('[\n\r]*$','')
DOTFILES_FULLPATH_NVIM, _ = fullpath:match('^(.*/)([^/]-)$')
vim.cmd('set runtimepath+='..DOTFILES_FULLPATH_NVIM)

require('my.init')
