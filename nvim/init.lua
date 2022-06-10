-- THANKS http://lua-users.org/lists/lua-l/2020-01/msg00345.html
local fullpath = debug.getinfo(1,"S").source:sub(2)
fullpath = io.popen("realpath '"..fullpath.."'", 'r'):read('a'):gsub('[\n\r]*$','')
dotfiles_fullpath_nvim, _ = fullpath:match('^(.*/)([^/]-)$')
vim.cmd('set runtimepath+='..dotfiles_fullpath_nvim)

-- require('src-pre')
require('vimrc')
-- require('extra-opts')
-- require('extra-keys')
-- require('extra-aucmd')
-- require('theme')
-- require('skeletons')
-- require('spells')
-- require('dicts')
-- require('packer')
-- require('packs')
-- require('src-pos')