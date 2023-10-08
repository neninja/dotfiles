-- Requires {{{
local ls = require("luasnip")
local util = require("my.pack.luasnip.util")
local partial = require("luasnip.extras").partial
--}}}

return {
  -- System {{{
  ls.s("time", partial(vim.fn.strftime, "%H:%M:%S")),
  ls.s("date", partial(vim.fn.strftime, "%Y-%m-%d")),
  ls.s("pwd", { partial(util.shell, "pwd") }),
  ls.s("filename", partial(vim.fn.expand, "%:t:r")),
  ls.s({ trig = "uuid", wordTrig = true }, { ls.f(util.uuid), ls.i(0) }),
  ls.s({ trig = "rstr(%d+)", regTrig = true }, {
    ls.f(function(_, snip)
      return util.random_string(snip.captures[1])
    end),
    ls.i(0),
  }),
  --}}}

  -- Lorem Ipsum {{{
  ls.s(
    { trig = "lor", name = "Lorem Ipsum (Choice)", dscr = "Choose next for more lines" },
    ls.c(1, { ls.t(util.random_line()), ls.t(util.random_line()) })
  ),
  ls.s(
    {
      trig = "lor(%d+)",
      name = "Lorem Ipsum",
      regTrig = true,
      dscr = "Start with a count for lines",
    },
    ls.f(function(_, snip)
      local lines = snip.captures[1]
      if not tonumber(lines) then
        lines = 1
      end
      local lor = vim.split(util.lorem(), ", ")
      return vim.list_slice(lor, lines)
    end)
  ),
  --}}}

  -- Tags {{{
  ls.s(
    {
      trig = "(%w+)>",
      name = "Tag comum",
      regTrig = true,
      dscr = "Abrir e fechar tag comum",
    }, {
      ls.f(function(_, snip)
        return "<" .. snip.captures[1] .. ">"
      end),
      ls.i(0),
      ls.f(function(_, snip)
        return "</" .. snip.captures[1] .. ">"
      end),
    }
  ),

  ls.s(
    {
      trig = "(%w+)/",
      name = "Tag unica",
      regTrig = true,
      dscr = "Abrir tag sozinha",
    }, {
      ls.f(function(_, snip)
        return "<" .. snip.captures[1] .. "/>"
      end),
    }
  ),
  --}}}
}

-- vim: fdm=marker fdl=0
