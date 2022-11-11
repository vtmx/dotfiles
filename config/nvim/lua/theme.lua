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
  Directory      = { fg = c.accent5 },
  EndOfBuffer    = { fg = c.shade3  },
  NonText        = { fg = c.shade3  },
  Special        = { fg = c.accent2 },
  SpecialChar    = { fg = c.accent2 },
  SpecialComment = { fg = c.shade3  },
  SpecialKey     = { fg = c.accent4 },
  TermCursor     = { fg = c.shade7  },

  -- float popup
  NormalFloat = { bg = c.shade0 },
  FloatBorder = { bg = c.shade0 },

  -- search
  Delimiter  = { fg = c.accent6 },
  IncSearch  = { bg = c.shade2  },
  MatchParen = { fg = c.accent2 },
  Search     = { bg = c.shade2  },

  -- messages
  ModeMsg    = { fg = c.shade3  },
  MoreMsg    = { fg = c.shade3  },
  Question   = { fg = c.shade7  },
  WarningMsg = { fg = c.accent2 },

  -- alerts
  Ignore = { fg = c.shade7  },
  Error  = { fg = c.accent0 },
  Todo   = { fg = c.accent6 },

  -- line tilde blank ~
  EndOfBuffer = { fg = c.shade0 },

  -- line highlight
  CursorLine = { bg = c.shade4 },

  -- select text
  Visual = { bg = c.shade2 },

  -- line number column
  CursorLineFold = { fg = c.shade7 },
  CursorLineNr   = { fg = c.shade7 },
  CursorLineSign = { fg = c.shade7 },
  LineNr         = { fg = c.shade2 },
  LineNrAbove    = { fg = c.shade3 },
  LineNrBelow    = { fg = c.shade3 },

  -- pmenu
  Pmenu      = { bg = c.shade1 },
  PmenuSbar  = { bg = c.shade1 },
  PmenuSel   = { bg = c.shade4 },
  PmenuThumb = { bg = c.shade4 },

  -- pmenu coc
  CocFloatSbar   = { bg = c.shade1  },
  CocMenuSel     = { bg = c.shade4  },
  CocFloatThumb  = { bg = c.shade4  },
  CocPumMenu     = { bg = c.shade1  },
  CocPumShortcut = { italic = false },
  CocSearch      = { fg = c.accent5 },

  -- tab bar
  WinbarNC = { fg = c.shade3 },

  -- line win separator split
  StatusLine   = { bg = 'NONE'   },
  StatusLineNC = { fg = c.shade7 },
  WinSeparator = { fg = c.shade2 },

  -- Languages

  -- html
  htmlArg = { fg = c.accent2 }, -- atribute
  htmlH1  = { fg = c.shade7 },
  htmlH2  = { link = 'htmlH1' },
  htmlH3  = { link = 'htmlH1' },
  htmlH4  = { link = 'htmlH1' },
  htmlH5  = { link = 'htmlH1' },
  htmlH6  = { link = 'htmlH1' },
  htmlSpecialTagName = { fg = c.accent0 },
  htmlTag     = { fg = c.shade7 },
  htmlTagName = { fg = c.accent0 },
  htmlTitle   = { fg = c.shade7 },
  htmlLink    = { fg = c.shade7 },

  -- markdown
  markdownBlockquote = { fg = c.shade7 },
  markdownCodeDelimiter = { fg = c.shade7 },
  markdownH1 = { link = 'htmlH1' },
  markdownH3 = { link = 'htmlH1' },
  markdownH4 = { link = 'htmlH1' },
  markdownH5 = { link = 'htmlH1' },
  markdownH6 = { link = 'htmlH1' },
  markdownHeadingDelimiter = { link = 'htmlH1' },
  markdownHeadingRule = { link = 'htmlH1' },
  markdownListMarker = { fg = c.accent2 },
  markdownRule = { link = 'htmlH1' },
  markdownUrl = { fg = c.shade7 },

  -- css
  cssClassNameDot = { fg = c.accent1 },
  cssClassName = { link = 'cssClassNameDot' },
  cssHacks = { fg = c.shade7 },
  cssTagName = { fg = c.accent0 },
  cssVendor = { fg = c.shade7 },

  -- Plugins

  -- packker
  packerStatusSuccess = { fg = c.accent3 },

  -- indent-line
  IndentBlanklineChar = { fg = c.shade2 },

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

  -- lualine
  lualine_b_diff_added_normal          = { fg = c.shade3 },
  lualine_b_diff_added_insert          = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_added_visual          = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_added_replace         = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_added_command         = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_added_terminal        = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_added_inactive        = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_modified_normal       = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_modified_insert       = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_modified_visual       = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_modified_replace      = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_modified_command      = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_modified_terminal     = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_modified_inactive     = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_removed_normal        = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_removed_insert        = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_removed_visual        = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_removed_replace       = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_removed_command       = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_removed_terminal      = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diff_removed_inactive      = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_hint_normal    = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_hint_insert    = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_hint_visual    = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_hint_replace   = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_hint_command   = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_hint_terminal  = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_hint_inactive  = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_info_normal    = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_info_insert    = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_info_visual    = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_info_replace   = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_info_command   = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_info_terminal  = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_info_inactive  = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_warn_normal    = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_warn_insert    = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_warn_visual    = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_warn_replace   = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_warn_command   = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_warn_terminal  = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_warn_inactive  = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_error_normal   = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_error_insert   = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_error_visual   = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_error_replace  = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_error_command  = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_error_terminal = { link = 'lualine_b_diff_added_normal' },
  lualine_b_diagnostics_error_inactive = { link = 'lualine_b_diff_added_normal' },
}

-- expand highlights
for name, val in pairs(highlights) do
  vim.api.nvim_set_hl(0, name, val)
end
