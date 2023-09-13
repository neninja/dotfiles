vim.g.vimwiki_list = {
  {
    name = 'my',
    path = '~/vimwiki/my',
    rx_todo = [[\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|WAIT\|XXX\)\>]],
    auto_generate_links = 1,
    auto_diary_index = 1,
    auto_tags = 1,
    exclude_files = { 'index.wiki' }
  },
  {
    name = 'bananas 🍌',
    rx_todo = [[\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|WAIT\|XXX\)\>]],
    path = '~/vimwiki/bananas',
    auto_generate_links = 1,
    auto_diary_index = 1,
    auto_tags = 1,
    exclude_files = { 'index.wiki' }
  },
  {
    name = 'idez',
    rx_todo = [[\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|WAIT\|XXX\)\>]],
    path = '~/vimwiki/idez',
    auto_generate_links = 1,
    auto_diary_index = 1,
    auto_tags = 1,
    exclude_files = { 'index.wiki' }
  },
  {
    name = 'winker',
    rx_todo = [[\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|WAIT\|XXX\)\>]],
    path = '~/vimwiki/winker',
    auto_generate_links = 1,
    auto_diary_index = 1,
    auto_tags = 1,
    exclude_files = { 'index.wiki' }
  },
}

vim.g.vimwiki_folding = 'expr'
vim.g.vimwiki_auto_chdir = 1

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local action_state = require('telescope.actions.state')
local conf = require("telescope.config").values

local function new_ui_wiki_select()
  pickers.new({}, {
    prompt_title = "Select Wiki",
    finder = finders.new_table {
      results = vim.tbl_map(function(v)
        return v.name
      end, vim.g.vimwiki_list),
    },
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local value = action_state.get_selected_entry()[1]
        local index = 1

        for i, v in ipairs(vim.g.vimwiki_list) do
          if v.name == value then
            index = i
            break
          end
        end

        print(vim.inspect(index))

        vim.cmd('VimwikiIndex '..index)
      end)
      return true
    end,
    sorter = conf.generic_sorter({}),
  }):find()
end

vim.keymap.set({ 'n' }, '<leader>ws', new_ui_wiki_select, {})
vim.api.nvim_create_user_command('VimwikiNewUISelect', new_ui_wiki_select, {})
