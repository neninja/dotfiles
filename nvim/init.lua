-- THANKS http://lua-users.org/lists/lua-l/2020-01/msg00345.html
local fullpath = debug.getinfo(1,"S").source:sub(2)
fullpath = io.popen("realpath '"..fullpath.."'", 'r'):read('a'):gsub('[\n\r]*$','')
dotfiles_fullpath_nvim, _ = fullpath:match('^(.*/)([^/]-)$')
vim.cmd('set runtimepath+='..dotfiles_fullpath_nvim)

require('src-pre')
require('vimrc')
require('packs')
require('spells')
require('src-pos')

local function settab(tabsize)
  vim.opt.tabstop=2
  vim.opt.softtabstop=2
  vim.opt.shiftwidth=2
end

local aucmd_dict = {
  FileType = {
    {
      pattern = "lua,dart",
      callback = function()
        settab(2)
      end,
    },
    {
      pattern = "gitcommit",
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local function i(abbr, cb)
          vim.cmd("inoreabbrev <buffer> "..abbr.." "..cb)
        end
        i('b-', ':bug:')
        i('n-', ':new:')
        i('1-', ':100:')
        i('c-', ':cop:')
        i('s-', ':sos:')
        i('z-', ':zzz:')

        i('bn-', ':bug:(nvim)')
        i('nn-', ':new:(nvim)')
        i('1n-', ':100:(nvim)')
        i('sn-', ':sos:(nvim)')

        i('bg-', ':bug:(git)')
        i('ng-', ':new:(git)')
        i('1g-', ':100:(git)')

        i('bb-', ':bug:(bash)')
        i('nb-', ':new:(bash)')
        i('1b-', ':100:(bash)')

        vim.cmd("startinsert")
      end
    },
    {
      pattern = "markdown,txt,gitcommit",
      callback = function()
        vim.opt_local.spell=true
        vim.opt_local.iskeyword:append("-")
      end,
    },
    {
      pattern = "vim",
      callback = function()
        vim.opt_local.foldmethod = 'expr'
        vim.opt_local.foldexpr = 'FoldExprVim()'
        vim.opt_local.foldtext = 'FoldTextVim()'
      end,
    },
    {
      pattern = "markdown",
      callback = function()
        vim.opt_local.foldmethod = 'expr'
        vim.opt_local.foldexpr = 'FoldExprMarkdown()'
        vim.opt_local.foldtext = 'FoldTextMarkdown()'
      end,
    },
    {
      pattern = "php",
      callback = function()
        vim.opt_local.iskeyword:append("$")
      end,
    },
    {
      pattern = "help,lspinfo,qf,startuptime",
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.keymap.set("n", "q", [[<cmd>close<CR>]], { noremap=true, silent=true, buffer=buf })
      end,
    },
  },
}

for event, opt_tbls in pairs(aucmd_dict) do
  for _, opt_tbl in pairs(opt_tbls) do
    vim.api.nvim_create_autocmd(event, opt_tbl)
  end
end
