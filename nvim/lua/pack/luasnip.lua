-- vim: fdm=expr:fdt=FoldTextLua():foldexpr=FoldExprLua():

local ls = require"luasnip"
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
local rep = require("luasnip.extras").rep
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l

--https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua
--https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#loaders


local function cs(trig, name, dscr, n)
  return s({trig=trig, name=name, dscr=dscr}, n)
end

local function ts(trig, name, dscr, tpl, nod, opt)
  nod = nod or {}
  if opt==nil or opt['delimiters'] == nil then
    opt = {
      delimiters='§'
    }
  end
  return s({trig=trig, name=name, dscr=dscr}, fmt(tpl, nod, opt))
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
        virt_text = { { "<tab>", "DiffAdd" } },
      },
      passive = {
        virt_text = { { "<tab>", "DiffChange" } },
      },
    },
  },
})

local function f_filename()
  return f(function()
    return vim.fn.expand('%:t:r')
  end)
end

local function hardebugtxt(position)
  return "\":hardebug:"..vim.fn.expand('%:t:r')..vim.fn.strftime(':%H:%M:%S').."\""
end

--# PHP
add("php", {
  ts("if", "condition", "if (...) {...}", [[
  if (§) {
      §
  }
  ]], {
      i(1, "condition"), i(0, "/* code */")
    }),
  ts("f", "function", "function ...(...)... {...}", [[
    §function §(§)§
    {
        §
    }
    ]], {
      c(1, {
        t "",
        t "protected ",
        t "private ",
        t "public "
      }),
      i(2, "functionName"),
      i(3, "parameters"),
      i(4, ""),
      i(0, "/* code */"),
    }),
  ts("c", "create class", "class ... {...}", [[
    class §
    {
        §
    }
    ]], {
      f_filename(), i(0, "/* code */"),
    }),
  ts("e", "create enum", "enum ... {...}", [[
    enum §
    {
        §
    }
    ]], {
      f_filename(), i(0, "/* code */")
    }),
  ts("i", "create interface", "interface ... {...}", [[
    interface §
    {
        §
    }
    ]], {
      f_filename(), i(0, "/* code */"),
    }),
  ts("t", "$this", "$this", [[
    $this§§;
    ]], {
      i(G, "->"), i(0),
    }),
  cs("du", "dumper", "dump(...);", {
    t("dump("),
    i(0, hardebugtxt()),
    t(");"),
    }),
  cs("dd", "diedumper", "dd(...);", {
		t("dd("),
		i(0, hardebugtxt()),
		t(");"),
    }),
  cs("vdd", "dump and die", "var_dump(...);die;", {
    t("var_dump("),
    i(0, hardebugtxt()),
    t(");die;"),
    }),
  ts("r", "return", "return ...;", [[
    return §;
    ]], {
      c(1, {t "", t "true", t "false"})
    }),
  ts("php", "php tag", "<?php", [[
    <?php

    §
    ]], {
      i(0)
    }),
})

--# Dart
add("dart", {
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

--# Shell
add("sh", {
  ts("#", "#!", "#!/usr/bin/env bash", [[
    #!/usr/bin/env bash

    §
    ]], {
      i(0)
    }),
})

--# Go
add("go", {
  ts("ir", "condition err", "if err != nil {...}", [[
    if (err != nil) {
      §
    }

    §
    ]], {
      i(1, "return err"), i(0)
    }),
  ts("it", "if got != want", "if got != want {...}", [[
    if got != want {
      §
    }
    ]], {
      i(0, 't.Error("got:", got, "want:", want)')
    }),
  ts("forr", "for range", "for ... := range ... {...}", [[
    for § := range § {
      §
    }
    ]], {
      i(1, 'varnames'), i(2, 'rangearray'), i(0),
    }),
  ts("fori", "for i := 0", "for ... := 0; i <= ...; i++ {...}", [[
    for § := 0; § <= §; §++ {
      §
    }
    ]], {
      i(1, 'i'), rep(1), i(2, 'maxCondition'), rep(1), i(0),
    }),
  ts("fort", "test table", "var tests = []struct {...}{}", [[
    var tests = []struct {
      in  []§
      out §
    }{}
    for _, test := range tests {
      got := §(test.in§)
      if got != want {
        t.Error("For", test.in, "got:", got, "want:", test.out)
      }
    }
    ]], {
      i(1, 'typeIn'), i(2, 'typeOut'), i(3, 'testedFuncName'), i(4, '...'),
    }),
  ts("f", "func", "func ...(...)... {...}", [[
    func §(§)§
    {
      §
    }
    ]], {
      i(1, "functionName"),
      i(2, "parameters"),
      i(3, ""),
      i(0, "/* code */"),
    }),
  ts("ft", "test func", "func Test...(t *testing.T) {...}", [[
    func Test§(t *testing.T) {
      §
    }
    ]], {
      i(1, "FunctionName"), i(0, "/* code */"),
    }),
  ts("fh", "handle http func", "func handle...(res http.ResponseWriter, req *http.Request) {...}", [[
    func handle§(res http.ResponseWriter, req *http.Request) {
      §
    }
    ]], {
      i(1, "FunctionName"), i(0, "/* code */"),
    }),
  ts("hf", "route handle http func", "http.HandleFunc(...)", [[
    http.HandleFunc(§, §)
    ]], {
      i(1, "route"), i(0, "functionName"),
    }),
  ts("hls", "listen and serve", "http.ListenAndServe(...)", [[
    http.ListenAndServe(§, nil)
    ]], {
      i(0, ":9090"),
    }),
  cs("pl", "print line", "fmt.Println(...)", {
    t("fmt.Println("),
    i(0, hardebugtxt()),
    t(")"),
    }),
  ts("ts", "time sleep", "time.Sleep(time.Millisecond * ...)", [[
    time.Sleep(time.Millisecond * §)
    ]], {
      i(1, 'milliseconds'),
    }),
  ts("ri", "rand int", "rand.Intn(...)", [[
    rand.Intn(§)
    ]], {
      i(1, 'maxRandInt'),
    }),
  ts("pv", "print value", 'fmt.Printf("%+v\\n", ...)', [[
    fmt.Printf("%+v\\n", §)
    ]], {
      i(1, 'varName'),
    }),
  ts(":", ":=", "... := ...", [[
    § := §
    ]], {
      i(1), i(0),
    }),
  ts("pmain", "package main template", "package main func main(){...}", [[
    package  main

    func main() {
      §
    }
    ]], {
      i(0)
    }),
})

--# HTML
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

--# Map
local map = vim.keymap.set
map('i', '<Tab>', [[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']], {silent=true, expr=true})
map('s', '<Tab>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {silent = true})

map({'i', 's'}, '<s-Tab>', function()
  ls.jump(-1)
end, {silent = true})

map({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

map('s', '<bs>', "a<bs>", {})
