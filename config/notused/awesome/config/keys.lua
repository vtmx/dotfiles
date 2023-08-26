local awful = require('awful')
local gears = require('gears')
local hotkeys_popup = require('awful.hotkeys_popup')

-- Key bindings
local modkey = 'Mod4'
local super  = 'Mod4'
local ctrl   = 'Control'
local shift  = 'Shift'
local alt    = 'Mod1'
local tab    = 'Tab'
local escape = 'Escape'
local space  = 'space'
local enter  = 'Return'
local left   = 'Left'
local right  = 'Right'
local up     = 'Up'
local down   = 'Down'

globalkeys = gears.table.join(
  -- Tags
  awful.key(
    { super, ctrl }, 'h', awful.tag.viewprev,
    { description = 'prev tag', group = 'tag'}
  ),

  awful.key(
    { super, ctrl }, 'l', awful.tag.viewnext,
    { description = 'next tag', group = 'tag'}
  ),

  awful.key(
    { super, ctrl }, left, awful.tag.viewprev,
    { description = 'prev tag', group = 'tag'}
  ),

  awful.key(
    { super, ctrl }, right, awful.tag.viewnext,
    { description = 'next tag', group = 'tag'}
  ),

  awful.key(
    { super }, escape, awful.tag.history.restore,
    { description = 'go back', group = 'tag'}
  ),

  -- Client
  awful.key(
    { super }, 'l', function() awful.client.focus.bydirection('right') end,
    { description = 'focus next by index', group = 'client' }
  ),

  awful.key(
    { super }, 'h', function() awful.client.focus.bydirection('left') end,
    { description = 'focus previous by index', group = 'client' }
  ),

  awful.key(
    { super }, 'j', function() awful.client.focus.bydirection('down') end,
    { description = 'focus next by index', group = 'client' }
  ),

  awful.key(
    { super }, 'k', function() awful.client.focus.bydirection('up') end,
    { description = 'focus previous by index', group = 'client' }
  ),

  awful.key(
    { super, shift }, 'j', function() awful.client.swap.byidx(1) end,
    { description = 'swap with next client by index', group = 'client' }
  ),

  awful.key(
    { super, shift }, 'k', function() awful.client.swap.byidx(1) end,
    { description = 'swap with previous client by index', group = 'client' }
  ),

  -- Resize
  awful.key(
    { super, alt }, 'h', function() awful.tag.incmwfact(-0.02) end,
    { description = 'decrease master width factor', group = 'client' }
  ),

  awful.key(
    { super, alt }, 'l', function() awful.tag.incmwfact(0.02) end,
    { description = 'increase master width factor', group = 'client' }
  ),

  awful.key(
    { super, alt }, left, function() awful.tag.incmwfact(-0.02) end,
    { description = 'decrease master width factor', group = 'client' }
  ),

  awful.key(
    { super, alt }, right, function() awful.tag.incmwfact(0.02) end,
    { description = 'increase master width factor', group = 'client' }
  ),

  awful.key(
    { alt }, tab,
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    { description = 'go back', group = 'client' }
  ),

  -- Awesome
  awful.key(
    { super }, '.', function() hotkeys_popup.show_help() end,
    { description='show hotkeys', group='awesome' }
  ),

  awful.key(
    { super, shift }, 'r', awesome.restart,
    { description = 'reload awesome', group = 'awesome' }
  ),

  awful.key(
    { super }, 'w', function() mymainmenu:show() end,
    { description = 'show main menu', group = 'awesome' }
  ),

  awful.key(
    { super }, 'r', function() awful.screen.focused().mypromptbox:run() end,
    { description = 'run prompt', group = 'awesome' }
  ),

  awful.key(
    { super, shift }, 'q', awesome.quit,
    { description = 'quit awesome', group = 'awesome' }
  ),

  awful.key(
  { modkey }, 'x',
  function()
    awful.prompt.run {
      prompt       = 'Run Lua code: ',
      textbox      = awful.screen.focused().mypromptbox.widget,
      exe_callback = awful.util.eval,
      history_path = awful.util.get_cache_dir() .. '/history_eval'
    }
  end,
  { description = 'lua execute prompt', group = 'awesome' }),

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
    { super, }, enter, function() awful.spawn(terminal) end,
    { description = 'terminal', group = 'apps' }
  ),

  -- awful.key(
  --   { super, 'Shift' }, 'h', function() awful.tag.incnmaster( 1, nil, true) end,
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
    { description = 'next layout', group = 'extras' }
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
    { description = 'restore minimized', group = 'client' }
  ),

  awful.key(
    { super }, 'p',
    function() menubar.show() end,
    { description = 'show the menubar', group = 'awesome' })
  )

clientkeys = gears.table.join(
  awful.key({ super }, 'f',
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = 'toggle fullscreen', group = 'client' }
  ),

  awful.key(
    { super, shift }, 'f', awful.client.floating.toggle,
    { description = 'toggle floating', group = 'client' }
  ),

  awful.key(
    { super }, 'c', function(c) c:kill() end,
    { description = 'close', group = 'client' }
  ),

  awful.key(
    { super, ctrl }, enter, function(c) c:swap(awful.client.getmaster()) end,
    { description = 'move to master', group = 'client' }
  ),

  awful.key(
    { super }, 'o', function(c) c:move_to_screen() end,
    { description = 'move to screen', group = 'client' }
  ),

  awful.key(
    { super }, 't', function(c) c.ontop = not c.ontop end,
    { description = 'toggle keep on top', group = 'client' }
  ),

  awful.key({ super }, 'n',
    function (c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end ,
    { description = 'minimize', group = 'client' }
  ),

  awful.key(
    { super }, 'm',
    function (c)
      c.maximized = not c.maximized
      c:raise()
    end,
    { description = '(un)maximize', group = 'client' }
  ),

  awful.key(
    { super, ctrl }, 'm',
    function (c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end ,
    { description = '(un)maximize vertically', group = 'client' }
  ),
   
  awful.key(
    { modkey, shift }, 'm',
    function (c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end,
    { description = '(un)maximize horizontally', group = 'client' }
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
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
           tag:view_only()
        end
      end,
      { description = 'view tag #'..i, group = 'tag' }
    ),

    -- Toggle tag display.
    awful.key(
      { super, ctrl }, '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
           awful.tag.viewtoggle(tag)
        end
      end,
      { description = 'toggle tag #' .. i, group = 'tag' }
    ),

    -- Move client to tag.
    awful.key(
      { super, shift }, '#' .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      { description = 'move focused client to tag #'..i, group = 'tag' }
    ),

    -- Toggle tag on focused client.
    awful.key(
      { super, ctrl, shift }, '#' .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      { description = 'toggle focused client on tag #' .. i, group = 'tag' }
    )
  )
end
