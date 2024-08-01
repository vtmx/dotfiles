local config = require 'core.config'

config.always_show_tabs = false
config.tab_close_button = true

-- Ingnore file in projects
config.ignore_files = {
  -- folders
  '^%.svn/',        '^%.git/',   '^%.hg/',        '^CVS/', '^%.Trash/', '^%.Trash%-.*/',
  '^node_modules/', '^%.cache/', '^__pycache__/',
  -- files
  '%.pyc$',         '%.pyo$',       '%.exe$',        '%.dll$',   '%.obj$', '%.o$',
  '%.a$',           '%.lib$',       '%.so$',         '%.dylib$', '%.ncb$', '%.sdf$',
  '%.suo$',         '%.pdb$',       '%.idb$',        '%.class$', '%.psd$', '%.db$',
  '^desktop%.ini$', '^%.DS_Store$', '^%.directory$',
}

