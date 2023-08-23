-- Requires
pcall(require, 'luarocks.loader')
require('awful.autofocus')

-- Standard libs
local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local naughty = require('naughty')
local menubar = require('menubar')
local hotkeys_popup = require('awful.hotkeys_popup')

-- My files
require('config.keys')
require('config.rules')

-- Error handling
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = 'Error in config file',
    text = awesome.startup_errors
  })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal('debug::error', function(err)
    if in_error then return end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = 'Error',
      text = tostring(err)
    })

    in_error = false
  end)
end

-- Theme
-- beautiful.init(gears.filesystem.get_themes_dir() .. 'default/theme.lua')
beautiful.init(gears.filesystem.get_configuration_dir() .. 'theme/init.lua')

-- Apps
terminal = os.getenv('TERM') or 'kitty'
editor = os.getenv('EDITOR') or 'vim'
editor_cmd = terminal .. ' -e ' .. editor

-- Table of layouts
awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.floating,
  awful.layout.suit.tile.left,
  -- awful.layout.suit.tile.bottom,
  -- awful.layout.suit.tile.top,
  -- awful.layout.suit.fair,
  -- awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  -- awful.layout.suit.max,
  -- awful.layout.suit.max.fullscreen,
  -- awful.layout.suit.magnifier,
  -- awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.sw,
  -- awful.layout.suit.corner.se,
}

-- Menu
myawesomemenu = {
  { 'hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { 'manual', terminal .. ' -e man awesome' },
  { 'edit config', editor_cmd .. ' ' .. awesome.conffile },
  { 'restart', awesome.restart },
  { 'quit', function() awesome.quit() end },
}

mymainmenu = awful.menu({
  items = {
    { 'awesome', myawesomemenu, beautiful.awesome_icon },
    { 'open terminal', terminal }
  }
})

mylauncher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = mymainmenu
})

-- Menubar configuration
-- Set the terminal for applications that require it
menubar.utils.terminal = terminal

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

local tasklist_buttons = gears.table.join(
  awful.button({}, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal(
        'request::activate',
        'tasklist',
        { raise = true }
      )
    end
  end),

  awful.button({}, 3, function() awful.menu.client_list({ theme = { width = 250 }}) end),
  awful.button({}, 4, function() awful.client.focus.byidx(1) end),
  awful.button({}, 5, function() awful.client.focus.byidx(-1) end)
)

local function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == 'function' then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal('property::geometry', set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Each screen has its own tag table.
  awful.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9' }, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)

  s.mylayoutbox:buttons(
    gears.table.join(
      awful.button({}, 1, function() awful.layout.inc( 1) end),
      awful.button({}, 3, function() awful.layout.inc(-1) end),
      awful.button({}, 4, function() awful.layout.inc( 1) end),
      awful.button({}, 5, function() awful.layout.inc(-1) end)
    )
  )

  local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
      if client.focus then client.focus:move_to_tag(t) end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
      if client.focus then client.focus:toggle_tag(t) end
    end)
  )

  local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
      if c == client.focus then
        c.minimized = true
      else
        c:emit_signal('request::activate', 'tasklist', { raise = true })
      end
    end)
  )

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    buttons = tasklist_buttons
  }

  -- Create the wibox
  s.mywibox = awful.wibar({
    position = 'bottom',
    screen = s,
    height = 24,
    bg = '#1e2227'
  })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    -- Left widgets
    {
      layout = wibox.layout.fixed.horizontal,
      mylauncher,
      s.mytaglist,
      s.mypromptbox,
    },

    -- Middle widget
    s.mytasklist,

    -- Right widgets
    {
      layout = wibox.layout.fixed.horizontal,
      wibox.widget.systray(),
      mytextclock,
      s.mylayoutbox,
    },
  }
end)

-- Mouse bindings
root.buttons(gears.table.join(
  awful.button({}, 3, function() mymainmenu:toggle() end)
))

clientbuttons = gears.table.join(
  awful.button(
    {}, 1,
    function(c)
      c:emit_signal('request::activate', 'mouse_click', { raise = true })
    end
  ),

  awful.button(
    { modkey }, 1,
    function(c)
      c:emit_signal('request::activate', 'mouse_click', { raise = true })
      awful.mouse.client.move(c)
    end
  ),

  awful.button(
    { modkey }, 3,
    function(c)
      c:emit_signal('request::activate', 'mouse_click', { raise = true })
      awful.mouse.client.resize(c)
    end
  )
)

-- Set keys
root.keys(globalkeys)

-- Signals
-- Signal function to execute when a new client appears.
client.connect_signal('manage', function(c)
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

-- Titlebars
-- client.connect_signal('request::titlebars', function(c)
--   -- buttons for the titlebar
--   local buttons = gears.table.join(
--     awful.button(
--       {}, 1,
--       function()
--         c:emit_signal('request::activate', 'titlebar', { raise = true })
--         awful.mouse.client.move(c)
--       end
--     ),
--
--     awful.button(
--       {}, 3,
--       function()
--         c:emit_signal('request::activate', 'titlebar', { raise = true })
--         awful.mouse.client.resize(c)
--       end
--     )
--   )
--
--   awful.titlebar(c): setup {
--     -- Left
--     {
--       -- awful.titlebar.widget.iconwidget(c),
--       buttons = buttons,
--       layout  = wibox.layout.fixed.horizontal
--     },
--
--     -- Middle
--     {
--       { -- Title
--         align  = 'center',
--         widget = awful.titlebar.widget.titlewidget(c)
--       },
--       buttons = buttons,
--       layout  = wibox.layout.flex.horizontal
--     },
--
--     -- Right
--     {
--       awful.titlebar.widget.floatingbutton (c),
--       awful.titlebar.widget.maximizedbutton(c),
--       awful.titlebar.widget.stickybutton   (c),
--       awful.titlebar.widget.ontopbutton    (c),
--       awful.titlebar.widget.closebutton    (c),
--       layout = wibox.layout.fixed.horizontal()
--     },
--
--     layout = wibox.layout.align.horizontal
--   }
-- end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal('mouse::enter', function(c)
  c:emit_signal('request::activate', 'mouse_enter', { raise = false })
end)

-- No border for maximized clients
client.connect_signal('focus', function(c)
  -- c.border_color = beautiful.border_focus,
  c.border_width = 0
end)

client.connect_signal('unfocus', function(c)
  -- c.border_color = beautiful.border_normal,
  c.border_width = 0
end)

