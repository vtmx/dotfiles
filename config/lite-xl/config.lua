local core = require 'core'
local config = require 'core.config'
local command = require 'core.command'

config.always_show_tabs = false
config.tab_close_button = true

-- Wait Lite XL to execute command treeview:toggle
core.add_thread(function()
  core.root_view:defer_draw(function()
    command.perform('line-wrapping:disable')
    command.perform('treeview:toggle')
  end)
end)

-- Hide statusbar
--core.status_view:hide()

