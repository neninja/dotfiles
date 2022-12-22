require('fidget').setup()

-- De clutter the editor by only showing diagnostic messages when the cursor is over the error
vim.diagnostic.config({
  virtual_text = true, -- Do not show the text in front of the error
  float = {
    border = 'rounded',
  },
})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Goto prev diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
vim.keymap.set('n', '<leader>ee', vim.diagnostic.open_float, { desc = "Show diagnostic on float" })
vim.keymap.set('n', '<leader>eq', vim.diagnostic.setloclist, { desc = "Show diagnostic on loclist" })

local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>gs', require('telescope.builtin').lsp_document_symbols, '[G]o to document [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  nmap('<leader>=', function()
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, 'Format current buffer with LSP')
end

local servers = {
  intelephense = {},
  phpactor = {
    init_options = {
      ["class_to_file.project_root"] = false,
      ["class_to_file.brute_force_conversion"] = false,
      ["code_transform.class_new.variants"] = false,
      ["code_transform.template_paths"] = false,
      ["code_transform.indentation"] = false,
      ["code_transform.refactor.generate_accessor.prefix"] = false,
      ["code_transform.refactor.generate_accessor.upper_case_first"] = false,
      ["code_transform.refactor.generate_mutator.prefix"] = false,
      ["code_transform.refactor.generate_mutator.upper_case_first"] = false,
      ["code_transform.refactor.generate_mutator.fluent"] = false,
      ["code_transform.import_globals"] = false,
      ["code_transform.refactor.object_fill.hint"] = false,
      ["code_transform.refactor.object_fill.named_parameters"] = false,
      ["completion_worse.completor.doctrine_annotation.enabled"] = false,
      ["completion_worse.completor.imported_names.enabled"] = false,
      ["completion_worse.completor.worse_parameter.enabled"] = false,
      ["completion_worse.completor.named_parameter.enabled"] = false,
      ["completion_worse.completor.constructor.enabled"] = false,
      ["completion_worse.completor.class_member.enabled"] = false,
      ["completion_worse.completor.scf_class.enabled"] = false,
      ["completion_worse.completor.local_variable.enabled"] = false,
      ["completion_worse.completor.declared_function.enabled"] = false,
      ["completion_worse.completor.declared_constant.enabled"] = false,
      ["completion_worse.completor.declared_class.enabled"] = false,
      ["completion_worse.completor.expression_name_search.enabled"] = false,
      ["completion_worse.completor.use.enabled"] = false,
      ["completion_worse.completor.class_like.enabled"] = false,
      ["completion_worse.completor.type.enabled"] = false,
      ["completion_worse.completor.keyword.enabled"] = false,
      ["completion_worse.completor.docblock.enabled"] = false,
      ["completion_worse.completor.constant.enabled"] = false,
      ["completion_worse.completor.class.limit"] = false,
      ["completion_worse.name_completion_priority"] = false,
      ["completion_worse.snippets"] = false,
      ["completion_worse.experimantal"] = false,
      ["completion_worse.debug"] = false,
      ["completion.dedupe"] = false,
      ["completion.dedupe_match_fqn"] = false,
      ["completion.limit"] = false,
      ["navigator.destinations"] = false,
      ["navigator.autocreate"] = false,
      ["rpc.store_replay"] = false,
      ["rpc.replay_path"] = false,
      ["source_code_filesystem.project_root"] = false,
      ["language_server_code_transform.import_globals"] = false,
      ["worse_reflection.enable_cache"] = false,
      ["worse_reflection.cache_lifetime"] = false,
      ["worse_reflection.enable_context_location"] = false,
      ["worse_reflection.cache_dir"] = false,
      ["worse_reflection.stub_dir"] = false,
      ["file_path_resolver.project_root"] = false,
      ["file_path_resolver.app_name"] = false,
      ["file_path_resolver.application_root"] = false,
      ["file_path_resolver.enable_cache"] = false,
      ["file_path_resolver.enable_logging"] = false,
      ["logging.enabled"] = false,
      ["logging.fingers_crossed"] = false,
      ["logging.path"] = false,
      ["logging.level"] = false,
      ["logger.name"] = false,
      ["logging.formatter"] = false,
      ["composer.enable"] = false,
      ["composer.autoloader_path"] = false,
      ["composer.autoload_deregister"] = false,
      ["composer.class_maps_only"] = false,
      ["console.verbosity"] = false,
      ["console.decorated"] = false,
      ["worse_reference_finder.plain_text_break_chars"] = false,
      ["php.version"] = false,
      ["language_server.catch_errors"] = false,
      ["language_server.enable_workspace"] = false,
      ["language_server.session_parameters"] = false,
      ["language_server.method_alias_map"] = false,
      ["language_server.diagnostic_sleep_time"] = false,
      ["language_server.diagnostics_on_update"] = false,
      ["language_server.diagnostics_on_save"] = false,
      ["language_server.diagnostics_on_open"] = false,
      ["language_server.diagnostic_providers"] = false,
      ["language_server,file_events"] = false,
      ["language_server.file_event_globs"] = false,
      ["language_server.profile"] = false,
      ["language_server.trace"] = false,
      ["language_server.shutdown_grace_period"] = false,
      ["language_server.self_destruct_timeout"] = false,
      ["language_server_completion.trim_leading_dollar"] = false,
      ["language_server_reference_reference_finder.reference_timeout"] = false,
      ["language_server_worse_reflection.workspace_index.update_interval"] = false,
      ["language_server_indexer.workspace_symbol_search_limit"] = false,
      ["language_server_code_transform.import_name.report_non_existing_names"] = false,
      ["indexer.enabled_watchers"] = false,
      ["indexer.index_path"] = false,
      ["indexer.include_patterns"] = false,
      ["indexer.exclude_patterns"] = false,
      ["indexer.stub_paths"] = false,
      ["indexer.poll_time"] = false,
      ["indexer.buffer_time"] = false,
      ["indexer.follow_symlinks"] = false,
      ["indexer.project_root"] = false,
      ["indexer.reference_finder.deep"] = false,
      ["indexer.implementation_finder.deep"] = false,
      ["object_renderer.template_paths.markdown"] = false,
      ["language_server_phpstan.enabled"] = false,
      ["language_server_phpstan.bin"] = false,
      ["language_server_phpstan.level"] = false,
      ["language_server_psalm.enabled"] = false,
      ["language_server_psalm.bin"] = false,
      ["blackfire.enabled"] = false,
      ["language_server_php_cs_fixer.enabled"] = false,
      ["language_server_php_cs_fixer.bin"] = false,
      ["language_server_php_cs_fixer.env"] = false,
    }
  },
  eslint = {},
  gopls = {},
  tsserver = {},
  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
