local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local util = require("my.pack.luasnip.util")
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial

local function not_in_function()
  return not util.is_in_function()
end

local in_test_func = {
  show_condition = util.is_in_test_function,
  condition = util.is_in_test_function,
}

local in_test_file = {
  show_condition = util.is_in_test_file,
  condition = util.is_in_test_file,
}

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
    { trig = "pmain", name = "Main", dscr = "Create a main function" },
    fmta("package main\n\nfunc main() {\n\t<>\n}", ls.i(0)),
    not_in_func
  ),

  ls.s(
    { trig = "f", name = "Function", dscr = "Create a function or a method" },
    fmt(
      [[
        func {rec}{name}({args}) {ret} {{
          {finally}
        }}
      ]], {
        rec   = ls.c(1, {
          ls.t(""),
          ls.sn(nil, fmt("({} {}) ", {
            ls.i(1, "r"),
            ls.i(2, "receiver"),
          })),
        }),
        name = ls.i(2, "Name"),
        args  = ls.i(3),
        ret   = ls.c(4, {
          ls.i(1, "error"),
          ls.sn(nil, fmt("({}, {}) ", {
            ls.i(1, "ret"),
            ls.i(2, "error"),
          })),
        }),
        finally = ls.i(0),
    }),
    not_in_func
  ),

  ls.s(
    { trig = "ife", name = "If error", dscr = "If error, return wrapped" },
    fmt("if {} != nil {{\n\treturn {}\n}}\n{}", {
      ls.i(1, "err"),
      ls.d(2, util.make_return_nodes, { 1 }, { user_args = { { "a1", "a2" } } }),
      ls.i(0),
    })
  ),

  ls.s(
    { trig = "it", name = "if got != want", dscr = "if got != want {...}" },
    fmt("if got != want {{\n\t{}\n}}\n{}", {
      ls.i(1, 't.Error("got:", got, "want:", want)'),
      ls.i(0),
    })
  ),

  ls.s(
    { trig = "forr", name = "for range", dscr = "for ... := range ... {...}" },
    fmt("for {} := range {} {{\n\t{}\n}}", {
      ls.i(1),
      ls.i(2),
      ls.i(0),
    })
  ),

  ls.s(
    { trig = "fori", name = "for i := 0", dscr = "for ... := 0; i <= ...; i++ {...}" },
    fmt("for {i1} := 0; {i2} <= {max_conditions}; {i3}++ {{\n\t{finally}\n}}", {
      i1 = ls.i(1, "i"),
      i2 = rep(1),
      i3 = rep(1),
      max_conditions = ls.i(2, "max_conditions"),
      finally = ls.i(0),
    })
  ),

  ls.s(
    { trig = "refrec", name = "Defer Recover", dscr = "Defer Recover" },
    fmta(
      [[
        defer func() {{
          if e := recover(); e != nil {{
            fmt.Printf("Panic: %v\n%v\n", e, string(debug.Stack()))
          }}
        }}()
      ]]
    , {}),
    in_func
  ),

  ls.s(
    { trig = "mockery", name = "Mockery", dscr = "Create an interface for making mocks" },
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
    })
  ),

  ls.s(
    { trig = "make", name = "Make", dscr = "Allocate map or slice" },
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
    }),
    in_func
  ),

  ls.s(
    { trig = "tt", dscr = "test table" },
    fmta(
      [[
      var tt = []struct {
        name string
        in   []<>
        out  <>
      }{
        {<>},
      }

      for _, tc := range tt {
        got := <>(test.in<>)
        if got != want {
          t.Error("For", test.in, "got:", got, "want:", test.out)
        }
      }
      ]], {
        ls.i(1, 'typeIn'),
        ls.i(2, 'typeOut'),
        ls.i(3, 'cenario'),
        ls.i(4, 'testedFuncName'),
        ls.i(5, '...'),
      }
    ),
    in_test_func
  ),

  ls.s(
    { trig = "gocmp", dscr = "Create an if block comparing with cmp.Diff" },
    fmt(
      [[
        if diff := cmp.Diff({}, {}); diff != "" {{
        	t.Errorf("(-want +got):\\n%s", diff)
        }}
      ]], {
        ls.i(1, "want"),
        ls.i(2, "got"),
    }),
    in_test_func
  ),

  ls.s(
    { trig = "mock", name = "Mocks", dscr = "Create a mock with defering assertion" },
    fmt("{} := &mocks.{}{{}}\ndefer {}.AssertExpectations(t)\n{}", {
      ls.i(1, "m"),
      ls.i(2, "Mocked"),
      rep(1),
      ls.i(0),
    }),
    in_test_func
  ),

  ls.s(
    { trig = "noerr", name = "Require No Error", dscr = "Add a require.NoError call" },
    ls.c(1, {
      ls.sn(nil, fmt("require.NoError(t, {})", { ls.i(1, "err") })),
      ls.sn(nil, fmt('require.NoError(t, {}, "{}")', { ls.i(1, "err"), ls.i(2) })),
      ls.sn(nil, fmt('require.NoErrorf(t, {}, "{}", {})', { ls.i(1, "err"), ls.i(2), ls.i(3) })),
    }),
    in_test_func
  ),

  ls.s(
    { trig = "ft", name = "Test/Subtest", dscr = "Create subtests and their function stubs" },
    fmta("func <>(t *testing.T) {\n<>\n}\n\n <>", {
      ls.i(1),
      ls.d(2, util.create_t_run, ai({ 1 })),
      ls.d(3, util.mirror_t_run_funcs, ai({ 2 })),
    }),
    in_test_file
  ),

  ls.s(
    { trig = "fh", name = "handle http func", dscr = "func handle...(res http.ResponseWriter, req *http.Request) {...}" },
    fmt("func handle{}(res http.ResponseWriter, req *http.Request) {{\n\t{}\n}}", {
      ls.i(1, "FunctionName"),
      ls.i(0, "/* code */"),
    })
  ),

  ls.s(
    { trig = "hf", name = "route handle http func", dscr = "http.HandleFunc(...)" },
    fmt("http.HandleFunc({}, {})", { ls.i(1, "route"), ls.i(0, "functionName") })
  ),

  ls.s(
    { trig = "hls", name = "listen and serve", dscr = "http.ListenAndServe(...)" },
    fmt("http.ListenAndServe({}, nil)", { ls.i(0, ":9090") })
  ),

  ls.s(
    { trig = "pl", name = "print line", dscr = "fmt.Println(...)" },
    fmt("fmt.Println({})", { ls.i(0) })
  ),

  ls.s(
    { trig = "ts", name = "time sleep", dscr = "time.Sleep(time.Millisecond * ...)" },
    fmt("time.Sleep(time.Millisecond * {})", { ls.i(0, 'miliseconds') })
  ),

  ls.s(
    { trig = "ts", name = "rand int", dscr = "rand.Intn(...)" },
    fmt("rand.Intn({})", { ls.i(0, 'max_rand_int') })
  ),

  ls.s(
    { trig = "pv", name = "print value", dscr = 'fmt.Printf("%+v\\n", ...)' },
    fmt('fmt.Printf("%+v\\n", {})', { ls.i(0, 'var_name') })
  ),

  ls.s(
    { trig = ":", name = ":=", dscr = "... := ..." },
    fmt("{} := {}", { ls.i(1), ls.i(0) })
  ),

  ls.s(
    { trig = "p", name = "package name", dscr = "package ..." },
    fmt("package {}\n\n{}", { ls.i(1, "main"), ls.i(0) })
  ),
}
