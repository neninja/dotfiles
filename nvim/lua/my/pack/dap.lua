local dap = require('dap')

vim.fn.sign_define('DapBreakpoint', {
  text = '🔴',
  texthl = 'DapBreakpoint',
  linehl = 'DapBreakpoint',
  numhl = 'DapBreakpoint'
})
vim.fn.sign_define('DapBreakpointCondition',
  { text = '🔴', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',
  { text = '🔴', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text = '🔵', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '⭕', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })


vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F6>', function() dap.step_over() end)
vim.keymap.set('n', '<F7>', function() dap.step_into() end)
vim.keymap.set('n', '<F8>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>dd', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)

vim.keymap.set('n', '<Leader>dx', function()
  dap.terminate()
  dap.clear_breakpoints()
end)

vim.keymap.set('n', '<m-k>', function()
  require('dap.ui.widgets').hover()
end)

-- https://gist.github.com/christopherfujino/80be0f4cd88f75c4991b478e6b071153

--dap.adapters.dart = {
--  type = "executable",
--  command = "dart",
--  -- This command was introduced upstream in https://github.com/dart-lang/sdk/commit/b68ccc9a
--  args = { "debug_adapter" }
--}
--dap.configurations.dart = {
--  {
--    type = "dart",
--    request = "launch",
--    name = "Launch Dart Program",
--    -- The nvim-dap plugin populates this variable with the filename of the current buffer
--    program = "${file}",
--    -- The nvim-dap plugin populates this variable with the editor's current working directory
--    cwd = "${workspaceFolder}",
--    args = { "--help" }, -- Note for Dart apps this is args, for Flutter apps toolArgs
--  }
--}

dap.adapters.dart = {
  type = "executable",
  -- As of this writing, this functionality is open for review in https://github.com/flutter/flutter/pull/91802
  command = "flutter",
  args = { "debug_adapter" }
}

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch Flutter Program",
    -- The nvim-dap plugin populates this variable with the filename of the current buffer
    program = "${file}",
    -- The nvim-dap plugin populates this variable with the editor's current working directory
    cwd = "${workspaceFolder}",
    -- This gets forwarded to the Flutter CLI tool, substitute `linux` for whatever device you wish to launch
    toolArgs = { "-d", "linux" }
  }
}


dap.adapters.php = {
  type = 'executable',
  command = 'nodejs',
  args = { "/opt/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003,
    pathMappings = {
      ['/var/www/html'] = "${workspaceFolder}",
    },
  }
}
