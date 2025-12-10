#!/usr/bin/env lua

-- hsl2hex
local function hsl2hex(h, s, l)
  h = h % 360
  s = s / 100
  l = l / 100

  local c = (1 - math.abs(2 * l - 1)) * s
  local x = c * (1 - math.abs((h / 60) % 2 - 1))
  local m = l - c / 2

  local r, g, b = 0, 0, 0

  if h < 60 then r, g, b = c, x, 0
    elseif h < 120 then r, g, b = x, c, 0
    elseif h < 180 then r, g, b = 0, c, x
    elseif h < 240 then r, g, b = 0, x, c
    elseif h < 300 then r, g, b = x, 0, c
  else r, g, b = c, 0, x
  end

  r = math.floor((r + m) * 255 + 0.5)
  g = math.floor((g + m) * 255 + 0.5)
  b = math.floor((b + m) * 255 + 0.5)

  return string.format('#%02x%02x%02x', r, g, b)
end

-- Font
local font = {
  family = 'BlexMono Nerd Font Medium',
  size = 11
}

local cursor = {
  color = '#abb2bf',
  shape = 'block',
  blink_interval = 0.5
}

-- Padding
local padding = { x = 8, y = 8 }

-- Color
local color = {}
color.scheme = 'dark'

if color.scheme == 'light' then
  print('no light baby')
else
  color.hue = 220
  color.sat = 15
  color.lgt = 70
end

color.bg = hsl2hex(color.hue, color.sat, 15)
color.fg = hsl2hex(color.hue, color.sat, 70)

-- Color wheel
color.hue_start   = 0
color.hue_limit   = 360
color.hue_step    = 30
color.hue_current = color.hue_start

for i = 1, 12 do
  if color.hue_current >= color.hue_limit then
    color.hue_current = color.hue_current - color.hue_limit
  end
  color[tostring(i)] = hsl2hex(color.hue_current, color.sat, color.lgt)
  print(color.hue_current)  -- mesmo output que o script bash original
  color.hue_current = color.hue_current + color.hue_step
end

color.selection_bg = '#61afef'
color.selection_fg = '#282c34'

-- Show colors
for k, v in pairs(color) do
  print(string.format('color[%s] = %s', k, v))
end
