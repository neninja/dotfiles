require('my.src-pre')
require('my.vimrc')
require('my.packs')
require('my.spells')
require('my.src-pos')

local function settab(tabsize)
  vim.bo.tabstop=tabsize
  vim.bo.softtabstop=tabsize
  vim.bo.shiftwidth=tabsize
end

vim.cmd 'colorscheme calmo'

local aucmd_dict = {
  FileType = {
    {
      pattern = "lua,dart,rust,javascript,javascriptreact,typescript,typescriptreact",
      callback = function()
        settab(2)
      end,
    },
    {
      pattern = "javascriptreact,typescriptreact",
      callback = function()
        local function i(trig, cb)
          vim.cmd("inoremap <buffer> "..trig.." "..cb)
        end
        i('<c-d>', '<esc>"tyiwi<<esc>ea></<esc>"tpa><esc>cit')
        i('<c-d><c-s>', '<esc>bi<<esc>ea /><esc>hi')
        i('<c-d><c-d>', '<esc>"tyiwi<<esc>ea></<esc>"tpa><esc>cit<cr><esc>O')
      end,
    },
    {
      pattern = "gitcommit",
      callback = function()
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

        i('ba-', ':bug:(awm)')
        i('na-', ':new:(awm)')
        i('1a-', ':100:(awm)')
        i('sa-', ':sos:(awm)')

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
