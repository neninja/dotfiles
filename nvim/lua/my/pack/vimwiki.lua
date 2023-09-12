vim.g.vimwiki_list = {
  {
    name = 'my',
    path = '~/vimwiki/my',
    rx_todo = [[\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|XXX\)\>]],
    auto_generate_links = 1,
    auto_diary_index = 1,
    auto_tags = 1,
    exclude_files = { 'index.wiki' }
  },
  {
    name = 'bananas 🍌',
    rx_todo = [[\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|XXX\)\>]],
    path = '~/vimwiki/bananas',
    auto_generate_links = 1,
    auto_diary_index = 1,
    auto_tags = 1,
    exclude_files = { 'index.wiki' }
  },
  {
    name = 'idez',
    rx_todo = [[\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|XXX\)\>]],
    path = '~/vimwiki/idez',
    auto_generate_links = 1,
    auto_diary_index = 1,
    auto_tags = 1,
    exclude_files = { 'index.wiki' }
  },
  {
    name = 'winker',
    rx_todo = [[\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|XXX\)\>]],
    path = '~/vimwiki/winker',
    auto_generate_links = 1,
    auto_diary_index = 1,
    auto_tags = 1,
    exclude_files = { 'index.wiki' }
  },
}

vim.g.vimwiki_folding = 'expr'
vim.g.vimwiki_auto_chdir = 1
