-- vim: fdm=expr:fdt=FoldTextLua():foldexpr=FoldExprLua():
--# Utils
local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local add = ls.add_snippets
local n = require("luasnip.extras").nonempty
local rep = require("luasnip.extras").rep
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l

--https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua
--https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#loaders

--THANKS: https://github.com/arsham/shark/blob/9888a40f7fde3a0ccb51fe073799974c3b52a312/lua/plugins/luasnip/init.lua
--THANKS: https://github.com/ray-x/go.nvim/blob/master/lua/snips/go.lua


local function cs(trig, name, dscr, n)
  return s({ trig = trig, name = name, dscr = dscr }, n)
end

local function ts(trig, name, dscr, tpl, nod, opt)
  nod = nod or {}
  if opt == nil or opt['delimiters'] == nil then
    opt = {
      delimiters = '§'
    }
  end
  return s({ trig = trig, name = name, dscr = dscr }, fmt(tpl, nod, opt))
end

local types = require("luasnip.util.types")
ls.config.set_config({
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<c-l>", "DiffAdd" } },
      },
      passive = {
        virt_text = { { "<c-l>", "DiffChange" } },
      },
    },
    [types.insertNode] = {
      active = {
        virt_text = { { "<c-j>", "DiffAdd" } },
      },
      passive = {
        virt_text = { { "<c-j>", "DiffChange" } },
      },
    },
  },
})

local function f_filename()
  return f(function()
    return vim.fn.expand('%:t:r')
  end)
end

--# Mapeamentos
local map = vim.keymap.set
vim.cmd [[imap <silent><expr> jk luasnip#expandable() ? '<Plug>luasnip-expand-or-jump' : 'jk' ]]

-- THANKS: https://www.reddit.com/r/neovim/comments/rztkaq/how_do_you_jump_out_pairs_or_quotes_in_insert/
local function tabout()
  local closers = { ")", "]", "}", ">", "'", '"', "`", "," }
  local line = vim.api.nvim_get_current_line()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local after = line:sub(col + 1, -1)
  local closer_col = #after + 1
  local closer_i = nil
  for _, closer in ipairs(closers) do
    local cur_index, _ = after:find(closer)
    if cur_index and (cur_index < closer_col) then
      closer_col = cur_index
      closer_i = i
    end
  end
  if closer_i then
    vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
  else
    -- vim.api.nvim_win_set_cursor(0, {row, col + 1})
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end

map({ 'i', 's' }, '<Tab>', function()
  if ls.expandable() then
    ls.expand()
  else
    tabout()
  end
end, { silent = true })

map({ 'i', 's' }, '<c-j>', function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end, { silent = true })

map({ 'i', 's' }, '<c-k>', function()
  ls.jump(-1)
end, { silent = true })

map({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

map('s', '<bs>', "a<bs>", {})
--# Linguagens
--## Dart
add("dart", {
  cs("dp", "debug print", "debugPrint(...);", {
    t("debugPrint("), i(0), t(");"),
  }),
  ts("stful", "Stateful class", "class ... extends StatefulWidget { ... }", [[
    class § extends StatefulWidget {
      @override
      Widget build(BuildContext context) {
        §
      }
    }
    ]], {
    i(1, "WidgetName"),
    i(0, '// TODO: implement build'),
  }),
  ts("stless", "Stateless class", "class ... extends StatelessWidget { ... }", [[
    class § extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        §
      }
    }
    ]], {
    i(1, "WidgetName"),
    i(0, '// TODO: implement build'),
  }),
})
--## Shell
add("sh", {
  ts("#", "#!", "#!/usr/bin/env bash", [[
    #!/usr/bin/env bash

    §
    ]], {
    i(0)
  }),
})
--## HTML
add("html", {
  ts("html", "DOCTYPE html", "<html><head></head><body></body></html>", [[
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
    </head>
    <body>
      §
    </body>
    </html>
    ]], {
    i(0)
  }),
})
--## javascript
add("javascript", {
  ts("imp", "import from", "import ... from ...", [[
    import § from '§';
    ]], {
    i(0),
    i(1)
  }),
  ts("log", "console.log", "console.log(...)", [[
    console.log(§)
    ]], {
    i(0),
  }),
})

ls.filetype_extend("javascriptreact", { "javascript" })
add("javascriptreact", {
  ts("rc", "export React component", "export function ...", [[
    export function §() {
      return (
        §
      );
    }
    ]], {
    f_filename(), i(0),
  }),
  ts("<", "<Fragment>", "<>...</>", [[
      <>
        §
      </>
    ]], {
    i(0),
  }),
  ts("usee", "useEffect", "useEffect(() => ...), [])", [[
    useEffect(() => {
      §
    }, [§]);
    ]], {
    i(1), i(0, "/* code */"),
  }),
  ts("uses", "useEffect", "useEffect(() => ...), [])", [[
    const [§, set§] = useState(§);
    ]], {
    i(1, ""),
    lambda(lambda._1:match("[^i]*$"):gsub("^%l", string.upper), 1),
    i(0, "null")
  }),
})

ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascriptreact", "javascript", "typescript" })
ls.add_snippets("all", require("my.pack.luasnip.all"))
ls.add_snippets("go", require("my.pack.luasnip.go"))
ls.add_snippets("php", require("my.pack.luasnip.php"))
