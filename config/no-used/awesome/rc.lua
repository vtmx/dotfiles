-- Requires
pcall(require, 'luarocks.loader')
require('awful.autofocus')

-- Disable VIM keys
-- require('awful.hotkeys_popup.keys')

-- Standard libs
local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local naughty = require('naughty')
local menubar = require('menubar')
local hotkeys_popup = require('awful.hotkeys_popup')

-- My libs
local keys = require('keys')

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
  awesome.connect_signal('debug::error', function (err)
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
beautiful.init(gears.filesystem.get_themes_dir() .. 'default/theme.lua')

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
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button({ }, 1, function(t) t:view_only() end),

  awful.button({ modkey }, 1, function(t)
      if client.focus then
          client.focus:move_to_tag(t)
      end
  end),

  awful.button({ }, 3, awful.tag.viewtoggle),

  awful.button({ modkey }, 3, function(t)
    if client.focus then
        client.focus:toggle_tag(t)
    end
  end),

  awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
  awful.button({ }, 1, function (c)
      if c == client.focus then
          c.minimized = true
      else
          c:emit_signal(
              'request::activate',
              'tasklist',
              {raise = true}
          )
      end
  end),

  awful.button({ }, 3, function()
    awful.menu.client_list({ theme = { width = 250 } })
  end),

  awful.button({ }, 4, function ()
    awful.client.focus.byidx(1)
  end),

  awful.button({ }, 5, function ()
    awful.client.focus.byidx(-1)
  end)
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

  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)))

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
  s.mywibox = awful.wibar({ position = 'bottom', screen = s })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        mylauncher,
        s.mytaglist,
        s.mypromptbox,
    },

    s.mytasklist, -- Middle widget
    { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        mykeyboardlayout,
        wibox.widget.systray(),
        mytextclock,
        s.mylayoutbox,
    },
  }
end)

-- Mouse bindings
root.buttons(gears.table.join(
  awful.button({ }, 3, function () mymainmenu:toggle() end),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))

-- Key bindings
modkey = 'Mod4'
super  = 'Mod4'
ctrl   = 'Control'
shift  = 'Shift'
alt    = 'Mod1'
tab    = 'Tab'
escape = 'Escape'
space  = 'space'
enter  = 'Return'
left   = 'Left'
right  = 'Right'
up     = 'Up'
down   = 'Down'

globalkeys = gears.table.join(
  -- Tags
  awful.key(
    { super, ctrl }, 'h', awful.tag.viewprev,
    { description = 'prev tag', group = 'Tag'}
  ),

  awful.key(
    { super, ctrl }, 'l', awful.tag.viewnext,
    { description = 'next tag', group = 'Tag'}
  ),

  awful.key(
    { super, ctrl }, left, awful.tag.viewprev,
    { description = 'prev tag', group = 'Tag'}
  ),

  awful.key(
    { super, ctrl }, right, awful.tag.viewnext,
    { description = 'next tag', group = 'Tag'}
  ),

  awful.key(
    { super }, escape, awful.tag.history.restore,
    { description = 'go back', group = 'Tag'}
  ),

  -- Client
  awful.key(
    { super }, 'j', function() awful.client.focus.byidx(1) end,
    { description = 'focus next by index', group = 'Client' }
  ),

  awful.key(
    { super }, 'k', function () awful.client.focus.byidx(-1) end,
    { description = 'focus previous by index', group = 'Client' }
  ),

  awful.key(
    { super, shift }, 'j', function() awful.client.swap.byidx(1) end,
    { description = 'swap with next client by index', group = 'Client' }
  ),

  awful.key(
    { super, shift }, 'k', function() awful.client.swap.byidx(1) end,
    { description = 'swap with previous client by index', group = 'Client' }
  ),

  -- Resize
  awful.key(
    { super, alt }, 'h', function() awful.tag.incmwfact(-0.02) end,
    { description = 'decrease master width factor', group = 'Client' }
  ),

  awful.key(
    { super, alt }, 'l', function() awful.tag.incmwfact(0.02) end,
    { description = 'increase master width factor', group = 'Client' }
  ),

  awful.key(
    { super, alt }, left, function() awful.tag.incmwfact(-0.02) end,
    { description = 'decrease master width factor', group = 'Client' }
  ),

  awful.key(
    { super, alt }, right, function() awful.tag.incmwfact(0.02) end,
    { description = 'increase master width factor', group = 'Client' }
  ),

  awful.key(
    { alt }, tab,
    function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    { description = 'go back', group = 'client' }
  ),

  -- Extras
  awful.key(
    { super }, '.', hotkeys_popup.show_help,
    { description='show hotkeys', group='Help' }
  ),

  awful.key(
    { super }, 'w', function () mymainmenu:show() end,
    { description = 'show main menu', group = 'Menu' }
  ),

  awful.key(
    { super, shift }, 'r', awesome.restart,
    { description = 'reload awesome', group = 'Awesome' }
  ),

  awful.key(
    { super, shift }, 'q', awesome.quit,
    { description = 'quit awesome', group = 'Awesome' }
  ),

  awful.key(
    { modkey }, 'r',
    function()
      awful.screen.focused().mypromptbox:run()
    end,
    { description = 'run prompt', group = 'Extras' }
  ),

  awful.key(
  { modkey }, 'x',
  function ()
    awful.prompt.run {
      prompt       = 'Run Lua code: ',
      textbox      = awful.screen.focused().mypromptbox.widget,
      exe_callback = awful.util.eval,
      history_path = awful.util.get_cache_dir() .. '/history_eval'
    }
  end,
  { description = 'lua execute prompt', group = 'Awesome' }),

  -- Layout manipulation
  awful.key(
    { super, control }, 'j', function() awful.screen.focus_relative() end,
    { description = 'focus the next screen', group = 'screen' }
  ),

  awful.key(
    { super, control }, 'k', function() awful.screen.focus_relative() end,
    { description = 'focus the previous screen', group = 'screen' }
  ),

  -- awful.key(
  --   { super, }, 'u', awful.client.urgent.jumpto,
  --   { description = 'jump to urgent client', group = 'client' }
  -- ),

  -- Apps
  awful.key(
    { super, }, enter, function () awful.spawn(terminal) end,
    { description = 'terminal', group = 'Apps' }
  ),

  -- awful.key(
  --   { super, 'Shift'   }, 'h', function() awful.tag.incnmaster( 1, nil, true) end,
  --   { description = 'increase the number of master clients', group = 'layout' }
  -- ),
  --
  -- awful.key(
  --   { super, 'Shift'   }, 'l', function() awful.tag.incnmaster(-1, nil, true) end,
  --   { description = 'decrease the number of master clients', group = 'layout' }
  -- ),
  --
  -- awful.key(
  --   { super, 'Control' }, 'h', function() awful.tag.incncol( 1, nil, true) end,
  --   { description = 'increase the number of columns', group = 'layout' }
  -- ),
  --
  -- awful.key(
  --   { super, 'Control' }, 'l', function() awful.tag.incncol(-1, nil, true) end,
  --   { description = 'decrease the number of columns', group = 'layout' }
  -- ),

  -- Layout
  awful.key(
    { super, shift }, space, function() awful.layout.inc(1) end,
    { description = 'next layout', group = 'Extras' }
  ),

  -- awful.key(
  --   { super, shift }, space, function() awful.layout.inc(-1) end,
  --   { description = 'select previous', group = 'layout' }
  -- ),

  awful.key(
    { modkey, ctrl }, 'n',
    function()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
          c:emit_signal('request::activate', 'key.unminimize', {raise = true} )
        end
    end,
    { description = 'restore minimized', group = 'Client' }
  ),

  awful.key(
    { super }, 'p',
    function() menubar.show() end,
    { description = 'show the menubar', group = 'Awesome' })
  )

clientkeys = gears.table.join(
  awful.key({ super }, 'f',
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = 'toggle fullscreen', group = 'Client' }
  ),

  awful.key(
    { super, shift }, 'f', awful.client.floating.toggle,
    { description = 'toggle floating', group = 'Client' }
  ),

  awful.key(
    { super }, 'c', function(c) c:kill() end,
    { description = 'close', group = 'Client' }
  ),

  awful.key(
    { super, ctrl }, enter, function(c) c:swap(awful.client.getmaster()) end,
    { description = 'move to master', group = 'Client' }
  ),

  awful.key(
    { super }, 'o', function(c) c:move_to_screen() end,
    { description = 'move to screen', group = 'Client' }
  ),

  awful.key(
    { super }, 't', function(c) c.ontop = not c.ontop end,
    { description = 'toggle keep on top', group = 'Client' }
  ),

  awful.key({ super }, 'n',
    function (c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end ,
    { description = 'minimize', group = 'Client' }
  ),

  awful.key(
    { super }, 'm',
    function (c)
      c.maximized = not c.maximized
      c:raise()
    end,
    { description = '(un)maximize', group = 'Client' }
  ),

  awful.key(
    { super, ctrl }, 'm',
    function (c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end ,
    { description = '(un)maximize vertically', group = 'Client' }
  ),
   
  awful.key(
    { modkey, shift }, 'm',
    function (c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end,
    { description = '(un)maximize horizontally', group = 'Client' }
  )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    -- View tag only.
    awful.key(
      { super }, '#' .. i + 9,
      function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
           tag:view_only()
        end
      end,
      { description = 'view tag #'..i, group = 'Tag' }
    ),

    -- Toggle tag display.
    awful.key(
      { super, ctrl }, '#' .. i + 9,
      function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
           awful.tag.viewtoggle(tag)
        end
      end,
      { description = 'toggle tag #' .. i, group = 'Tag' }
    ),

    -- Move client to tag.
    awful.key(
      { super, shift }, '#' .. i + 9,
      function ()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      { description = 'move focused client to tag #'..i, group = 'Tag' }
    ),

    -- Toggle tag on focused client.
    awful.key(
      { super, ctrl, shift }, '#' .. i + 9,
      function ()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      { description = 'toggle focused client on tag #' .. i, group = 'Tag' }
    )
  )
end

clientbuttons = gears.table.join(
  awful.button(
    { }, 1,
    function (c)
      c:emit_signal('request::activate', 'mouse_click', {raise = true})
    end
  ),

  awful.button(
    { modkey }, 1,
    function (c)
      c:emit_signal('request::activate', 'mouse_click', {raise = true})
      awful.mouse.client.move(c)
    end
  ),

  awful.button(
    { modkey }, 3,
    function (c)
      c:emit_signal('request::activate', 'mouse_click', {raise = true})
      awful.mouse.client.resize(c)
    end
  )
)

-- Set keys
root.keys(globalkeys)

-- Rules
-- Rules to apply to new clients (through the 'manage' signal).
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  },

  -- Floating clients.
  {
    rule_any = {
      instance = {
        'DTA',  -- Firefox addon DownThemAll.
        'copyq',  -- Includes session name in class.
        'pinentry',
      },
      class = {
        'Arandr',
        'Blueman-manager',
        'Gpick',
        'Kruler',
        'MessageWin',  -- kalarm.
        'Sxiv',
        'Tor Browser', -- Needs a fixed window size to avoid fingerprinting by screen size.
        'Wpa_gui',
        'veromix',
        'xtightvncviewer'
      },

      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        'Event Tester',  -- xev.
      },
      role = {
        'AlarmWindow',  -- Thunderbird's calendar.
        'ConfigManager',  -- Thunderbird's about:config.
        'pop-up',       -- e.g. Google Chrome's (detached) Developer Tools.
      }
    },
    properties = { floating = true }
  },

  -- Add titlebars to normal clients and dialogs
  {
    rule_any = {
      type = { 'normal', 'dialog' }
    },
    properties = { titlebars_enabled = true }
  },

    -- Set Firefox to always map on the tag named '2' on screen 1.
    -- { rule = { class = 'Firefox' },
    --   properties = { screen = 1, tag = '2' } },
}

-- Signals
-- Signal function to execute when a new client appears.
client.connect_signal('manage', function (c)
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
client.connect_signal('request::titlebars', function(c)
  -- buttons for the titlebar
  local buttons = gears.table.join(
    awful.button(
      { }, 1,
      function()
        c:emit_signal('request::activate', 'titlebar', {raise = true})
        awful.mouse.client.move(c)
      end
    ),

    awful.button(
      { }, 3,
      function()
        c:emit_signal('request::activate', 'titlebar', {raise = true})
        awful.mouse.client.resize(c)
      end
    )
  )

  awful.titlebar(c) : setup {
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
      { -- Title
        align  = 'center',
        widget = awful.titlebar.widget.titlewidget(c)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      awful.titlebar.widget.floatingbutton (c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.stickybutton   (c),
      awful.titlebar.widget.ontopbutton    (c),
      awful.titlebar.widget.closebutton    (c),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal('mouse::enter', function(c)
    c:emit_signal('request::activate', 'mouse_enter', {raise = false})
end)

client.connect_signal('focus', function(c)
  c.border_color = beautiful.border_focus
end)

client.connect_signal('unfocus', function(c)
  c.border_color = beautiful.border_normal
end)
