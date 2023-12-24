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
  ensure_installed = vim.tbl_keys(servers),
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
