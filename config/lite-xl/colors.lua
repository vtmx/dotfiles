local style = require 'core.style'
local common = require 'core.common'

local c = {
  bd      = { common.color '#1e2227' },
  bg      = { common.color '#23272e' },
  bl      = { common.color '#2c313c' },
  fd      = { common.color '#5c6370' },
  fg      = { common.color '#abb2bf' },
  sel     = { common.color '#3d4556' },
  ac      = { common.color '#eeeeee' },
  red     = { common.color '#e06c75' },
  orange  = { common.color '#d19a66' },
  yellow  = { common.color '#e5c07b' },
  green   = { common.color '#98c379' },
  cyan    = { common.color '#56b6c2' },
  blue    = { common.color '#61afef' },
  magenta = { common.color '#c678dd' },
}

-- General
style.background = c.bg
style.background2 = c.bd
style.background3 = c.bd
style.text = c.fg
style.caret = c.fd
style.accent = c.ac
style.dim = c.fd
style.divider = c.bl
style.selection = c.sel
style.line_number = c.sel
style.line_number2 = c.fg
style.line_highlight = c.bl
style.scrollbar = c.sel
style.scrollbar2 = c.fd
style.scrollbar_track = c.bl
style.nagbar = c.bd
style.nagbar_text = c.fg
style.nagbar_dim = c.bg
style.drag_overlay = c.bg
style.drag_overlay_tab = c.bl
style.good = c.green
style.warn = c.yellow
style.error = c.red
style.modified = c.blue
style.log['INFO']  = { icon = 'I', color = c.blue }
style.log['WARN']  = { icon = 'W', color = c.yellow }
style.log['ERROR'] = { icon = 'E', color = c.red }

-- Syntax
style.syntax['normal'] = c.fg
style.syntax['symbol'] = c.fg
style.syntax['comment'] = c.fd
style.syntax['keyword'] = c.magenta
style.syntax['keyword2'] = c.red
style.syntax['number'] = c.orange
style.syntax['literal'] = c.yellow
style.syntax['string'] = c.green
style.syntax['operator'] = c.cyan
style.syntax['function'] = c.blue

-- Plugins
-- indentguide
style.guide = c.bl
style.guide_highlight = c.sel

