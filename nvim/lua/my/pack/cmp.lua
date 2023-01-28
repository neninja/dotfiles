local cmp = require("cmp")         -- The complete engine
local luasnip = require("luasnip") -- The snippet engine

-- This is almost verbatin from the Github Page
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    -- Navigate the dropdown list snippet
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert}),
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert}),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),

    -- Enter select the item
    -- ["<CR>"] = cmp.mapping.confirm({
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true,
    -- }),
    -- Use <Tab> as the automplete trigger
    ["<c-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

    ["<c-space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },
  },
  -- Where to look for auto-complete items.
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
  },
})

require("my.pack.luasnip")
