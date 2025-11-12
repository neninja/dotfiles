vim.pack.add({'https://github.com/neovim/nvim-lspconfig'})
vim.pack.add({'https://github.com/folke/neodev.nvim'})
vim.pack.add({'https://github.com/mason-org/mason.nvim'})
vim.pack.add({'https://github.com/mason-org/mason-lspconfig.nvim'})
vim.pack.add({'https://github.com/folke/neodev.nvim'})
vim.pack.add({'https://github.com/hrsh7th/cmp-nvim-lsp'})

-- vim.pack.add({'https://github.com/nvim-java/nvim-java-core'})
-- vim.pack.add({'https://github.com/nvim-java/nvim-java'})

local env = require("my.env")

-- Protege requires de plugins
local ok_neodev, neodev = pcall(require, "neodev")
if ok_neodev then neodev.setup() end

local ok_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok_cmp_nvim_lsp then
  vim.notify("cmp_nvim_lsp não encontrado", vim.log.levels.ERROR)
  return
end

local ok_mason, mason = pcall(require, "mason")
if ok_mason then mason.setup() end

local ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok_mason_lspconfig then
  vim.notify("mason-lspconfig não encontrado", vim.log.levels.ERROR)
  return
end

local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
if not ok_lspconfig then
  vim.notify("lspconfig não encontrado", vim.log.levels.ERROR)
  return
end

-- Agora o resto do seu código...
-- [restante do lsp.lua]

local env = require("my.env")
-- De clutter the editor by only showing diagnostic messages when the cursor is over the error
vim.diagnostic.config({
  virtual_text = true, -- Do not show the text in front of the error
  float = {
    border = 'rounded',
  },
})

local default_servers = {
  jdtls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

local servers = vim.tbl_deep_extend("force", default_servers, env.lsp.ensure_servers)

-- Setup neovim lua configuration
require('neodev').setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument = {
  completion = {
    completionItem = {
      snippetSupport = false -- snippets cansados
    }
  }
}

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_filter(function(server)
  return server ~= 'tsserver'
end, vim.tbl_keys(servers)),
}

local lspconfig = require('lspconfig')

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

-- ## Aucmd
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function()
    vim.lsp.buf.format()

    -- organize imports
    -- THANKS: https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-1130373799
    local encoding = vim.lsp.util._get_offset_encoding(vim.api.nvim_get_current_buf())
    local params = vim.lsp.util.make_range_params(nil, encoding)
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, encoding)
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end,
})

-- ## Keymaps
local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

nmap('[d', vim.diagnostic.goto_prev, "Goto prev diagnostic")
nmap(']d', vim.diagnostic.goto_next, "Goto next diagnostic")
nmap('<leader>ee', vim.diagnostic.open_float, "Show diagnostic on float")
nmap('<leader>eq', vim.diagnostic.setloclist, "Show diagnostic on loclist")

nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
nmap('gs', ":split | lua vim.lsp.buf.definition()<CR>", '[G]oto Definition [S]plited')
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
