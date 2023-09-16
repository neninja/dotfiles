local function wiki(opts)
  return vim.tbl_deep_extend('force',{
    syntax = 'markdown',
    ext = '.md',
    index = 'README',
    auto_generate_links = 1,
    auto_diary_index = 1,
    auto_tags = 1,
    auto_generate_tags = 1,
    exclude_files = { 'README.md', 'diary/*', 'old/*' },
  },opts)
end

vim.g.vimwiki_list = {
  wiki {
    name = 'my',
    path = '~/vimwiki/my',
    rx_todo = [[\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|WAIT\)\>]],
    auto_toc = 1,
  },

  wiki {
    name = 'bananas 🍌',
    path = '~/vimwiki/bananas',
    rx_todo = [[\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|WAIT\)\>]],
  },

  wiki {
    name = 'idez',
    path = '~/vimwiki/idez',
    rx_todo = [[\C\%(\<TODO\>\|\<DONE\>\|\<FLAKY\>\|\<STARTED\>\|\<FIXME\>\|\<FIXED\>\|\<MERGE\>\|\<MY REVIEW\>\|\<MY PR\>\|\<WAIT REVIEW\>\|\<WAIT QA\>\|\<WAIT\>\|\<BUG\>\|\<NEW\>\|\<REVIEW\>\|\<PR\>\|\<QA\>\|???\)]],
  },

  wiki {
    name = 'winker',
    path = '~/vimwiki/winker',
    rx_todo = [[\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|WAIT\)\>]],
  },
}

vim.g.vimwiki_folding = 'expr'
vim.g.vimwiki_auto_chdir = 1
vim.g.vimwiki_links_header = "Links"
vim.g.vimwiki_tags_header = "Tags"
vim.g.vimwiki_markdown_link_ext = 1
