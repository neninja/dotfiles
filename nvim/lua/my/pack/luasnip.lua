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
local rep = require("luasnip.extras").rep
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l

--https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua
--https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#loaders


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

--# Mapeamentos
local map = vim.keymap.set
vim.cmd [[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' ]]
map('s', '<Tab>', function()
  if ls.expand_or_locally_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

map({ 'i', 's' }, '<s-Tab>', function()
  ls.jump(-1)
end, { silent = true })

map({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

map('s', '<bs>', "a<bs>", {})
--# Linguagens
--## All
add("all", {
  ts("filename", "filename without extension", "...", [[
    §
    ]], {
    f_filename(),
  }),
})
--## PHP
add("php", {
  ts("if", "condition", "if (...) {...}", [[
  if (§) {
      §
  }
  ]], {
    i(1, "condition"), i(0, "/* code */")
  }),
  ts("m", "method", "... function ...(...)... {...}", [[
    §function §(§)§
    {
        §
    }
    ]], {
    c(1, {
      t "private ",
      t "protected ",
      t "public "
    }),
    i(2, "functionName"),
    i(3, "parameters"),
    i(4, ""),
    i(0, "/* code */"),
  }),
  ts("f", "anonym function", "function(...) ... {...}", [[
    function(§)§ {
        §
    }
    ]], {
    i(1, "parameters"),
    i(2, ""),
    i(0, "/* code */"),
  }),
  ts("fn", "closure", "fn() => ...", [[
    fn(§) => §
    ]], {
    i(1, "parameters"),
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
    $this§§
    ]], {
    i(1, "->"), i(0),
  }),
  cs("d", "dumper", "dump(...);", {
    t("dump("), i(0), t(");"),
  }),
  cs("dd", "diedumper", "dd(...);", {
    t("dd("), i(0), t(");"),
  }),
  cs("vdd", "dump and die", "var_dump(...);die;", {
    t("var_dump("), i(0), t(");die;"),
  }),
  ts("r", "return", "return ...;", [[
    return §;
    ]], {
    i(0)
  }),
  ts("php", "php tag", "<?php", [[
    <?php

    §
    ]], {
    i(0)
  }),
  ts("isn", "is_null", "is_null(...)", [[
    is_null(§)
    ]], {
    i(0)
  }),
  ts("is", "isset", "isset(...)", [[
    isset(§)
    ]], {
    i(0)
  }),
  ts("fore", "foreach", "foreach(...)", [[
    foreach(§ as §) {
        §
    }
    ]], {
    i(1, "$array"), i(2, "$item"), i(0)
  }),
  ts("reduce", "array reduce", "array_reduce(...)", [[
    array_reduce(§, function (§, §) {
        §
        return §;
    }, §);
    ]], {
    i(1, "$array"), i(2, "$acc"), i(3, "$item"), i(0), rep(2), i(4, "[]")
  }),
  ts("map", "array map", "array_map(...)", [[
    array_map(function (§) {
        §
    }, §);
    ]], {
    i(1, "$item"), i(0), i(2, "$array")
  }),
  ts("php", "php tag", "<?php", [[
    <?php

    §
    ]], {
    i(0)
  }),
  ts("tn", "throw new", "throw new ...", [[
    throw new §;
    ]], {
    i(0)
  }),
  ts("te", "throw exception", "throw new \\Exception()", [[
    throw new \Exception('§');
    ]], {
    i(0)
  }),
  ts("try", "try catch", "try ... catch ...", [[
    try {
        §
    } catch (§) {
    }
    ]], {
    i(0), i(1, "\\Throwable $e")
  }),
  -- PHPUnit
  ts("dataprovider", "phpunit data provider", "function { yield ... }", [[
    public function §Provider()
    {
        yield "§" => [
            §
        ];§
    }
    ]], {
    i(1), i(2, "data set"), i(3, "// $parametro1, $parametro2, $parametro3 ..."), i(0)
  }),
  -- Laravel
  ts("ff", "filled", "filled(...)", [[
    filled(§)
    ]], {
    i(0)
  }),
  ts("fb", "blank", "blank(...)", [[
    blank(§)
    ]], {
    i(0)
  }),
  ts("lmock", "simple mock", "$this->mock(...::class)", [[
    $this->mock(§::class)
        ->shouldReceive('§')
        ->§;
    ]], {
    i(1), i(2), i(0)
  }),
  ts("lmocki", "complex mock", "$this->mock(...::class, function (MockInterface $mock) { ... })", [[
        $this->mock(§::class, function (MockInterface $mock) {
            $mock->shouldReceive('§')
                ->§;
        });
    ]], {
    i(1), i(2), i(0)
  }),
  ts("mockeryon", "complex with", "->with(Mockery::on, function ($param) { ... })", [[
       ->with(
           \Mockery::on(function ($param) {
               return §;
           }),
       );
    ]], {
    i(0)
  }),
  ts("lfactory", "complex with", "->with(Mockery::on, function ($param) { ... })", [[
      §::factory()
          §->create(§);
    ]], {
    i(1), i(2), i(0, "[]")
  }),
})
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
--## Go
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
    t("fmt.Println("), i(0), t(")"),
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
