local env = require("my.env")
-- De clutter the editor by only showing diagnostic messages when the cursor is over the error
vim.diagnostic.config({
  virtual_text = true, -- Do not show the text in front of the error
  float = {
    border = 'rounded',
  },
})

local default_servers = {
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

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      settings = servers[server_name],
    }
  end,
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
