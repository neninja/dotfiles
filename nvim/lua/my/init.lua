-- vim: fdm=expr:fdt=FoldTextLua():foldexpr=FoldExprLua():
require('my.src-pre')
require("my.env")
require('my.vimrc')
require('my.packs')
require('my.spells')
require('my.src-pos')
--# auto cmd
local function settab(tabsize)
  vim.bo.tabstop=tabsize
  vim.bo.softtabstop=tabsize
  vim.bo.shiftwidth=tabsize
end

local aucmd_dict = {
  FileType = {
    {
      pattern = "lua,dart,rust,javascript,javascriptreact,typescript,typescriptreact",
      callback = function()
        settab(2)
      end,
    },
    {
      pattern = "html,javascriptreact,typescriptreact",
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
      callback = function(opts)
        vim.keymap.set("n", "q", [[<cmd>close<CR>]], { noremap=true, silent=true, buffer=opts.buf })
      end,
    },
  },
}

for event, opt_tbls in pairs(aucmd_dict) do
  for _, opt_tbl in pairs(opt_tbls) do
    vim.api.nvim_create_autocmd(event, opt_tbl)
  end
end

vim.opt.exrc = true

local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

-- Diagnostic keymaps
nmap('[d', vim.diagnostic.goto_prev, "Goto prev diagnostic")
nmap(']d', vim.diagnostic.goto_next, "Goto next diagnostic")
nmap('<leader>ee', vim.diagnostic.open_float, "Show diagnostic on float")
nmap('<leader>eq', vim.diagnostic.setloclist, "Show diagnostic on loclist")

nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
nmap('<leader>gs', require('telescope.builtin').lsp_document_symbols, '[G]o to document [S]ymbols')

-- See `:help K` for why this keymap
nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

nmap('<leader>=', function()
  if vim.lsp.buf.format then
    vim.lsp.buf.format()
  elseif vim.lsp.buf.formatting then
    vim.lsp.buf.formatting()
  end
end, 'Format current buffer with LSP')
