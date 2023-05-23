local c = require('config.colors')

local hl_groups = {
  -- General
  Normal         = { fg = c.fg, ctermfg = 255, ctermbg = 234 },
  Comment        = { fg = c.comment, ctermfg = 7,   italic = true },
  Title          = { fg = c.purple },
  Twilight       = { fg = c.comment  },

  -- Sintaxy
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

  -- Keys [] {} ()
  Type           = { fg = c.purple },
  Typedef        = { fg = c.purple },
  StorageClass   = { fg = c.purple },
  Structure      = { fg = c.purple },

  -- Extras
  Debug          = { fg = c.yellow },
  Directory      = { fg = c.blue },
  EndOfBuffer    = { fg = c.comment  },
  NonText        = { fg = c.comment  },
  Special        = { fg = c.yellow },
  SpecialChar    = { fg = c.yellow },
  SpecialComment = { fg = c.comment  },
  SpecialKey     = { fg = c.cyan },
  TermCursor     = { fg = c.fg  },

  -- Float popup
  NormalFloat    = { bg = c.bg },
  FloatBorder    = { bg = c.bg },

  -- Search
  Delimiter      = { fg = c.purple },
  IncSearch      = { bg = c.selection  },
  MatchParen     = { fg = c.yellow },
  Search         = { bg = c.selection  },

  -- Messages
  ModeMsg        = { fg = c.comment  },
  MoreMsg        = { fg = c.comment  },
  Question       = { fg = c.fg  },
  WarningMsg     = { fg = c.yellow },

  -- Alerts
  Ignore         = { fg = c.fg  },
  Error          = { fg = c.red },
  Todo           = { fg = c.purple },

  -- Line tilde blank ~
  EndOfBuffer    = { fg = c.bg },

  -- Line highlight
  CursorLine     = { bg = c.cursor_line },

  -- Select text
  Visual         = { bg = c.selection },

  -- Line number column
  CursorLineFold = { fg = c.fg },
  CursorLineNr   = { fg = c.fg },
  CursorLineSign = { fg = c.fg },
  LineNr         = { fg = c.selection },
  LineNrAbove    = { fg = c.comment },
  LineNrBelow    = { fg = c.comment },

  -- Pmenu
  Pmenu          = { bg = c.bg_dark },
  PmenuSbar      = { bg = c.bg_dark },
  PmenuSel       = { bg = c.cursor_line },
  PmenuThumb     = { bg = c.cursor_line },

  -- Pmenu coc
  CocFloating       = { bg = c.bg_dark  },
  CocFloatSbar      = { bg = c.bg_dark  },
  CocFloatThumb     = { bg = c.cursor_line  },
  CocMenuSel        = { bg = c.cursor_line  },
  CocPumDetail      = { fg = c.comment  },
  CocPumMenu        = { bg = c.bg_dark  },
  CocPumShortcut    = { fg = c.comment  },
  CocPumVirtualText = { fg = c.comment  },
  CocSearch         = { fg = c.blue },

  -- Tab bar
  WinbarNC          = { fg = c.comment },

  -- Line win separator split
  StatusLine        = { bg = 'NONE'   },
  StatusLineNC      = { fg = c.fg },
  WinSeparator      = { fg = c.selection },

  -- Languages

  -- html
  htmlArg            = { fg = c.yellow }, -- atribute
  htmlH1             = { fg = c.fg },
  htmlH2             = { link = 'htmlH1' },
  htmlH3             = { link = 'htmlH1' },
  htmlH4             = { link = 'htmlH1' },
  htmlH5             = { link = 'htmlH1' },
  htmlH6             = { link = 'htmlH1' },
  htmlSpecialTagName = { fg = c.red },
  htmlTag            = { fg = c.fg },
  htmlTagName        = { fg = c.red },
  htmlTitle          = { fg = c.fg },
  htmlLink           = { fg = c.fg },

  -- markdown
  markdownBlockquote       = { fg = c.fg },
  markdownCodeDelimiter    = { fg = c.fg },
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
  markdownUrl              = { fg = c.fg },

  -- css
  cssClassNameDot = { fg = c.orange },
  cssClassName    = { link = 'cssClassNameDot' },
  cssHacks        = { fg = c.fg },
  cssTagName      = { fg = c.red },
  cssVendor       = { fg = c.fg },

  -- Plugins

  -- indent-line
  IndentBlanklineChar = { fg = c.selection },

  -- bufferline
  BufferLineCloseButtonVisible = { bg = 'NONE' },
  BufferLineIndicatorVisible   = { bg = 'NONE' },
  BufferLineModified           = { bg = 'NONE' },

  -- hop
  HopNextKey               = { fg = c.red },
  HopNextKey1              = { fg = c.blue },
  HopNextKey2              = { fg = c.orange },
  HopNextKey3              = { fg = c.purple },
  HopUnmatched             = { fg = c.comment  },

  -- nvim-tree
  NvimTreeCursorLine       = { bg = c.cursor_line },
  NvimTreeFolder           = { fg = c.fg },
  NvimTreeFolderIcon       = { fg = c.fg },
  NvimTreeFolderName       = { fg = c.fg },
  NvimTreeEmptyFolderName  = { fg = c.fg },
  NvimTreeOpenedFolderName = { fg = c.fg },
  NvimTreeNormal           = { bg = c.bg },
  NvimTreeNormalNC         = { bg = c.bg },
  NvimTreeRootFolder       = { fg = c.fg },
  NvimTreeOpenedFile       = { fg = c.fg },
  NvimTreeVertSplit        = { fg = c.selection  },
  NvimTreeWindowPicker     = { fg = c.fg },

  -- mini
  MiniJump                 = { fg = c.red },

  -- telescope
  TelescopeMultiSelection  = { fg = c.fg },
  TelescopeMultiIcon       = { fg = c.fg },
  TelescopeNormal          = { fg = c.fg },
  TelescopePreviewNormal   = { fg = c.fg },
  TelescopePromptNormal    = { fg = c.fg },
  TelescopeResultsNormal   = { fg = c.fg },
  TelescopePromptBorder    = { fg = c.comment },
  TelescopeResultsBorder   = { fg = c.comment },
  TelescopePreviewBorder   = { fg = c.comment },
  TelescopeSelection       = { bg = c.cursor_line },
  TelescopeSelectionCaret  = { fg = c.fg, bg = c.cursor_line },
  TelescopeTitle           = { fg = c.fg },
  TelescopePromptTitle     = { fg = c.fg },
  TelescopeResultsTitle    = { fg = c.fg },
  TelescopePreviewTitle    = { fg = c.fg },
  TelescopePromptCounter   = { fg = c.comment },
  TelescopeMatching        = { fg = c.blue },
  TelescopePromptPrefix    = { fg = c.fg },

  -- lualine
  lualine_b_diff_added_normal          = { fg = c.comment },
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
