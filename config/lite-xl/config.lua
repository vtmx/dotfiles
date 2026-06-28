local core = require 'core'
local config = require 'core.config'
local command = require 'core.command'

-- Core
-- Wait Lite XL start, to execute commands
core.add_thread(function()
  core.root_view:defer_draw(function()
    command.perform('line-wrapping:disable')
    command.perform('treeview:toggle')
  end)
end)

-- Config
config.always_show_tabs = false
config.tab_close_button = true
config.plugins.autocomplete.min_len = 1

-- Hide statusbar
--core.status_view:hide()
