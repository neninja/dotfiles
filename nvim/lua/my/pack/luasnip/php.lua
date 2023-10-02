local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local m = require("luasnip.extras").match
local ne = require("luasnip.extras").nonempty
local util = require("my.pack.luasnip.util")
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial

local function not_in_function()
  return not util.is_in_function()
end

local in_func = {
  show_condition = util.is_in_function,
  condition = util.is_in_function,
}

local not_in_func = {
  show_condition = not_in_function,
  condition = not_in_function,
}

return {
  ls.s(
    { trig = "if", name = "if", dscr = "if (...) {...}" },
    fmt([[
        if ({condition}) {{
          {finally}
        }}
      ]], {
      condition = ls.i(1, "val"),
      finally   = ls.i(0, "/* code */"),
    })
  ),

  ls.s(
    { trig = "m", name = "method", dscr = "... function ...(...)... {...}" },
    fmt([[
        {access}function {name}({params}){r}{ret}
        {{
          {finally}
        }}
      ]], {
      access  = ls.c(1, {
        ls.t "private ",
        ls.t "protected ",
        ls.t "public "
      }),
      name    = ls.i(2, "functionName"),
      params  = ls.i(3, "params"),
      r       = m(4, "^$", "", ": "),
      ret     = ls.i(4, ""),
      finally = ls.i(0, "/* code */"),
    }),
    not_in_func
  ),

  ls.s(
    { trig = "f", name = "anonym function", dscr = "function(...) ... {...}" },
    fmt([[
        function({params}){r}{ret} {{
          {finally}
        }}
      ]], {
      params  = ls.i(1, "params"),
      r       = ne(2, ": "),
      ret     = ls.i(2, " "),
      finally = ls.i(0, "/* code */"),
    })
  ),

  ls.s(
    { trig = "fn", name = "closure", dscr = "fn() => ..." },
    fmt([[ fn({params}) => {finally} ]], {
      params  = ls.i(1, "params"),
      finally = ls.i(0, "/* code */"),
    })
  ),

  ls.s(
    { trig = "c", name = "create class", dscr = "class ... {...}" },
    fmt([[
        class {filename}
        {{
          {finally}
        }}
      ]], {
      filename = partial(vim.fn.expand, "%:t:r"),
      finally  = ls.i(0, "/* code */"),
    })
  ),

  ls.s(
    { trig = "e", name = "create enum", dscr = "enum ... {...}" },
    fmt([[
        enum {filename}
        {{
          {finally}
        }}
      ]], {
      filename = partial(vim.fn.expand, "%:t:r"),
      finally  = ls.i(0, "/* code */"),
    })
  ),

  ls.s(
    { trig = "i", name = "create interface", dscr = "interface ... {...}" },
    fmt([[
        interface {filename}
        {{
          {finally}
        }}
      ]], {
      filename = partial(vim.fn.expand, "%:t:r"),
      finally  = ls.i(0, "/* code */"),
    })
  ),

  ls.s(
    { trig = "t", name = "$this", dscr = "$this" },
    fmt([[ $this ]], {}, in_func)
  ),

  ls.s(
    { trig = "php", name = "php tag", dscr = "<?php" },
    fmt([[
      <?php

      {finally}
      ]], {
      finally = ls.i(0, "/* code */")
    }, not_in_func)
  ),

  ls.s(
    { trig = "r", name = "return", dscr = "return ...;" },
    fmt([[ return {finally}; ]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "d", name = "dumper", dscr = "dump(...);" },
    fmt([[ dump({finally}); ]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "dd", name = "diedumper", dscr = "dd(...);" },
    fmt([[ dd({finally}); ]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "vd", name = "var_dump", dscr = "var_dump(...);" },
    fmt([[ var_dump({finally}); ]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "vdd", name = "var_dump die", dscr = "var_dump(...);die;" },
    fmt([[ var_dump({finally});die; ]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "isn", name = "is null", dscr = "is_null(...);" },
    fmt([[ is_null({finally}); ]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "is", name = "is set", dscr = "isset(...);" },
    fmt([[ isset({finally}); ]], { finally = ls.i(0) }, in_func)
  ),

  ls.s(
    { trig = "fore", name = "foreach", dscr = "foreach(...)" },
    fmt([[
    foreach({ar} as {item}) {{
        {finally}
    }}
    ]], {
      ar = ls.i(1, "$array"),
      item = ls.i(2, "$item"),
      finally = ls.i(0, "/* code */"),
    }, in_func)
  ),

  ls.s(
    { trig = "reduce", name = "array reduce", dscr = "array_reduce(...)" },
    fmt([[
    array_reduce({ar}, function ({acc}, {item}) {{
        {finally}
    }}, {init})
    ]], {
      ar = ls.i(1, "$array"),
      acc = ls.i(2, "$acc"),
      item = ls.i(3, "$item"),
      init = ls.i(4, "[]"),
      finally = ls.i(0, "/* code */"),
    }, in_func)
  ),

  ls.s(
    { trig = "map", name = "array map", dscr = "array_map(...)" },
    fmt([[
    array_map(function ({item}) {{
        {finally}
    }}, {ar})
    ]], {
      ar = ls.i(1, "$array"),
      item = ls.i(2, "$item"),
      finally = ls.i(0, "/* code */"),
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
    fmt([[
    try {{
      {finally}
    }} catch ({throw}) {{
    }}
    ]], {
      throw = ls.i(1, "\\Throwable $e"),
      finally = ls.i(0, "/* code */"),
    }, in_func)
  ),

  -- PHPUnit {{{
  ls.s(
    { trig = "dataprovider", name = "phpunit data provider", dscr = "function { yield ... }" },
    fmt([[
    public function {name}Provider()
    {{
        yield "{cenario}" => [ {params} ];{finally}
    }}
    ]], {
      name = ls.i(1),
      cenario = ls.i(2, "data set"),
      params = ls.i(3, "$parametro1, $parametro2, $parametro3"),
      finally = ls.i(0),
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
    { trig = "lmock", name = "simple mock", dscr = "$this->mock(...::class)" },
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
    { trig = "lmocki", name = "complex mock", dscr = "$this->mock(...::class, function (MockInterface $mock) { ... })" },
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
