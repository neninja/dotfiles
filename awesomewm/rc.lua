-- vim: fdm=expr:fdt=FoldTextLua():foldexpr=FoldExprLua():

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for other apps
-- when client with a matching name is opened:
--require("awful.hotkeys_popup.keys")
require("awful.hotkeys_popup.keys.vim")

-- Load Debian menu entries
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

--# Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors
  })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err)
    })
    in_error = false
  end)
end

--# Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "mytheme.lua")

-- This is used later as the default terminal and editor to run.
local terminal = "x-terminal-emulator"
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor
local screenshot = "flameshot gui"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
local modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.tile,
  -- awful.layout.suit.floating,
  --awful.layout.suit.tile.left,
  --awful.layout.suit.tile.bottom,
  --awful.layout.suit.tile.top,
  --awful.layout.suit.fair,
  --awful.layout.suit.fair.horizontal,
  --awful.layout.suit.spiral,
  --awful.layout.suit.spiral.dwindle,
  awful.layout.suit.max,
  -- awful.layout.suit.max.fullscreen,
  --awful.layout.suit.magnifier,
  --awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.sw,
  -- awful.layout.suit.corner.se,
}

--# Menu
-- Create a launcher widget and a main menu
local myawesomemenu = {
  { "hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual",      terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart",     awesome.restart },
  { "quit",        function() awesome.quit() end },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

local mymainmenu = {}
if has_fdo then
  mymainmenu = freedesktop.menu.build({
    before = { menu_awesome },
    after = { menu_terminal }
  })
else
  mymainmenu = awful.menu({
    items = {
      menu_awesome,
      { "Debian", debian.menu.Debian_menu.Debian },
      menu_terminal,
    }
  })
end


-- local mylauncher = awful.widget.launcher({
-- image = beautiful.awesome_icon,
-- menu = mymainmenu
-- })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

--# Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()

--# Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock("%a %d/%m/%y, %H:%M", 10)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button({}, 1, function(t) t:view_only() end),
  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
  awful.button({}, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal(
        "request::activate",
        "tasklist",
        { raise = true }
      )
    end
  end),
  awful.button({}, 3, function()
    awful.menu.client_list({ theme = { width = 250 } })
  end),
  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
  end),
  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
  end))

local function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Each screen has its own tag table.
  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)))
  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    {
      -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      -- mylauncher,
      s.mytaglist,
      s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    {
      -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      mykeyboardlayout,
      wibox.widget.systray(),
      mytextclock,
      require("battery-widget") {}, -- https://github.com/deficient/battery-widget
      s.mylayoutbox,
    },
  }
end)

--# Mouse bindings
root.buttons(gears.table.join(
  awful.button({}, 3, function() mymainmenu:toggle() end),
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
))

--# Key bindings
local function k(group, description, alias, keybind, fun)
  return awful.key(alias, keybind, fun,
    { description = description, group = group })
end


local globalkeys = gears.table.join(table.unpack({
  k("awesome", "exibir ajuda", { modkey, }, "space", hotkeys_popup.show_help),
  k("awesome", "exibir ajuda", { modkey, "Shift" }, "space", hotkeys_popup.show_help),
  k("awesome", "exibir menu flutuante", { modkey, }, "w", function() mymainmenu:show() end),
  k("awesome", "recarregar WM", { modkey, "Control" }, "r", awesome.restart),
  k("awesome", "recarregar WM", { modkey, "Shift" }, "r", awesome.restart),
  k("awesome", "Logoff", { modkey, "Control", "Shift" }, "q", awesome.quit),
  k("tag", "acessar tag à esquerda", { modkey, }, "Left", awful.tag.viewprev),
  k("tag", "acessar tag à direita", { modkey, }, "Right", awful.tag.viewnext),
  k("tag", "voltar a tag anterior", { modkey, }, "Escape", awful.tag.history.restore),
  k("tag", "voltar a tag anterior", { modkey, }, "Tab", awful.tag.history.restore),
  k("client", "acessar próximo client", { modkey, }, "j", function() awful.client.focus.byidx(1) end),
  k("client", "acessar client anterior", { modkey, }, "k", function() awful.client.focus.byidx(-1) end),
  k("client", "acessar client urgente", { modkey, }, "u", awful.client.urgent.jumpto),
  k("layout", "utilizar próximo layout", { modkey }, ";", function() awful.layout.inc(1) end),
  k("layout", "utilizar layout anterior", { modkey }, ";", function() awful.layout.inc(-1) end),
  k("layout", "trocar client atual com o próximo", { modkey, "Shift", }, "j", function() awful.client.swap.byidx(1) end),
  k("layout", "trocar client atual com o anterior", { modkey, "Shift", }, "k", function() awful.client.swap.byidx(-1) end),
  k("layout", "redimensionar à direita tamanho do client", { modkey }, "l", function() awful.tag.incmwfact(0.05) end),
  k("layout", "redimensionar à esquerda tamanho do client", { modkey }, "h", function() awful.tag.incmwfact(-0.05) end),
  k("layout", "aumentar quantidade de clients na master", { modkey, "Shift" }, "h",
    function() awful.tag.incnmaster(1, nil, true) end),
  k("layout", "diminuir quantidade de clients na master", { modkey, "Shift" }, "l",
    function() awful.tag.incnmaster(-1, nil, true) end),
  k("layout", "aumentar quantidade de colunas", { modkey, "Shift" }, "h", function() awful.tag.incncol(1, nil, true) end),
  k("layout", "diminuir quantidade de colunas", { modkey, "Shift" }, "l", function() awful.tag.incncol(-1, nil, true) end),
  k("client", "acessar próxima tela", { modkey, "Control", }, "j", function() awful.screen.focus_relative(1) end),
  k("client", "acessar tela anterior", { modkey, "Control", }, "k", function() awful.screen.focus_relative(-1) end),
  k("launcher", "terminal", { modkey, }, "Return", function() awful.spawn(terminal) end),
  k("launcher", "prompt", { modkey, }, "r", function() awful.screen.focused().mypromptbox:run() end),
  k("launcher", "launcher", { modkey, }, "p", function() menubar.show() end),
  k("launcher", "launcher", { modkey, }, "s", function() awful.spawn(screenshot) end),
}))

local clientkeys = gears.table.join(table.unpack({
  k("client", "toggle fullscreen", { modkey, }, "f", function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end),
  k("client", "fechar client", { modkey, "Shift", }, "q", function(c) c:kill() end),
  k("client", "centralizar float client", { modkey, "Control", }, "z", awful.placement.centered),
  k("client", "toggle mudar client para float", { modkey, "Control", }, "space", awful.client.floating.toggle),
  k("client", "toggle manter client no topo", { modkey, "Control", }, "t", function(c) c.ontop = not c.ontop end),
  k("client", "toggle manter client em todas tags", { modkey, "Control", }, "s", function(c) c.sticky = not c.sticky end),
  k("client", "toggle mudar client para master", { modkey, "Shift", }, "Return", function(_)
    if client.focus == awful.client.getmaster() then
      awful.client.swap.byidx(1)
      awful.client.focus.byidx(-1)
    else
      awful.client.setmaster(client.focus)
    end
  end),
  k("client", "mover client para outra screen", { modkey, "Control", }, "o", function(c) c:move_to_screen() end),
  k("client", "mover todos clients para outra screen", { modkey, "Shift", "Control", }, "o", function(_)
    for _, c in ipairs(awful.screen.focused().all_clients) do
      local index=c.first_tag.index
      c:move_to_screen()
      local tag =c.screen.tags[index]
      c:move_to_tag(tag)
    end
  end),

  k("client", "toggle maximizar client", { modkey, }, "m", function(c)
    c.maximized = not c.maximized
    c:raise()
  end),
}))

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      { description = "acessar tag #" .. i, group = "tag" }),
    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      { description = "mover client para tag #" .. i, group = "tag" })
  )
end

local clientbuttons = gears.table.join(
  awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),
  awful.button({ modkey }, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)

-- Set keys
root.keys(globalkeys)

--# Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },
  {
    rule = { class = "x-terminal-emulator" },
    properties = { opacity = 0.75 }
  },

  -- Floating clients.
  {
    rule_any = {
      instance = {
        "DTA",   -- Firefox addon DownThemAll.
        "copyq", -- Includes session name in class.
        "pinentry",
      },
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "MessageWin",  -- kalarm.
        "Sxiv",
        "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
        "Wpa_gui",
        "veromix",
        "xtightvncviewer"
      },

      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        "Event Tester", -- xev.
      },
      role = {
        "AlarmWindow",   -- Thunderbird's calendar.
        "ConfigManager", -- Thunderbird's about:config.
        "pop-up",        -- e.g. Google Chrome's (detached) Developer Tools.
      }
    },
    properties = { floating = true }
  },

  -- Add titlebars to normal clients and dialogs
  {
    rule_any = { type = { "normal", "dialog" }
    },
    properties = { titlebars_enabled = false }
  },

  -- Set Firefox to always map on the tag named "2" on screen 1.
  -- { rule = { class = "Firefox" },
  --   properties = { screen = 1, tag = "2" } },
}

--# Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
  -- buttons for the titlebar
  local buttons = gears.table.join(
    awful.button({}, 1, function()
      c:emit_signal("request::activate", "titlebar", { raise = true })
      awful.mouse.client.move(c)
    end),
    awful.button({}, 3, function()
      c:emit_signal("request::activate", "titlebar", { raise = true })
      awful.mouse.client.resize(c)
    end)
  )

  awful.titlebar(c):setup {
    {
      -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    {
      -- Middle
      {
        -- Title
        align  = "center",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    {
      -- Right
      awful.titlebar.widget.floatingbutton(c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.stickybutton(c),
      awful.titlebar.widget.ontopbutton(c),
      awful.titlebar.widget.closebutton(c),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
awful.util.spawn("compton")
--beautiful.border_width = 10
