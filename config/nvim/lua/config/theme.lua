local c = require('config.colors')

local hl_groups = {
  -- General
  Normal         = { fg = c.fg, ctermfg = 255, ctermbg = 234 },
  Comment        = { fg = c.fgd, ctermfg = 7, italic = true },
  Title          = { fg = c.purple  },
  Twilight       = { fg = c.fgd },

  -- Sintaxy
  Boolean        = { fg = c.orange },
  Character      = { fg = c.green  },
  Conditional    = { fg = c.purple },
  Constant       = { fg = c.orange },
  Define         = { fg = c.purple },
  ErrorMsg       = { fg = c.red    },
  Exception      = { fg = c.purple },
  Float          = { fg = c.orange },
  Function       = { fg = c.blue   },
  Identifier     = { fg = c.red    },
  Include        = { fg = c.purple },
  Keyword        = { fg = c.purple },
  Label          = { fg = c.red    },
  Macro          = { fg = c.red    },
  Number         = { fg = c.orange },
  Operator       = { fg = c.cyan   },
  PreCondit      = { fg = c.purple },
  PreProc        = { fg = c.purple },
  Repeat         = { fg = c.purple },
  Tag            = { fg = c.green  },
  Statement      = { fg = c.purple },
  String         = { fg = c.green  },

  -- Keys [] {} ()
  Type           = { fg = c.purple },
  Typedef        = { fg = c.purple },
  StorageClass   = { fg = c.purple },
  Structure      = { fg = c.purple },

  -- Extras
  Debug          = { fg = c.yellow  },
  Directory      = { fg = c.blue    },
  EndOfBuffer    = { fg = c.fgd     },
  NonText        = { fg = c.fgd     },
  Special        = { fg = c.blue    },
  SpecialChar    = { fg = c.yellow  },
  SpecialComment = { fg = c.fgd     },
  SpecialKey     = { fg = c.cyan    },
  TermCursor     = { fg = c.fg      },

  -- Float popup
  NormalFloat    = { bg = c.bg },
  FloatBorder    = { bg = c.bg },

  -- Search
  Delimiter      = { fg = c.purple },
  IncSearch      = { bg = c.sel    },
  MatchParen     = { fg = c.yellow },
  Search         = { bg = c.sel    },

  -- Messages
  ModeMsg        = { fg = c.fgd     },
  MoreMsg        = { fg = c.fgd     },
  Question       = { fg = c.fg      },
  WarningMsg     = { fg = c.yellow  },

  -- Alerts
  Ignore         = { fg = c.fg      },
  Error          = { fg = c.red     },
  Todo           = { fg = c.purple  },

  -- Line tilde blank
  EndOfBuffer    = { fg = c.bg },

  -- Line highlight
  CursorLine     = { bg = c.bgl },

  -- Select text
  Visual         = { bg = c.sel },

  -- Line number column
  CursorLineFold = { fg = c.fg  },
  CursorLineNr   = { fg = c.fg  },
  CursorLineSign = { fg = c.fg  },
  LineNr         = { fg = c.sel },
  LineNrAbove    = { fg = c.fgd },
  LineNrBelow    = { fg = c.fgd },

  -- Pmenu
  Pmenu          = { bg = c.bgd },
  PmenuSbar      = { bg = c.bgd },
  PmenuSel       = { bg = c.bgl },
  PmenuThumb     = { bg = c.bgl },

  -- Pmenu coc
  CocFloating       = { bg = c.bgd  },
  CocFloatSbar      = { bg = c.bgd  },
  CocFloatThumb     = { bg = c.bgl  },
  CocMenuSel        = { bg = c.bgl  },
  CocPumDetail      = { fg = c.fgd  },
  CocPumMenu        = { bg = c.bgd  },
  CocPumShortcut    = { fg = c.fgd  },
  CocPumVirtualText = { fg = c.fgd  },
  CocSearch         = { fg = c.blue },

  -- Tab bar
  WinbarNC          = { fg = c.fgd },

  -- Line win separator split
  StatusLine        = { bg = 'NONE' },
  StatusLineNC      = { fg = c.fg   },
  WinSeparator      = { fg = c.sel  },

  --Diff
  DiffAdd           = { fg = c.fgd },
  DiffDelete        = { fg = c.fgd },
  DiffChange        = { fg = c.fgd },
  DiffText          = { fg = c.fgd },

  -- Languages

  -- html
  htmlArg            = { fg = c.yellow }, -- attr
  htmlH1             = { fg = c.fg     },
  htmlH2             = { fg = c.fg     },
  htmlH3             = { fg = c.fg     },
  htmlH4             = { fg = c.fg     },
  htmlH5             = { fg = c.fg     },
  htmlH6             = { fg = c.fg     },
  htmlSpecialTagName = { fg = c.red    },
  htmlTag            = { fg = c.fg     },
  htmlTagName        = { fg = c.red    },
  htmlTitle          = { fg = c.fg     },
  htmlLink           = { fg = c.fg     },

  -- markdown
  markdownBlockquote       = { fg = c.fg     },
  markdownCodeDelimiter    = { fg = c.fg     },
  markdownId               = { fg = c.purple },
  markdownH1               = { fg = c.purple },
  markdownH2               = { fg = c.purple },
  markdownH3               = { fg = c.purple },
  markdownH4               = { fg = c.purple },
  markdownH5               = { fg = c.purple },
  markdownH6               = { fg = c.purple },
  markdownHeadingDelimiter = { fg = c.purple },
  markdownHeadingRule      = { fg = c.purple },
  markdownListMarker       = { fg = c.yellow },
  markdownRule             = { fg = c.purple },
  markdownUrl              = { fg = c.fg     },

  -- css
  cssClassNameDot = { fg = c.orange },
  cssClassName    = { fg = c.orange },
  cssHacks        = { fg = c.fg     },
  cssTagName      = { fg = c.red    },
  cssVendor       = { fg = c.fg     },

  -- Plugins

  -- indent-line
  IblIndent = { fg = c.sel },

  -- bufferline
  BufferLineCloseButtonVisible = { bg = 'NONE' },
  BufferLineIndicatorVisible   = { bg = 'NONE' },
  BufferLineModified           = { bg = 'NONE' },

  -- hop
  HopNextKey               = { fg = c.red    },
  HopNextKey1              = { fg = c.blue   },
  HopNextKey2              = { fg = c.orange },
  HopNextKey3              = { fg = c.purple },
  HopUnmatched             = { fg = c.fgd    },

  -- lazy
  LazyNormal               = { bg = c.bgd },

  -- nvim-tree
  NvimTreeCursorLine       = { bg = c.bgl },
  NvimTreeFolder           = { fg = c.fg  },
  NvimTreeFolderIcon       = { fg = c.fg  },
  NvimTreeFolderName       = { fg = c.fg  },
  NvimTreeEmptyFolderName  = { fg = c.fg  },
  NvimTreeOpenedFolderName = { fg = c.fg  },
  NvimTreeNormal           = { bg = c.bg  },
  NvimTreeNormalNC         = { bg = c.bg  },
  NvimTreeRootFolder       = { fg = c.fg  },
  NvimTreeOpenedFile       = { fg = c.fg  },
  NvimTreeVertSplit        = { fg = c.sel },
  NvimTreeWindowPicker     = { fg = c.fg  },

  -- mini
  MiniJump                 = { fg = c.red  },

  -- telescope
  TelescopeMultiSelection  = { fg = c.fg   },
  TelescopeMultiIcon       = { fg = c.fg   },
  TelescopeNormal          = { fg = c.fg   },
  TelescopePreviewNormal   = { fg = c.fg   },
  TelescopePromptNormal    = { fg = c.fg   },
  TelescopeResultsNormal   = { fg = c.fg   },
  TelescopePromptBorder    = { fg = c.fgd  },
  TelescopeResultsBorder   = { fg = c.fgd  },
  TelescopePreviewBorder   = { fg = c.fgd  },
  TelescopeSelection       = { bg = c.bgl  },
  TelescopeSelectionCaret  = { fg = c.fg, bg = c.bgl },
  TelescopeTitle           = { fg = c.fg   },
  TelescopePromptTitle     = { fg = c.fg   },
  TelescopeResultsTitle    = { fg = c.fg   },
  TelescopePreviewTitle    = { fg = c.fg   },
  TelescopePromptCounter   = { fg = c.fgd  },
  TelescopeMatching        = { fg = c.blue },
  TelescopePromptPrefix    = { fg = c.fg   },
}

for name, val in pairs(hl_groups) do
  vim.api.nvim_set_hl(0, name, val)
end
