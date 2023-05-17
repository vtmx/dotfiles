local c = require('config.colors')

local hl_groups = {
  -- general
  Normal         = { fg = c.foreground, ctermfg = 255, ctermbg = 234 },
  Comment        = { fg = c.comment_foreground, ctermfg = 7,   italic = true },
  Title          = { fg = c.purple },
  Twilight       = { fg = c.comment_foreground  },

  -- sintaxy
  Boolean        = { fg = c.orange },
  Character      = { fg = c.green },
  Conditional    = { fg = c.purple },
  Constant       = { fg = c.orange },
  Define         = { fg = c.purple },
  ErrorMsg       = { fg = c.red },
  Exception      = { fg = c.purple },
  Float          = { fg = c.orange },
  Function       = { fg = c.blue },
  Identifier     = { fg = c.red },
  Include        = { fg = c.purple },
  Keyword        = { fg = c.purple },
  Label          = { fg = c.red },
  Macro          = { fg = c.red },
  Number         = { fg = c.orange },
  Operator       = { fg = c.cyan },
  PreCondit      = { fg = c.purple },
  PreProc        = { fg = c.purple },
  Repeat         = { fg = c.purple },
  Tag            = { fg = c.green },
  Statement      = { fg = c.purple },
  String         = { fg = c.green },

  -- keys [] {} ()
  Type           = { fg = c.purple },
  Typedef        = { fg = c.purple },
  StorageClass   = { fg = c.purple },
  Structure      = { fg = c.purple },

  -- extras
  Debug          = { fg = c.yellow },
  Directory      = { fg = c.blue },
  EndOfBuffer    = { fg = c.comment_foreground  },
  NonText        = { fg = c.comment_foreground  },
  Special        = { fg = c.yellow },
  SpecialChar    = { fg = c.yellow },
  SpecialComment = { fg = c.comment_foreground  },
  SpecialKey     = { fg = c.cyan },
  TermCursor     = { fg = c.foreground  },

  -- float popup
  NormalFloat    = { bg = c.background },
  FloatBorder    = { bg = c.background },

  -- search
  Delimiter      = { fg = c.purple },
  IncSearch      = { bg = c.selection_background  },
  MatchParen     = { fg = c.yellow },
  Search         = { bg = c.selection_background  },

  -- messages
  ModeMsg        = { fg = c.comment_foreground  },
  MoreMsg        = { fg = c.comment_foreground  },
  Question       = { fg = c.foreground  },
  WarningMsg     = { fg = c.yellow },

  -- alerts
  Ignore         = { fg = c.foreground  },
  Error          = { fg = c.red },
  Todo           = { fg = c.purple },

  -- line tilde blank ~
  EndOfBuffer    = { fg = c.background },

  -- line highlight
  CursorLine     = { bg = c.line_highlight_background },

  -- select text
  Visual         = { bg = c.selection_background },

  -- line number column
  CursorLineFold = { fg = c.foreground },
  CursorLineNr   = { fg = c.foreground },
  CursorLineSign = { fg = c.foreground },
  LineNr         = { fg = c.selection_background },
  LineNrAbove    = { fg = c.comment_foreground },
  LineNrBelow    = { fg = c.comment_foreground },

  -- pmenu
  Pmenu          = { bg = c.dark_background },
  PmenuSbar      = { bg = c.dark_background },
  PmenuSel       = { bg = c.line_highlight_background },
  PmenuThumb     = { bg = c.line_highlight_background },

  -- pmenu coc
  CocFloating       = { bg = c.dark_background  },
  CocFloatSbar      = { bg = c.dark_background  },
  CocFloatThumb     = { bg = c.line_highlight_background  },
  CocMenuSel        = { bg = c.line_highlight_background  },
  CocPumDetail      = { fg = c.comment_foreground  },
  CocPumMenu        = { bg = c.dark_background  },
  CocPumShortcut    = { fg = c.comment_foreground  },
  CocPumVirtualText = { fg = c.comment_foreground  },
  CocSearch         = { fg = c.blue },

  -- tab bar
  WinbarNC          = { fg = c.comment_foreground },

  -- line win separator split
  StatusLine        = { bg = 'NONE'   },
  StatusLineNC      = { fg = c.foreground },
  WinSeparator      = { fg = c.selection_background },

  -- Languages

  -- html
  htmlArg            = { fg = c.yellow }, -- atribute
  htmlH1             = { fg = c.foreground },
  htmlH2             = { link = 'htmlH1' },
  htmlH3             = { link = 'htmlH1' },
  htmlH4             = { link = 'htmlH1' },
  htmlH5             = { link = 'htmlH1' },
  htmlH6             = { link = 'htmlH1' },
  htmlSpecialTagName = { fg = c.red },
  htmlTag            = { fg = c.foreground },
  htmlTagName        = { fg = c.red },
  htmlTitle          = { fg = c.foreground },
  htmlLink           = { fg = c.foreground },

  -- markdown
  markdownBlockquote       = { fg = c.foreground },
  markdownCodeDelimiter    = { fg = c.foreground },
  markdownId               = { link = 'markdownH1' },
  markdownH1               = { fg = c.purple      },
  markdownH2               = { link = 'markdownH1' },
  markdownH3               = { link = 'markdownH1' },
  markdownH4               = { link = 'markdownH1' },
  markdownH5               = { link = 'markdownH1' },
  markdownH6               = { link = 'markdownH1' },
  markdownHeadingDelimiter = { link = 'markdownH1' },
  markdownHeadingRule      = { link = 'markdownH1' },
  markdownListMarker       = { fg = c.yellow },
  markdownRule             = { link = 'markdownH1' },
  markdownUrl              = { fg = c.foreground },

  -- css
  cssClassNameDot = { fg = c.orange },
  cssClassName    = { link = 'cssClassNameDot' },
  cssHacks        = { fg = c.foreground },
  cssTagName      = { fg = c.red },
  cssVendor       = { fg = c.foreground },

  -- Plugins

  -- packker
  packerStatusSuccess = { fg = c.green },

  -- indent-line
  IndentBlanklineChar = { fg = c.selection_background },

  -- bufferline
  BufferLineCloseButtonVisible = { bg = 'NONE' },
  BufferLineIndicatorVisible   = { bg = 'NONE' },
  BufferLineModified           = { bg = 'NONE' },

  -- hop
  HopNextKey               = { fg = c.red },
  HopNextKey1              = { fg = c.blue },
  HopNextKey2              = { fg = c.orange },
  HopNextKey3              = { fg = c.purple },
  HopUnmatched             = { fg = c.comment_foreground  },

  -- nvim-tree
  NvimTreeCursorLine       = { bg = c.line_highlight_background },
  NvimTreeFolder           = { fg = c.foreground },
  NvimTreeFolderIcon       = { fg = c.foreground },
  NvimTreeFolderName       = { fg = c.foreground },
  NvimTreeEmptyFolderName  = { fg = c.foreground },
  NvimTreeOpenedFolderName = { fg = c.foreground },
  NvimTreeNormal           = { bg = c.background },
  NvimTreeNormalNC         = { bg = c.background },
  NvimTreeRootFolder       = { fg = c.foreground },
  NvimTreeOpenedFile       = { fg = c.foreground },
  NvimTreeVertSplit        = { fg = c.selection_background },
  NvimTreeWindowPicker     = { fg = c.foreground },

  -- mini
  MiniJump                 = { fg = c.red },

  -- telescope
  TelescopeMultiSelection  = { fg = c.foreground },
  TelescopeMultiIcon       = { fg = c.foreground },
  TelescopeNormal          = { fg = c.foreground },
  TelescopePreviewNormal   = { fg = c.foreground },
  TelescopePromptNormal    = { fg = c.foreground },
  TelescopeResultsNormal   = { fg = c.foreground },
  TelescopePromptBorder    = { fg = c.comment_foreground },
  TelescopeResultsBorder   = { fg = c.comment_foreground },
  TelescopePreviewBorder   = { fg = c.comment_foreground },
  TelescopeSelection       = { bg = c.line_highlight_background },
  TelescopeSelectionCaret  = { fg = c.foreground, bg = c.line_highlight_background },
  TelescopeTitle           = { fg = c.foreground },
  TelescopePromptTitle     = { fg = c.foreground },
  TelescopeResultsTitle    = { fg = c.foreground },
  TelescopePreviewTitle    = { fg = c.foreground },
  TelescopePromptCounter   = { fg = c.comment_foreground },
  TelescopeMatching        = { fg = c.blue },
  TelescopePromptPrefix    = { fg = c.foreground },

  -- lualine
  lualine_b_diff_added_normal          = { fg = c.comment_foreground },
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

for name, val in pairs(hl_groups) do
  vim.api.nvim_set_hl(0, name, val)
end
