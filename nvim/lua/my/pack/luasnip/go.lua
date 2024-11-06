local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local util = require("my.pack.luasnip.util")
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial

local function f_filename()
  return ls.function_node(function()
    return vim.fn.expand('%:t:r')
  end)
end

local function ret_filename()
  return vim.fn.expand('%:t:r')
end

local function ret_directory()
  return vim.fn.expand('%:p:h:t')
end

local in_test_file = {
  show_condition = util.is_in_test_file,
  condition = util.is_in_test_file,
}

return {
  ls.s(
    { trig = ":", name = ":=", dscr = "... := ..." }, --{{{
    fmta("<> := <>", { ls.i(1), ls.i(0) })            --}}}
  ),

  ls.s(
    { trig = ";", name = ":=", dscr = "... := ..." }, --{{{
    fmta("<> := <>", { ls.i(1), ls.i(0) })            --}}}
  ),

  ls.s(
    { trig = "d", name = "defer", dscr = "defer ..." }, --{{{
    fmta("defer <>", { ls.i(0) })                       --}}}
  ),

  ls.s(
    { trig = "p", name = "package name", dscr = "package ..." }, --{{{
    fmta("package <>", {
      ls.d(1, function()
          local dir = ret_directory()
          return ls.sn(nil, {
            ls.i(1, dir)
          })
        end,
        nil
      )
    }) --}}}
  ),

  ls.s(
    { trig = "r", name = "return", dscr = "return" }, --{{{
    fmta("return", {})                                --}}}
  ),

  ls.s(
    { trig = "if", name = "if", dscr = "if ... { ... }" }, --{{{
    fmta("if <> {\n\t<>\n}", { ls.i(1, "err"), ls.i(0) })  --}}}
  ),

  ls.s(
    { trig = "ife", name = "if error", dscr = "if error != nill { return ... }" }, --{{{
    fmta("if <> != nil {\n\t<>\n}", { ls.i(1, "err"), ls.i(0) })                   --}}}
  ),

  ls.s(
    { trig = "ifn", name = "if nill", dscr = "if val == nill { return ... }" }, --{{{
    fmta("if <> == nil {\n\t<>\n}", { ls.i(1, "val"), ls.i(0) })                --}}}
  ),

  ls.s(
    { trig = "ift", name = "if got != want", dscr = "if got != want {...}" }, --{{{
    fmta("if got != want {\n\t<>\n}\n", {
      ls.i(0, 't.Error("got:", got, "want:", want)'),
    }) --}}}
  ),

  ls.s(
    { trig = "el", name = "else", dscr = "else {...}" }, --{{{
    fmta("else {\n\t<>\n}", {
      ls.i(0),
    }) --}}}
  ),

  ls.s(
    { trig = "ei", name = "else if", dscr = "else if ... { ... }" }, --{{{
    fmta("else if <> {\n\t<>\n}", {
      ls.i(1, "err"),
      ls.i(0, "/* code */"),
    }) --}}}
  ),

  ls.s(
    { trig = "for", name = "for", dscr = "for ... {...}" }, --{{{
    fmta("for <>{\n\t<>\n}", { ls.i(1), ls.i(0) })          --}}}
  ),

  ls.s(
    { trig = "forr", name = "for range", dscr = "for ... := range ... {...}" }, --{{{
    fmta("for <> := range <> {\n\t<>\n}", {
      ls.i(1),
      ls.i(2),
      ls.i(0),
    }) --}}}
  ),

  ls.s(
    { trig = "forc", name = "for channel", dscr = "for ... := range channel ... {...}" }, --{{{
    fmta("for <> := range <> <> {\n\t<>\n}", {
      ls.i(1),
      ls.i(2, 'channel'),
      ls.i(3),
      ls.i(0),
    }) --}}}
  ),

  ls.s(
    { trig = "fori", name = "for i := 0", dscr = "for ... := 0; i <= ...; i++ {...}" }, --{{{
    fmta("for <i1> := 0; <i2> <<= <max_conditions>; <i3>++ {\n\t<finally>\n}", {
      i1 = ls.i(1, "i"),
      i2 = rep(1),
      i3 = rep(1),
      max_conditions = ls.i(2, "max_conditions"),
      finally = ls.i(0),
    }) --}}}
  ),

  ls.s(
    { trig = "refrec", name = "Defer Recover", dscr = "Defer Recover" }, --{{{
    fmta(
      [[
        defer func() {{
          if e := recover(); e != nil {{
            fmt.Printf("Panic: %v\n%v\n", e, string(debug.Stack()))
          }}
        }}()
      ]]
      , {}), --}}}
    in_func
  ),

  ls.s(
    { trig = "mockery", name = "Mockery", dscr = "Create an interface for making mocks" }, --{{{
    fmt(
      [[
        // {} mocks {} interface for testing purposes.
        //go:generate mockery --name {} --filename {}_mock.go
        type {} interface {{
          {}
        }}
      ]], {
        rep(1),
        rep(2),
        rep(1),
        ls.f(function(args) return util.snake_case(args[1][1]) end, { 1 }),
        ls.i(1, "Client"),
        ls.i(2, "pkg.Interface"),
      }) --}}}
  ),

  ls.s(
    { trig = "make", name = "Make", dscr = "Allocate map or slice" }, --{{{
    fmt("{} {}= make({})\n{}", {
      ls.i(1, "name"),
      ls.i(2),
      ls.c(3, {
        fmt("[]{}, {}", { ls.r(1, "type"), ls.i(2, "len") }),
        fmt("[]{}, 0, {}", { ls.r(1, "type"), ls.i(2, "len") }),
        fmt("map[{}]{}, {}", { ls.r(1, "type"), ls.i(2, "values"), ls.i(3, "len") }),
      }, {
        stored = { -- FIXME: the default value is not set.
          type = ls.i(1, "type"),
        },
      }),
      ls.i(0),
    }), --}}}
    in_func
  ),

  ls.s(
    { trig = "tt", dscr = "test table" }, --{{{
    fmta("var tt = []struct {\n\t<>\n}{\n\t{<>},\n}",
      {
        ls.i(1, 'name string, in []any, out any'),
        ls.i(0, "cenarios")
      }
    ), --}}}
    in_test_file
  ),

  --ls.s(
  --  { trig = "tt", dscr = "test table" }, --{{{
  --  fmta(
  --    [[
  --    var tt = []struct {
  --      name string
  --      in   []<>
  --      out  <>
  --    }{
  --      {<>},
  --    }

  --    for _, tc := range tt {
  --      got := <>(test.in<>)
  --      if got != want {
  --        t.Error("For", test.in, "got:", got, "want:", test.out)
  --      }
  --    }
  --    ]], {
  --      ls.i(1, 'typeIn'),
  --      ls.i(2, 'typeOut'),
  --      ls.i(3, 'cenario'),
  --      ls.i(4, 'testedFuncName'),
  --      ls.i(5, '...'),
  --    }
  --  ), --}}}
  --  in_test_file
  --),

  ls.s(
    { trig = "ft", name = "Test/Subtest", dscr = "Create subtests and their function stubs" }, --{{{
    fmta("func Test<>(t *testing.T) {\n\t<>\n}", { ls.i(1), ls.i(0) }),                        --}}}
    in_test_file
  ),

  ls.s(
    { trig = "tr", name = "Subtest", dscr = "Create subtests" },           --{{{
    fmta("t.Run(<>, func(t *testing.T) {\n\t<>\n}", { ls.i(1), ls.i(0) }), --}}}
    in_test_file
  ),

  ls.s(
    { trig = "te", name = "test error", dscr = 't.Error(...)' }, --{{{
    fmta('t.Error(<>)', { ls.i(0) })                             --}}}
  ),

  ls.s(
    { trig = "tl", name = "test log", dscr = 't.Log(...)' }, --{{{
    fmta('t.Log(<>)', { ls.i(0) })                           --}}}
  ),

  ls.s(
    {
      trig = "wr",
      name = "w http.ResponseWriter, req *http.Request",
      dscr = "r http.ResponseWriter, req *http.Request"
    },                                                 --{{{
    fmta("w http.ResponseWriter, r *http.Request", {}) --}}}
  ),

  ls.s(
    { trig = "fh", name = "handle http func", dscr = "func handle...(w http.ResponseWriter, r *http.Request) {...}" }, --{{{
    fmta("func handle<>(w http.ResponseWriter, r *http.Request) {\n\t<>\n}", {
      ls.i(1, "FunctionName"),
      ls.i(0, "/* code */"),
    }) --}}}
  ),

  ls.s(
    { trig = "om", name = "if key in a map", dscr = "if ..., ok := ...; ok { ... }" }, --{{{
    fmta("if <>, ok := <>[<>]; ok {\n\t<>\n}", {
      ls.i(1, "value"),
      ls.i(2, "map"),
      ls.i(3, "key"),
      ls.i(0),
    }) --}}}
  ),

  ls.s(
    { trig = "hfr", name = "handle func for route", dscr = "http.HandleFunc(...)" }, --{{{
    fmta("http.HandleFunc(<>, <>)", { ls.i(1, "route"), ls.i(0, "functionName") })   --}}}
  ),

  ls.s(
    { trig = "hf", name = "handle func for route", dscr = "http.HandleFunc(...)" }, --{{{
    fmta("http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {\n\t<>\n})", {
      ls.i(0)
    }) --}}}
  ),

  ls.s(
    { trig = "ls", name = "listen and serve", dscr = "http.ListenAndServe(...)" }, --{{{
    fmta("http.ListenAndServe(<>, nil)", { ls.i(0, ":9090") })                     --}}}
  ),

  ls.s(
    { trig = "pl", name = "print line", dscr = "fmt.Println(...)" },         --{{{
    fmta("<>.Println(<>)", { ls.c(1, { ls.t "fmt", ls.t "log" }), ls.i(0) }) --}}}
  ),

  ls.s(
    { trig = "ef", name = "errorf", dscr = 'fmt.Errorf("%+v",...)' },              --{{{
    fmta('<>.Errorf("%+v", <>)', { ls.c(1, { ls.t "fmt", ls.t "log" }), ls.i(0) }) --}}}
  ),

  ls.s(
    { trig = "pv", name = "print value", dscr = 'fmt.Printf("%#v\\n", ...)' }, --{{{
    fmta('fmt.Printf("%#v\\n", <>)', { ls.i(0, 'var_name') })                  --}}}
  ),

  ls.s(
    { trig = "tys", name = "type struct", dscr = "type ... struct ..." }, --{{{
    fmta("type <> struct {\n\t<>\n}", { ls.i(1, 'name'), ls.i(0) })       --}}}
  ),

  ls.s(
    { trig = "tyi", name = "type interface", dscr = "type ... interface ..." }, --{{{
    fmta("type <> interface {\n\t<>\n}", { ls.i(1, 'name'), ls.i(0) })          --}}}
  ),

  ls.s(
    { trig = "tyf", name = "type function", dscr = "type ... function ..." },                 --{{{
    fmta("type <> function(<>) <>", { ls.i(1, 'name'), ls.i(2, 'params'), ls.i(3, 'error') }) --}}}
  ),

  ls.s(
    { trig = "sleep", name = "time sleep", dscr = "time.Sleep(time.Millisecond * ...)" }, --{{{
    fmta("time.Sleep(time.Millisecond * <>)", { ls.i(0, 'miliseconds') })                 --}}}
  ),

  ls.s(
    { trig = "ts", name = "rand int", dscr = "rand.Intn(...)" }, --{{{
    fmta("rand.Intn(<>)", { ls.i(0, 'max_rand_int') })           --}}}
  ),
}

-- vim: fdm=marker fdl=0
