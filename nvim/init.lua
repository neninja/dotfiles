-- Define o caminho fixo onde o arquivo está localizado
DOTFILES_FULLPATH_NVIM = "~/dev/dotfiles/nvim/"

-- Expande o caminho para o formato absoluto
DOTFILES_FULLPATH_NVIM = vim.fn.expand(DOTFILES_FULLPATH_NVIM)

-- Adiciona o caminho ao runtimepath do Vim
vim.opt.runtimepath:append(DOTFILES_FULLPATH_NVIM)

require('my.init')
