local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local ai = require("luasnip.nodes.absolute_indexer")

local M = {}

---Returns a choice node for errors.
-- @param choice_index integer
-- @param err_name string
M.go_err_snippet = function(args, _, _, spec)
  local err_name = args[1][1]
  local index = spec and spec.index or nil
  local msg = spec and spec[1] or ""
  if spec and spec[2] then
    err_name = err_name .. spec[2]
  end
  return ls.sn(index, {
    ls.c(1, {
      ls.sn(nil, fmt('fmt.Errorf("{}: %w", {})', { ls.i(1, msg), ls.t(err_name) })),
      -- ls.sn(nil, fmt('fmt.Errorf("{}", {}, {})', { ls.t(err_name), ls.i(1, msg), ls.i(2) })),
      ls.sn(
        nil,
        fmt('internal.GrpcError({},\n\t\tcodes.{}, "{}", "{}", {})', {
          ls.t(err_name),
          ls.i(1, "Internal"),
          ls.i(2, "Description"),
          ls.i(3, "Field"),
          ls.i(4, "fields"),
        })
      ),
      ls.t(err_name),
    }),
  })
end

---Transform makes a node from the given text.
local function transform(text, info)
  local string_sn = function(template, default)
    info.index = info.index + 1
    return ls.sn(info.index, fmt(template, ls.i(1, default)))
  end
  local new_sn = function(default)
    return string_sn("{}", default)
  end

  -- cutting the name if exists.
  if text:find([[^[^\[]*string$]]) then
    text = "string"
  elseif text:find("^[^%[]*map%[[^%]]+") then
    text = "map"
  elseif text:find("%[%]") then
    text = "slice"
  elseif text:find([[ ?chan +[%a%d]+]]) then
    return ls.t("nil")
  end

  -- separating the type from the name if exists.
  local type = text:match([[^[%a%d]+ ([%a%d]+)$]])
  if type then
    text = type
  end

  if text == "int" or text == "int64" or text == "int32" then
    return new_sn("0")
  elseif text == "float32" or text == "float64" then
    return new_sn("0")
  elseif text == "error" then
    if not info then
      return ls.t("err")
    end

    info.index = info.index + 1
    return M.go_err_snippet({ { info.err_name } }, nil, nil, { index = info.index })
  elseif text == "bool" then
    info.index = info.index + 1
    return ls.c(info.index, { ls.i(1, "false"), ls.i(2, "true") })
  elseif text == "string" then
    return string_sn('"{}"', "")
  elseif text == "map" or text == "slice" then
    return ls.t("nil")
  elseif string.find(text, "*", 1, true) then
    return new_sn("nil")
  end

  text = text:match("[^ ]+$")
  if text == "context.Context" then
    text = "context.Background()"
  else
    -- when the type is concrete
    text = text .. "{}"
  end

  return ls.t(text)
end

---Runs the command in shell.
-- @param command string
-- @return table
M.shell = function(command)
  local file = io.popen(command, "r")
  local res = {}
  for line in file:lines() do
    table.insert(res, line)
  end
  return res
end

M.last_lua_module_section = function(args)
  local text = args[1][1] or ""
  local split = vim.split(text, ".", { plain = true })

  local options = {}
  for len = 0, #split - 1 do
    local node = ls.t(table.concat(vim.list_slice(split, #split - len, #split), "_"))
    table.insert(options, node)
  end

  return ls.sn(nil, {
    ls.c(1, options),
  })
end

---Returns true if the cursor in a test file.
-- @return boolean
function M.is_in_test_file()
  local filename = vim.fn.expand("%:p")
  return vim.endswith(filename, "_test.go")
end

math.randomseed(os.time())
M.uuid = function()
  local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
  local out
  local function subs(c)
    local v = (((c == "x") and math.random(0, 15)) or math.random(8, 11))
    return string.format("%x", v)
  end
  out = template:gsub("[xy]", subs)
  return out
end

local charset = {}
for i = 48, 57 do
  table.insert(charset, string.char(i))
end
for i = 65, 90 do
  table.insert(charset, string.char(i))
end
for i = 97, 122 do
  table.insert(charset, string.char(i))
end
M.random_string = function(length)
  if length == 0 then
    return ""
  end
  return M.random_string(length - 1) .. charset[math.random(1, #charset)]
end

M.snake_case = function(titlecase)
  -- lowercase the first letter otherwise it causes the result to start with an
  -- underscore.
  titlecase = string.lower(string.sub(titlecase, 1, 1)) .. string.sub(titlecase, 2)
  return titlecase:gsub("%u", function(c)
    return "_" .. c:lower()
  end)
end

M.create_t_run = function(args)
  return ls.sn(1, {
    ls.c(1, {
      ls.t({ "" }),
      ls.sn(
        nil,
        fmt('\tt.Run("{}", {}{})\n{}', {
          ls.i(1, "Case"),
          ls.t(args[1]),
          rep(1),
          ls.d(2, M.create_t_run, ai[1]),
        })
      ),
    }),
  })
end

M.mirror_t_run_funcs = function(args)
  local strs = {}
  for _, v in ipairs(args[1]) do
    local name = v:match('^%s*t%.Run%s*%(%s*".*", (.*)%)')
    if name then
      local node = string.format("func %s(t *testing.T) {{\n\tt.Parallel()\n}}\n\n", name)
      table.insert(strs, node)
    end
  end
  local str = table.concat(strs, "")
  if #str == 0 then
    return ls.sn(1, ls.t(""))
  end
  return ls.sn(1, fmt(str, {}))
end

local lorem =
'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
M.lorem = function()
  return lorem
end

M.random_words = function()
  local str = lorem()
  local words = fn.split(str, ' ')
  str = ''
  for i = 1, len do
    str = str .. ' ' .. words[math.random(#words)]
  end
  return str
end

M.random_line = function()
  local lines = vim.split(lorem, ', ')
  return lines[math.random(#lines)] .. ','
end

return M
