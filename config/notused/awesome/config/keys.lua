local awful = require('awful')
local gears = require('gears')
local hotkeys_popup = require('awful.hotkeys_popup')

-- Key bindings
local mod    = 'Mod4'
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

-- awful.keyboard.append_global_keybindings(
--   awful.key(
--     { mod, ctrl }, 'h', awful.tag.viewprev,
--     { description = 'Prev tag', group = 'Tag' }
--   )
-- )

globalkeys = gears.table.join(
  -- Tags

  awful.key(
    { mod, ctrl }, 'h', awful.tag.viewprev,
    { description = 'Prev tag', group = 'Tag' }
  ),

  awful.key(
    { mod, ctrl }, 'l', awful.tag.viewnext,
    { description = 'Next tag', group = 'Tag' }
  ),

  awful.key(
    { mod, ctrl }, left, awful.tag.viewprev,
    { description = 'Prev tag', group = 'Tag' }
  ),

  awful.key(
    { mod, ctrl }, right, awful.tag.viewnext,
    { description = 'Next tag', group = 'Tag' }
  ),

  awful.key({ mod, ctrl, shift }, 'l', function()
    local screen = awful.screen.focused()
    local current_tag = screen.selected_tag
    if current_tag then
      local index = current_tag.index + 1
      if index > #screen.tags then index = 1 end
      if client.focus then
        client.focus:move_to_tag(screen.tags[index])
        screen.tags[index]:view_only()
      end
    end
  end,
  { description = 'Move client to next tag', group = 'Tag' }),

  awful.key({ mod, ctrl, shift }, 'h', function()
    local screen = awful.screen.focused()
    local current_tag = screen.selected_tag
    if current_tag then
      local index = current_tag.index - 1
      if index == 0 then index = #screen.tags end
      if client.focus then
        client.focus:move_to_tag(screen.tags[index])
        screen.tags[index]:view_only()
      end
    end
  end,
  { description = 'Move client to prev tag', group = 'Tag' }),

  -- Client

  awful.key(
    { mod }, 'l', function() awful.client.focus.bydirection('right') end,
    { description = 'Focus next by index', group = 'Client' }
  ),

  awful.key(
    { mod }, 'h', function() awful.client.focus.bydirection('left') end,
    { description = 'Focus previous by index', group = 'Client' }
  ),

  awful.key(
    { mod }, 'j', function() awful.client.focus.bydirection('down') end,
    { description = 'Focus next by index', group = 'Client' }
  ),

  awful.key(
    { mod }, 'k', function() awful.client.focus.bydirection('up') end,
    { description = 'Focus previous by index', group = 'Client' }
  ),

  awful.key(
    { mod, shift }, 'j', function() awful.client.swap.byidx(1) end,
    { description = 'Swap with next client by index', group = 'Client' }
  ),

  awful.key(
    { mod, shift }, 'k', function() awful.client.swap.byidx(1) end,
    { description = 'Swap with previous client by index', group = 'Client' }
  ),

  -- Resize

  awful.key(
    { mod, alt }, 'h', function() awful.tag.incmwfact(-0.02) end,
    { description = 'Decrease master width factor', group = 'Client' }
  ),

  awful.key(
    { mod, alt }, 'l', function() awful.tag.incmwfact(0.02) end,
    { description = 'Increase master width factor', group = 'Client' }
  ),

  awful.key(
    { mod, alt }, left, function() awful.tag.incmwfact(-0.02) end,
    { description = 'Decrease master width factor', group = 'Client' }
  ),

  awful.key(
    { mod, alt }, right, function() awful.tag.incmwfact(0.02) end,
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
    { mod }, '.', function() hotkeys_popup.show_help() end,
    { description='Show hotkeys', group='Awesome' }
  ),

  awful.key(
    { mod, shift }, 'r', awesome.restart,
    { description = 'Reload awesome', group = 'Awesome' }
  ),

  awful.key(
    { mod }, 'w', function() mymainmenu:show() end,
    { description = 'Show menu', group = 'Awesome' }
  ),

  awful.key(
    { mod }, 'r', function() awful.screen.focused().mypromptbox:run() end,
    { description = 'Run prompt', group = 'Awesome' }
  ),

  awful.key(
    { mod, shift }, 'q', awesome.quit,
    { description = 'Quit awesome', group = 'Awesome' }
  ),

  -- Layout manipulation

  awful.key(
    { mod, control }, 'j', function() awful.screen.focus_relative() end,
    { description = 'Focus the next screen', group = 'Screen' }
  ),

  awful.key(
    { mod, control }, 'k', function() awful.screen.focus_relative() end,
    { description = 'Focus the previous screen', group = 'Screen' }
  ),

  -- Terminal

  awful.key(
    { mod }, enter, function() awful.spawn(terminal) end,
    { description = 'Terminal', group = 'Apps' }
  ),

  -- Browser

  awful.key(
    { mod }, 'b', function() awful.spawn('firefox') end,
    { description = 'Browser', group = 'Apps' }
  ),

  -- Layout

  awful.key(
    { mod, shift }, space, function() awful.layout.inc(1) end,
    { description = 'Next layout', group = 'Awesome' }
  )
)

for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    awful.key(
      { mod }, '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then tag:view_only() end
      end,
      { description = 'Go tag '..i, group = 'Tag' }
    ),

    awful.key(
      { mod, shift }, '#' .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
            tag:view_only()
          end
        end
      end,
      { description = 'Move client to tag '..i, group = 'Tag' }
    )
  )
end

-- Client

clientkeys = gears.table.join(
  awful.key(
    { mod }, 'c',
    function(c) c:kill() end,
    { description = 'Close', group = 'Client' }
  ),

  awful.key({ mod }, 'f',
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = 'Toggle fullscreen', group = 'Client' }
  ),

  awful.key(
    { mod, shift }, 'f', awful.client.floating.toggle,
    { description = 'Toggle floating', group = 'Client' }
  )
)
