local curl = require("plenary.curl")
local env = require("my.env")

local token = env.clickup.token;
local user_id = env.clickup.user_id;
local space_id = env.clickup.space_id;
local workspace_id = env.clickup.workspace_id;

vim.api.nvim_create_user_command('Clickup', function()
    local statuses = ""
    for _, status in ipairs(env.clickup.filter.statuses) do
      statuses = statuses .. "&statuses[]=" .. status
    end
    statuses = string.gsub(statuses, "%s+", "%%20")

    local res = curl.get(
      "https://api.clickup.com/api/v2/team/" ..
      workspace_id ..
      "/task?order_by=created&reverse=true&assignees[]=" ..
      user_id ..
      "&space_ids[]=" ..
      space_id ..
      "&subtasks=true" .. statuses,
      {
        accept = "application/json",
        raw = { "-H", "Authorization: " .. token },
        timeout = 30000
      })

    local tickets = vim.fn.json_decode(res.body).tasks
    local qflist = {}
    for _, ticket in ipairs(tickets) do
      table.insert(qflist, { text = ticket.name, module = ticket.status.status, pattern = ticket.id })
    end

    vim.fn.setqflist({}, 'r', { title = 'Clickup', items = qflist })
    vim.api.nvim_command('cope')
  end,
  {}
)
