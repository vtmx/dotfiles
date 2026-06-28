local keymap = require 'core.keymap'

local keymaps = {
  -- File
  ['ctrl+t'] = 'core:new-doc',

  -- Treeview
  ['ctrl+e'] = 'treeview:toggle',

  -- Doc
  ['ctrl+shift+z'] = 'doc:redo',

  -- Tab
  ['ctrl+pageup'] = 'root:switch-to-next-tab',
  ['ctrl+pagedown'] = 'root:switch-to-previous-tab',
  ['ctrl+shift+pageup'] = 'root:move-tab-left',
  ['ctrl+shift+pagedown'] = 'root:move-tab-right',

  -- Pane
  ['alt+v'] = 'root:split-right',
  ['alt+h'] = 'root:switch-to-left',
  ['alt+j'] = 'root:switch-to-down',
  ['alt+k'] = 'root:switch-to-up',
  ['alt+l'] = 'root:switch-to-right',

  -- Find Replace
  ['ctrl+h'] = 'find-replace:replace',

  -- Line
  ['ctrl+alt+j'] = 'doc:move-lines-down',
  ['ctrl+alt+k'] = 'doc:move-lines-up',

  -- Comment
  ['ctrl+/'] = 'doc:toggle-line-comments',

  -- Autocomplete
  ['ctrl+n'] = 'autocomplete:next',
  ['ctrl+p'] = 'autocomplete:previous',
  ['ctrl+y'] = 'autocomplete:complete',
  ['ctrl+c'] = 'autocomplete:cancel',

  -- Centerdoc
  ['alt+z'] = 'center-doc:toggle',
  ['ctrl+alt+z'] = 'center-doc:zen-mode-toggle',
  ['f11'] = { 'core:toggle-fullscreen', 'center-doc:zen-mode-toggle' },

  -- Open config
  ['ctrl+,'] = 'doc:open-file "' .. USERDIR .. '/config.lua"',

  -- Open keymaps
  ['ctrl+.'] = 'doc:open-file "' .. USERDIR .. '/keymap.lua"',

  -- Restart
  ['ctrl+r'] = 'core:restart',
}

keymap.add(keymaps)
