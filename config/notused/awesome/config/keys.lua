local M = {}

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
    { super, ctrl }, 'h',
    awful.tag.viewprev,
    { description = 'Prev tag', group = 'Tag'}
  ),

  awful.key(
    { super, ctrl }, 'l',
    awful.tag.viewnext,
    { description = 'Next tag', group = 'Tag'}
  ),

  awful.key(
    { super, ctrl }, left,
    awful.tag.viewprev,
    { description = 'Prev tag', group = 'Tag'}
  ),

  awful.key(
    { super, ctrl }, right,
    awful.tag.viewnext,
    { description = 'Next tag', group = 'Tag'}
  ),

  -- Client
  awful.key(
    { super }, 'l',
    function() awful.client.focus.bydirection('right') end,
    { description = 'Focus next by index', group = 'Client' }
  ),

  awful.key(
    { super }, 'h',
    function() awful.client.focus.bydirection('left') end,
    { description = 'Focus previous by index', group = 'Client' }
  ),

  awful.key(
    { super }, 'j',
    function() awful.client.focus.bydirection('down') end,
    { description = 'Focus next by index', group = 'Client' }
  ),

  awful.key(
    { super }, 'k',
    function() awful.client.focus.bydirection('up') end,
    { description = 'Focus previous by index', group = 'Client' }
  ),

  awful.key(
    { super, shift }, 'j',
    function() awful.client.swap.byidx(1) end,
    { description = 'Swap with next client by index', group = 'Client' }
  ),

  awful.key(
    { super, shift }, 'k',
    function() awful.client.swap.byidx(1) end,
    { description = 'Swap with previous client by index', group = 'Client' }
  ),

  -- Resize
  awful.key(
    { super, alt }, 'h',
    function() awful.tag.incmwfact(-0.02) end,
    { description = 'Decrease master width factor', group = 'Client' }
  ),

  awful.key(
    { super, alt }, 'l',
    function() awful.tag.incmwfact(0.02) end,
    { description = 'Increase master width factor', group = 'Client' }
  ),

  awful.key(
    { super, alt }, left,
    function() awful.tag.incmwfact(-0.02) end,
    { description = 'Decrease master width factor', group = 'Client' }
  ),

  awful.key(
    { super, alt }, right,
    function() awful.tag.incmwfact(0.02) end,
    { description = 'Increase master width factor', group = 'Client' }
  ),

  awful.key(
    { alt }, tab,
    function()
      awful.client.focus.history.previous()
      if client.focus then client.focus:raise() end
    end,
    { description = 'Go back', group = 'Client' }
  ),

  -- Awesome
  awful.key(
    { super }, '.',
    function() hotkeys_popup.show_help() end,
    { description='Show hotkeys', group='Awesome' }
  ),

  awful.key(
    { super, shift }, 'r',
    awesome.restart,
    { description = 'Reload awesome', group = 'Awesome' }
  ),

  awful.key(
    { super }, 'w',
    function() mymainmenu:show() end,
    { description = 'Show menu', group = 'Awesome' }
  ),

  awful.key(
    { super }, 'r',
    function() awful.screen.focused().mypromptbox:run() end,
    { description = 'Run prompt', group = 'Awesome' }
  ),

  awful.key(
    { super, shift }, 'q',
    awesome.quit,
    { description = 'Quit awesome', group = 'Awesome' }
  ),

  -- Layout manipulation
  awful.key(
    { super, control }, 'j',
    function() awful.screen.focus_relative() end,
    { description = 'Focus the next screen', group = 'screen' }
  ),

  awful.key(
    { super, control }, 'k',
    function() awful.screen.focus_relative() end,
    { description = 'Focus the previous screen', group = 'screen' }
  ),

  -- Terminal
  awful.key(
    { super, }, enter,
    function() awful.spawn(terminal) end,
    { description = 'Terminal', group = 'Apps' }
  ),

  -- Layout
  awful.key(
    { super, shift }, space,
    function() awful.layout.inc(1) end,
    { description = 'next layout', group = 'Awesome' }
  )
)

--------------------------------------------------------------------------

clientkeys = gears.table.join(
  awful.key(
    { super }, 'c',
    function(c) c:kill() end,
    { description = 'Close', group = 'Client' }
  ),

  awful.key({ super }, 'f',
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = 'Toggle fullscreen', group = 'Client' }
  ),

  awful.key(
    { super, shift }, 'f',
    awful.client.floating.toggle,
    { description = 'Toggle floating', group = 'Client' }
  )
)

for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    awful.key(
      { super }, '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then tag:view_only() end
      end,
      { description = 'Go tag #'..i, group = 'Tag' }
    ),

    awful.key(
      { super, ctrl }, '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then awful.tag.viewtoggle(tag) end
      end,
      { description = 'Toggle tag #' .. i, group = 'Tag' }
    ),

    awful.key(
      { super, shift }, '#' .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then client.focus:move_to_tag(tag) end
        end
      end,
      { description = 'Move focused client to tag #'..i, group = 'Tag' }
    ),

    awful.key(
      { super, ctrl, shift }, '#' .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then client.focus:toggle_tag(tag) end
        end
      end,
      { description = 'Toggle focused client on tag #' .. i, group = 'Tag' }
    )
  )
end

return M
