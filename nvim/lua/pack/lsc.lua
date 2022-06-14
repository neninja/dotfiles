vim.g["lsc_dart_sdk_path"] = '~/snap/flutter/common/flutter/bin/cache/dart-sdk/'

vim.g["lsc_auto_completeopt"] = false
vim.g["lsc_auto_map"] = {defaults = true, Completion = 'omnifunc'}

local lsc_php = {
  command = 'intelephense --stdio',
  message_hooks = {
    initialize = {
      initializationOptions = {storagePath = '/tmp/intelephense'},
    },
  },
}

local lsc_dart = 'dart_language_server'
local lsc_vim = nil
local lsc_lua = nil

vim.g["lsc_server_commands"] = {
  dart = lsc_dart,
  -- php = lsc_php,
  php = nil,
  lua = lsc_lua,
  vim = lsc_vim,
}
