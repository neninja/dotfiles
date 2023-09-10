vim.g.vimwiki_list = {
  { name = 'my', path = '~/vimwiki/my', auto_generate_links = 1, auto_diary_index = 1, auto_tags = 1,
    exclude_files = { 'index.wiki', './..' } },
  { name = 'idez', path = '~/vimwiki/idez', auto_generate_links = 1, auto_diary_index = 1, auto_tags = 1,
    exclude_files = { 'index.wiki' } },
  { name = 'winker', path = '~/vimwiki/winker', auto_generate_links = 1, auto_diary_index = 1, auto_tags = 1,
    exclude_files = { 'index.wiki' } },
}

vim.g.vimwiki_folding = 'expr'
vim.g.vimwiki_auto_chdir = 1

-- Dicas:
--
-- Centralizar titulo com `:center`, copiar espaços iniciais para o final
-- Centralizar comandos com `:right`, copiar espaços iniciais para o meio
--
-- `ggVGgq` formata texto
