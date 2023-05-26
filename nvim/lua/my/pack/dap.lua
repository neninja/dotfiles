local dap = require('dap')

vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
--vim.keymap.set('n', '<F11>', function() dap.step_into() end)
--vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>dd', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)

vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
-- .exit               Closes the REPL
-- .c or .continue     Same as |dap.continue|
-- .n or .next         Same as |dap.step_over|
-- .into               Same as |dap.step_into|
-- .into_target        Same as |dap.step_into{askForTargets=true}|
-- .out                Same as |dap.step_out|

vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
--vim.keymap.set('n', '<Leader>ds', function()
--  local widgets = require('dap.ui.widgets')
--  widgets.centered_float(widgets.scopes)
--end)

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
    args = {"debug_adapter"}
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
      toolArgs = {"-d", "linux"}
    }
  }
