------------------------------------------------------------
-- theme
------------------------------------------------------------

local c = require('colors')

local highlights = {
  -- general
  Normal   = { fg = c.shade7, ctermfg = 255, ctermbg = 234 },
  Comment  = { fg = c.shade3, ctermfg = 7,   italic = true },

  -- sintaxy
  Boolean     = { fg = c.accent1 },
  Character   = { fg = c.accent3 },
  Conditional = { fg = c.accent6 },
  Constant    = { fg = c.accent1 },
  Define      = { fg = c.accent6 },
  ErrorMsg    = { fg = c.accent0 },
  Exception   = { fg = c.accent6 },
  Float       = { fg = c.accent1 },
  Function    = { fg = c.accent5 },
  Identifier  = { fg = c.accent0 },
  Include     = { fg = c.accent6 },
  Keyword     = { fg = c.accent6 },
  Label       = { fg = c.accent0 },
  Macro       = { fg = c.accent0 },
  Number      = { fg = c.accent1 },
  Operator    = { fg = c.accent4 },
  PreCondit   = { fg = c.accent6 },
  PreProc     = { fg = c.accent6 },
  Repeat      = { fg = c.accent6 },
  Tag         = { fg = c.accent3 },
  Statement   = { fg = c.accent6 },
  String      = { fg = c.accent3 },

  -- keys [] {} ()
  Type         = { fg = c.accent6 },
  Typedef      = { fg = c.accent6 },
  StorageClass = { fg = c.accent6 },
  Structure    = { fg = c.accent6 },

  -- extras
  Debug          = { fg = c.accent2 },
  Special        = { fg = c.accent2 },
  SpecialChar    = { fg = c.accent2 },
  SpecialComment = { fg = c.shade3  },
  SpecialKey     = { fg = c.accent4 },
  EndOfBuffer    = { fg = c.shade3  },
  TermCursor     = { fg = c.shade7  },
  NonText        = { fg = c.shade3  },
  Directory      = { fg = c.accent5 },

  -- float
  NormalFloat = { bg = c.shade0 },
  FloatBorder = { bg = c.shade0 },

  -- search
  Delimiter  = { fg = c.accent6 },
  IncSearch  = { fg = c.shade7, bg = c.shade2 },
  MatchParen = { fg = c.accent2 },
  Search     = { fg = c.shade7, bg = c.shade2 },

  -- messages
  ModeMsg    = { fg = c.shade3  },
  MoreMsg    = { fg = c.shade3  },
  Question   = { fg = c.shade7  },
  WarningMsg = { fg = c.accent2 },

  -- alerts
  Ignore = { fg = c.shade7 },
  Error  = { fg = c.accent0 },
  Todo   = { fg = c.accent6 },

  -- line tilde blank
  EndOfBuffer = { fg = c.shade0 },

  -- line highlight
  CursorLine = { bg = c.shade4 },

  -- select text
  Visual = { bg = c.shade2 },

  -- line number column
  LineNr         = { fg = c.shade2 },
  LineNrAbove    = { fg = c.shade3 },
  LineNrBelow    = { fg = c.shade3 },
  CursorLineNr   = { fg = c.shade7 },
  CursorLineSign = { fg = c.shade7 },
  CursorLineFold = { fg = c.shade7 },

  -- pmenu
  Pmenu      = { bg = c.shade1 },
  PmenuSel   = { bg = c.shade4 },
  PmenuSbar  = { bg = c.shade1 },
  PmenuThumb = { bg = c.shade4 },

  -- cock pmenu
  CocPumMenu     = { bg = c.shade1  },
  CocMenuSel     = { bg = c.shade4  },
  CocFloatSbar   = { bg = c.shade1  },
  CocFloatThumb  = { bg = c.shade4  },
  CocSearch      = { fg = c.accent5 },
  CocPumShortcut = { italic = false },

  -- tab bar
  WinbarNC = { fg = c.shade3 },

  -- line win separator
  WinSeparator = { fg = c.shade2 },
  StatusLine   = { bg = 'NONE'   },
  StatusLineNC = { fg = c.shade7 },

  -- Plugins

  -- packker
  packerStatusSuccess = { fg = c.accent3 },

  -- bufferline
  BufferLineCloseButtonVisible = { bg = 'NONE' },
  BufferLineIndicatorVisible   = { bg = 'NONE' },
  BufferLineModified           = { bg = 'NONE' },

  -- hop
  HopNextKey   = { fg = c.accent0 },
  HopNextKey1  = { fg = c.accent5 },
  HopNextKey2  = { fg = c.accent1 },
  HopNextKey3  = { fg = c.accent6 },
  HopUnmatched = { fg = c.shade3  },

  -- indent-line
  IndentBlanklineChar = { fg = c.shade2 },

  -- nvim-tree
  NvimTreeCursorLine       = { bg = c.shade4 },
  NvimTreeFolder           = { fg = c.shade7 },
  NvimTreeFolderIcon       = { fg = c.shade7 },
  NvimTreeFolderName       = { fg = c.shade7 },
  NvimTreeEmptyFolderName  = { fg = c.shade7 },
  NvimTreeOpenedFolderName = { fg = c.shade7 },
  NvimTreeNormal           = { bg = c.shade0 },
  NvimTreeNormalNC         = { bg = c.shade0 },
  NvimTreeRootFolder       = { fg = c.shade7 },
  NvimTreeOpenedFile       = { fg = c.shade7 },
  NvimTreeVertSplit        = { fg = c.shade2 },
  NvimTreeWindowPicker     = { fg = c.shade7 },

  -- telescope
  TelescopeMultiSelection = { fg = c.shade7 },
  TelescopeMultiIcon      = { fg = c.shade7 },
  TelescopeNormal         = { fg = c.shade7 },
  TelescopePreviewNormal  = { fg = c.shade7 },
  TelescopePromptNormal   = { fg = c.shade7 },
  TelescopeResultsNormal  = { fg = c.shade7 },
  TelescopePromptBorder   = { fg = c.shade3 },
  TelescopeResultsBorder  = { fg = c.shade3 },
  TelescopePreviewBorder  = { fg = c.shade3 },
  TelescopeSelection      = { bg = c.shade4 },
  TelescopeSelectionCaret = { fg = c.shade7, bg = c.shade4 },
  TelescopeTitle          = { fg = c.shade7 },
  TelescopePromptTitle    = { fg = c.shade7 },
  TelescopeResultsTitle   = { fg = c.shade7 },
  TelescopePreviewTitle   = { fg = c.shade7 },
  TelescopePromptCounter  = { fg = c.shade3 },
  TelescopeMatching       = { fg = c.accent5 },
  TelescopePromptPrefix   = { fg = c.shade7 },
}

-- expand highlights
for name, val in pairs(highlights) do
  vim.api.nvim_set_hl(0, name, val)
end
