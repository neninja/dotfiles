--# vimrc-pre
local pre_vimrc = "~/vimrc-pre.vim"
if vim.loop.fs_stat(pre_vimrc) then
  vim.cmd('source '..pre_vimrc)
end
--
vim.cmd('source '..DOTFILES_FULLPATH_NVIM..'vimrc')
vim.opt.shadafile = "NONE"
--
vim.pack.add({'https://github.com/nvim-lua/plenary.nvim'})
vim.pack.add({'https://github.com/folke/neodev.nvim'})

-- vim.pack.add({'https://github.com/mfussenegger/nvim-dap'})
-- vim.pack.add({'https://github.com/mfussenegger/nvim-jdtls'})
-- require('java').setup()
-- vim.lsp.enable("jdtls")

-- dap.adapters.java = function(callback)  
--   callback({  
--     type = 'server',  
--     host = '127.0.0.1',  
--     port = '9091',  
--     executable = {  
--       command = 'java',  
--       args = {  
--         '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:9091',  
--         '-Declipse.application=org.eclipse.jdt.ls.core.id1',  
--         '-Dosgi.bundles.defaultStartLevel=4',  
--         '-Declipse.product=org.eclipse.jdt.ls.core.product',  
--         '-jar',  
--         '/home/c01460/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.2.jar',  
--         -- '${port}'  
--       }  
--     }  
--   })  
-- end
--
-- dap.configurations.java = {
--   {
--     type = 'java',
--     name = 'Debug (Attach)',
--     request = 'attach',
--     hostName = '127.0.0.1',
--     port = 5005,
--   },
-- }
--
-- local bundles = {
--   vim.fn.glob("~/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1)
-- }
--
-- require('jdtls').start_or_attach({
--     cmd = {"jdtls"},
--   init_options = {
--     bundles = bundles
--   },
-- })

require('my.pack.git')
require('my.pack.tree')
vim.pack.add({'https://github.com/whiteinge/diffconflicts'})
require('my.pack.telescope')
require('my.pack.luasnip')
require('my.pack.flash')
require('my.pack.cmp')
require('my.pack.mini')
require('my.pack.treesitter')
require('my.pack.lsp')
require('my.pack.dailypong')

--
----# vimrc-pos
--local local_vimrc = "~/vimrc-local.vim"
--if vim.loop.fs_stat(local_vimrc) then
--  vim.cmd('source '..local_vimrc)
--end
--
--local proj_vimrc = vim.fn.getcwd()..'/.exvrc'
--if vim.loop.fs_stat(proj_vimrc) then
--  vim.cmd('source '..proj_vimrc)
--end
--
