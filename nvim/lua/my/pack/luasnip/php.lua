local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local m = require("luasnip.extras").match
local ne = require("luasnip.extras").nonempty
local util = require("my.pack.luasnip.util")
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial

return {
  ls.s(
    { trig = "if", name = "if", dscr = "if (...) {...}" },
    fmta("if (<condition>) {\n\t<finally>\n}", {
      condition = ls.i(1, "val"),
      finally   = ls.i(0),
    })
  ),

  ls.s(
    { trig = "f", name = "anonym function", dscr = "function(...) ... {...}" },
    fmta("function(<params>)<r><ret> {\n<finally>\n}", {
      params  = ls.i(1, "params"),
      r       = ne(2, ": "),
      ret     = ls.i(2, " "),
      finally = ls.i(0),
    })
  ),

  ls.s(
    { trig = "fn", name = "closure", dscr = "fn() => ..." },
    fmt([[fn({params}) => {finally}]], {
      params  = ls.i(1, "params"),
      finally = ls.i(0),
    })
  ),

  ls.s(
    { trig = "c", name = "create class", dscr = "class ... {...}" },
    fmta("class <>\n{\n\t<>\n}", { partial(vim.fn.expand, "%:t:r"), ls.i(0) })
  ),

  ls.s(
    { trig = "e", name = "create enum", dscr = "enum ... {...}" },
    fmta("enum <>\n{\n\t<>\n}", { partial(vim.fn.expand, "%:t:r"), ls.i(0) })
  ),

  ls.s(
    { trig = "i", name = "create interface", dscr = "interface ... {...}" },
    fmta("interface <>\n{\n\t<>\n}", { partial(vim.fn.expand, "%:t:r"), ls.i(0) })
  ),

  ls.s(
    { trig = "t", name = "$this", dscr = "$this" },
    fmt([[$this{}]], { ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "r", name = "return", dscr = "return ...;" },
    fmt([[return {finally};]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "d", name = "dumper", dscr = "dump(...);" },
    fmt([[dump({finally});]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "dd", name = "diedumper", dscr = "dd(...);" },
    fmt([[dd({finally});]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "vd", name = "var_dump", dscr = "var_dump(...);" },
    fmt([[var_dump({finally});]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "vdd", name = "var_dump die", dscr = "var_dump(...);die;" },
    fmt([[var_dump({finally});die;]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "isn", name = "is null", dscr = "is_null(...);" },
    fmt([[is_null({finally});]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "is", name = "is set", dscr = "isset(...);" },
    fmt([[isset({finally});]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "fore", name = "foreach", dscr = "foreach(...)" },
    fmta("foreach(<ar> as <item>) {\n\t<finally>\n}", {
      ar = ls.i(1, "$array"),
      item = ls.i(2, "$item"),
      finally = ls.i(0),
    }, in_func)
  ),

  ls.s(
    { trig = "reduce", name = "array reduce", dscr = "array_reduce(...)" },
    fmta("array_reduce(<ar>, function (<acc>, <item>) {\n\t<finally>\n}, <init>)", {
      ar = ls.i(1, "$array"),
      acc = ls.i(2, "$acc"),
      item = ls.i(3, "$item"),
      init = ls.i(4, "[]"),
      finally = ls.i(0),
    }, in_func)
  ),

  ls.s(
    { trig = "map", name = "array map", dscr = "array_map(...)" },
    fmta("array_map(function (<item>) {\n<finally>\n}, <ar>)", {
      ar = ls.i(1, "$array"),
      item = ls.i(2, "$item"),
      finally = ls.i(0),
    }, in_func)
  ),

  ls.s(
    { trig = "tn", name = "throw new", dscr = "throw new ..." },
    fmt([[ throw new {e} ]], { e = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "te", name = "throw generic exception", dscr = "throw new \\Exception()" },
    fmt([[ throw new \Exception("{m}") ]], { m = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "try", name = "try catch", dscr = "try ... catch ..." },
    fmta("try {\n\t<finally>\n} catch (<throw>) {\n}", {
      throw = ls.i(1, "\\Throwable $e"),
      finally = ls.i(0),
    }, in_func)
  ),

  -- PHPUnit {{{
  ls.s(
    { trig = "dataprovider", name = "phpunit data provider", dscr = "function { yield ... }" },
    fmta("public static function <name>()\n{\n\tyield [ <params> ];\n}\n\n#[DataProvider('<name2>')]", {
      name = ls.i(1),
      name2 = rep(1),
      params = ls.i(0, "$parametro1, $parametro2, $parametro3"),
    }, in_func)
  ),
  --}}}

  -- Laravel {{{
  ls.s(
    { trig = "ff", name = "filled", dscr = "filled(...)" },
    fmt([[ filled({params}) ]], { params = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "fb", name = "blank", dscr = "blank(...)" },
    fmt([[ blank({params}) ]], { params = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "mock", name = "simple mock", dscr = "$this->mock(...::class)" },
    fmt([[
    $this->mock({classname}::class)
        ->shouldReceive('{method}')
        ->{finally};
    ]], {
      classname = ls.i(1, "ClassName"),
      method = ls.i(2, "metodo"),
      finally = ls.i(0),
    }, in_func)
  ),

  ls.s(
    { trig = "mocki", name = "complex mock", dscr = "$this->mock(...::class, function (MockInterface $mock) { ... })" },
    fmt([[
        $this->mock({classname}::class, function (MockInterface $mock) {{
            $mock->shouldReceive('{method}')
                ->{finally};
        }});
    ]], {
      classname = ls.i(1, "ClassName"),
      method = ls.i(2, "metodo"),
      finally = ls.i(0),
    }, in_func)
  ),

  ls.s(
    { trig = "mockeryon", name = "complex with", dscr = "->with(Mockery::on, function ($param) { ... })" },
    fmt([[
       ->with(
           \Mockery::on(function ($param) {{
               return {condition};
           }}),
       );
    ]], {
      condition = ls.i(0, "true"),
    }, in_func)
  ),

  ls.s(
    { trig = "lfactory", name = "factory", dscr = "Class::factory" },
    fmt([[
      {classname}::factory(){intermediary}->create({params});
    ]], {
      classname = ls.i(1, "ClassName"),
      intermediary = ls.i(2),
      params = ls.i(0, "[]"),
    }, in_func)
  ),
  --}}}
}

-- vim: fdm=marker fdl=0
