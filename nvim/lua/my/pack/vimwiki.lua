local function wiki(opts)
  return vim.tbl_deep_extend('force', {
    syntax = 'default',
    ext = 'wiki',
    index = 'index',
    auto_diary_index = 1,
    auto_tags = 1, -- muito bugado, linkando em paginas em branco
    auto_generate_tags = 1,
    exclude_files = { 'index.wiki', '_diary/*', 'diary/*', 'old/**', 'priv/**' },
  }, opts)
end

vim.g.vimwiki_list = {
  wiki {
    name = 'pkm',
    diary_rel_path = "_diary",
    exclude_files = { 'index.wiki', '_diary/*', 'o/**' },
    path = '~/vimwiki/pkm',
    auto_toc = 1,
    auto_generate_links = 1,
    generated_links_caption = 1,
    rx_todo = [[\C\<\%(\<TODO\>\|\<DONE\>\|\<THANKS\>\|\<FIXME\>\|????\|!!!!\|\<CUIDADO\>\)\>]],
  },

  wiki {
    name = 'wtf',
    path = '~/dev/blog/wtf',
    rx_todo = [[\C\<\%(\<TODO\>\|\<THANKS\>\|\<FIXME\>\|????\|!!!!\|\<CUIDADO\>\)\>]],
    index = 'README',
    ext = '.md',
    syntax = 'markdown',
  },

  wiki {
    name = 'idez',
    path = '~/vimwiki/idez',
    rx_todo =
    [[\C\%(\<COP\>\|\<CALL\>\|\<TODO\>\|\<BACKLOG\>\|\<RELEASE\>\|\<DONE\>\|\<FLAKY\>\|\<STARTED\>\|\<FIXME\>\|\<FIXED\>\|\<MERGE\>\|\<MY REVIEW\>\|\<PRFIX\>\|\<WAIT QA\>\|\<WAIT\>\|\<BUG\>\|\<NEW\>\|\<REVIEW\>\|\<PR\>\|\<QA\>\|\<P:\>\|\<R:\>\|???\)]],
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

vim.api.nvim_create_user_command('PARAback', function()
    local word = vim.fn.expand("<cword>")
    vim.api.nvim_exec2([[VWB]], {})

    local loclist = vim.fn.getloclist(0)
    local new_locflist = {}
    for _, item in ipairs(loclist) do
      local filename = vim.fn.bufname(item.bufnr)
      local file = io.open(filename, "r")
      local first_line = file:read()
      first_line = string.gsub(first_line, "^= ", "")
      first_line = string.gsub(first_line, " =$", "")
      file:close()
      item.text = first_line
      item.module = word

      table.insert(new_locflist, item)
    end
    -- setqflist
    vim.fn.setloclist(0, new_locflist)
  end,
  {}
)

vim.api.nvim_create_user_command('PARA', function()
    local word = vim.fn.expand("<cword>")
    vim.api.nvim_exec2(
      [[:execute "noautocmd vimgrep /:\\<" . expand("<cword>") . "\\>:/gj **/*." .  expand("%:e") | cope]],
      {}
    )

    local qflist = vim.fn.getqflist({ all = 0 })
    local new_qflist = {}
    for _, item in ipairs(qflist.items) do
      local filename = vim.fn.bufname(item.bufnr)
      local file = io.open(filename, "r")
      local first_line = file:read()
      first_line = string.gsub(first_line, "^= ", "")
      first_line = string.gsub(first_line, " =$", "")
      file:close()
      item.text = first_line
      item.module = word

      table.insert(new_qflist, item)
    end
    -- setqflist
    vim.fn.setqflist({}, 'r', { title = 'PARA', items = new_qflist })
  end,
  {}
)

local function get_random_filename()
  local allowed_chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  local quantity = 4
  local filename = ''
  for _ = 1, quantity do
    local random_index = math.random(1, #allowed_chars)
    filename = filename .. string.sub(allowed_chars, random_index, random_index)
  end
  return filename
end

vim.api.nvim_create_user_command('PARAfile', function()
    local random_name = get_random_filename()
    vim.api.nvim_exec2(
      ":edit " .. random_name .. ".wiki",
      {}
    )
    vim.api.nvim_exec2([[:normal!I= Titulo =]], {})
    vim.api.nvim_exec2([[:normal!o:projeto:]], {})
    vim.api.nvim_exec2([[:normal!o:area:]], {})
    vim.api.nvim_exec2([[:normal!o:recurso:]], {})
    vim.api.nvim_exec2([[:normal!o:arquivo:]], {})
    vim.api.nvim_exec2([[:normal!o:collection:]], {})
    vim.api.nvim_exec2([[:normal!Bh]], {})
  end,
  {}
)

vim.g.calendar_diary = '~/vimwiki/pkm/_diary'
vim.g.calendar_mark = 'right'
