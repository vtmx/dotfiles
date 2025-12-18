local style = require 'core.style'
local common = require 'core.common'

local color = {
  bd      = { common.color '#1e2227' },
  bg      = { common.color '#23272e' },
  bl      = { common.color '#2c313c' }, -- cursorline and sel
  fd      = { common.color '#5c6370' }, -- comment
  fg      = { common.color '#abb2bf' },
  ac      = { common.color '#3d4556' }, -- selection and accent
  red     = { common.color '#e06c75' },
  orange  = { common.color '#d19a66' },
  yellow  = { common.color '#e5c07b' },
  green   = { common.color '#98c379' },
  cyan    = { common.color '#56b6c2' },
  blue    = { common.color '#61afef' },
  magenta = { common.color '#c678dd' },
}

-- General
style.background = color.bg
style.background2 = color.bd
style.background3 = color.bd
style.text = color.fg
style.caret = color.fd
style.accent = color.ac
style.dim = color.fd
style.divider = color.bl
style.selection = color.ac
style.line_number = color.ac
style.line_number2 = color.fg
style.line_highlight = color.bl
style.scrollbar = color.ac
style.scrollbar2 = color.fd
style.scrollbar_track = color.bl
style.nagbar = color.bd
style.nagbar_text = color.fg
style.nagbar_dim = color.bg
style.drag_overlay = color.bg
style.drag_overlay_tab = color.bl
style.good = color.green
style.warn = color.yellow
style.error = color.red
style.modified = color.blue
style.log["INFO"]  = { icon = "i", color = color.blue }
style.log["WARN"]  = { icon = "!", color = color.yellow }
style.log["ERROR"] = { icon = "!", color = color.red }

-- Syntax
style.syntax['normal'] = color.fg
style.syntax['symbol'] = color.fg
style.syntax['comment'] = color.fd
style.syntax['keyword'] = color.magenta
style.syntax['keyword2'] = color.red
style.syntax['number'] = color.orange
style.syntax['literal'] = color.yellow
style.syntax['string'] = color.green
style.syntax['operator'] = color.cyan
style.syntax['function'] = color.blue

-- Plugins
-- indentguide
style.guide = color.bl
style.guide_highlight = color.ac

