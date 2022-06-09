
local fn = vim.fn
local install_path = '~/.config/nvim/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  -- My plugins here
        use 'wbthomason/packer.nvim'
        use "neovim/nvim-lspconfig"
        use 'junegunn/goyo.vim'
        use 'mhinz/vim-startify'
        use 'diepm/vim-rest-console'
        use 'editorconfig/editorconfig-vim'
        use 'unblevable/quick-scope'
        use 'tpope/vim-fugitive'
        use 'junegunn/gv.vim'
        use 'phpactor/phpactor'
        use {
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end)

    local actions = require("telescope.actions")
    require('telescope').setup{
        defaults = {
            file_ignore_patterns = { "^./.git/", "^./node_modules/", "^./vendor/" },
            mappings = {
                i = {
                    ["<esc>"] = actions.close,
                    ["<c-k>"] = actions.move_selection_previous,
                    ["<c-j>"] = actions.move_selection_next,
                    ["<c-h>"] = actions.file_split,
                    ["<c-v>"] = actions.file_vsplit,
                    ["<C-/>"] = "which_key"
                }
            }
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },
        extensions = {
            -- Your extension configuration goes here:
            -- extension_name = {
            --   extension_config_key = value,
            -- }
            -- please take a look at the readme of the extension you want to configure
        }
    }
