local c = {
  bg      = '#23272e',
  bl      = '#2c313c',
  fd      = '#5f6672',
  fg      = '#abb2bf',
  op      = '#88909c',
  sel     = '#3d4556',
  -- sel     = '#394349',
  red     = '#e06c75',
  green   = '#98c379',
  yellow  = '#e5c07b',
  orange  = '#d19a66',
  blue    = '#61afef',
  bluel   = '#84a0c6',
  magenta = '#c678dd',
  cyan    = '#56b6c2',
}

local hl_groups = {
	Foreground = { fg = c.fg },

	-- General
	Normal = { bg = c.bg, fg = c.fg },
	Comment = { fg = c.fd },
  Cursor = { bg = c.fg, fg = c.bg },
	CursorLine = { bg = c.bl },
	EndOfBuffer = { fg = c.bg },
	TermCursor = { link = 'Foreground' },
	Title = { link = 'Foreground' },
	Twilight = { link = 'Comment' },
	Visual = { bg = c.sel },

	-- Syntaxy
	Boolean = { fg = c.orange },
	Character = { fg = c.green },
	Conditional = { fg = c.magenta },
	Constant = { fg = c.fg },
	Define = { fg = c.magenta },
	Exception = { fg = c.magenta },
	Float = { fg = c.magenta },
	Function = { fg = c.blue },
	Identifier = { fg = c.red },
	Include = { fg = c.magenta },
	Keyword = { fg = c.magenta },
	Label = { fg = c.fg },
	Macro = { fg = c.red  },
	Number = { fg = c.orange },
	Operator = { fg = c.fg },
	PreCondit = { fg = c.magenta },
	PreProc = { fg = c.fg },
	Repeat = { fg = c.magenta },
	Statement = { fg = c.magenta },
	StorageClass = { fg = c.fg },
	String = { fg = c.green },
	Structure = { fg = c.fg },
	Tag = { fg = c.red },
	Typedef = { fg = c.magenta },
	Type = { fg = c.magenta },
	Underlined = { fg = c.fg, underline = true },

	-- Keys [] {} ()
	Delimiter = { link = 'Operator' },
	MatchParen = { fg = c.yellow },

	-- Extras
	Added = { fg = c.green },
  Changed = { fg = c.blue },
	Debug = { fg = c.yellow },
	Directory = { fg = c.blue },
	FoldColumn = { bg = c.sel, fg = c.cyan },
	Folder = { fg = c.blue },
	NonText = { fg = c.fd },
  Removed = { fg = c.red },
	SpecialChar = { fg = c.orange },
	SpecialComment = { fg = c.fd },
	Special = { link = 'Foreground' },
	SpecialKey = { fg = c.cyan },

	-- Line number column
	CursorLineFold = { link = 'Foreground' },
	CursorLineNr = { link = 'Foreground' },
	CursorLineSign = { link = 'Foreground' },
	LineNr = { fg = c.sel },
	LineNrAbove = { fg = c.sel },
	LineNrBelow = { fg = c.sel },

	-- ColorColumn
	ColorColumn = { bg = c.bl },

	-- Search
	Conceal = { bg = c.sel },
	CurSearch = { bg = c.fg, fg = c.bg },
	IncSearch = { bg = c.sel },
	Search = { bg = c.sel },
	SnippetTabStop = { link = 'Foreground' },

	-- Messages
	ErrorMsg = { fg = c.red },
	ModeMsg = { fg = c.fd },
	MoreMsg = { fg = c.fd },
	OkMsg = { fg = c.green },
	Question = { link = 'Foreground' },
	WarningMsg = { fg = c.yellow },

	-- Alerts
	Ignore = { link = 'Foreground' },
	Error = { fg = c.red },
	Todo = { fg = c.magenta },

	-- Pmenu
	Pmenuac = { bg = c.bl },
	Pmenu = { bg = c.bg },
	PmenuBorder = { link = 'Foreground' },
	PmenuExtra = { link = 'Comment' },
	PmenuKind = { link = 'Comment' },
	PmenuMatch = { bg = c.bl },
	PmenuSbar = { bg = c.bg },
	PmenuSel = { bg = c.bl },
	PmenuThumb = { bg = c.fg },

	-- Popup
	NormalFloat = { bg = c.bg },
	FloatBorder = { bg = c.bg },
	FloatShadow = { bg = c.bg },
	FloatShadowThrough = { bg = c.bg },

	-- Tabbar
	Winbar = { link = 'Foreground' },
	WinbarNC = { fg = c.fd },
	WinSeparator = { fg = c.sel },

	-- Line win separator split
	StatusLine = { link = 'Foreground' },
	StatusLineNC = { link = 'Foreground' },

	-- Spell
	SpellBad = { sp = c.red, undercurl = true },
	SpellCap = { sp = c.blue, undercurl = true },
	SpellRare = { sp = c.magenta, undercurl = true },
	SpellLocal = { sp = c.cyan, undercurl = true },

	-- Diagnostic
	DiagnosticError = { fg = c.red },
	DiagnosticFloatingError = { fg = c.red },
	DiagnosticFloatingHiting = { fg = c.cyan },
	DiagnosticFloatingInfo = { fg = c.blue },
	DiagnosticFloatingOk = { fg = c.green },
	DiagnosticFloatingWarn = { fg = c.yellow },
	DiagnosticHint = { fg = c.cyan },
	DiagnosticInfo = { fg = c.blue },
	DiagnosticOk = { fg = c.green },
	DiagnosticSignError = { fg = c.red },
	DiagnosticSignHint = { fg = c.cyan },
	DiagnosticSignOk = { fg = c.green },
	DiagnosticSignWarn = { fg = c.yellow },
	DiagnosticUnderlineError = { sp = c.red, undercurl = true },
	DiagnosticUnderlineHint = { sp = c.cyan, undercurl = true },
	DiagnosticUnderlineInfo = { sp = c.blue, undercurl = true },
	DiagnosticUnderlineOk = { sp = c.green, undercurl = true },
	DiagnosticUnderlineWarn = { sp = c.yellow, undercurl = true },
	DiagnosticUnnecessary = { link = 'Foreground' },
	DiagnosticVirtualTextError = { bg = '#39343a', fg = c.red },
	DiagnosticVirtualTextHint = { bg = '#2d333c', fg = c.cyan },
	DiagnosticVirtualTextInfo = { bg = '#303a46', fg = c.blue },
	DiagnosticVirtualTextOk = { bg = '#303a46', fg = c.green },
	DiagnosticVirtualTextWarn = { bg = '#3b3c3b', fg = c.yellow },
	DiagnosticWarn = { fg = c.yellow },
	QuickFixLine = { fg = c.cyan },

	-- Diff
	DiffAdd = { bg = '#283636' },
	DiffChange = { bg = '#3b3c3b' },
	DiffDelete = { bg = '#373138' },
	DiffText = { bg = '#1c3448', fg = 'NONE' },

  -- Redraw
	RedrawDebugClear = { link = 'DiffChange' },
	RedrawDebugComposed = { link = 'DiffAdd' },
	RedrawDebugRecompose = { link = 'DiffDelete' },

	-- Help
	healthHeadingChar = { link = 'Foreground' },
	healthSectionDelim = { fg = c.blue },
	helpHeader = { fg = c.blue },
	helpSectionDelim = { fg = c.blue },

	-- Nvim
	NvimInternalError = { fg = c.red },

	-- awk
	autoitBuiltin = { fg = c.orange },
	autoitConst = { fg = c.orange },
	autoitFunction = { link = 'Function' },
	autoitIncluded = { link = 'String' },
	autoitInclude = { link = 'Include' },
	autoitNumber = { link = 'Number' },
	autoitParen = { link = 'Operator' },
	autoitQuote = { link = 'Operator' },
	autoitString = { link = 'String' },
	autoitStyle = { fg = c.orange },
	autoitVariable = { link = 'Identifier' },
	autoitVarSelector = { link = 'Identifier' },

	-- awk
	awkBrktRegExp = { link = 'Number' },
	awkFunction = { link = 'Function' },
	awkParen = { link = 'Operator' },
	awkPatterns = { link = 'Function' },
	awkSearch = { link = 'Foreground' },
	awkStatement = { link = 'Function' },
	awkVariables = { link = 'Function' },

	-- c
	cBlock = { link = 'Operator' },
	cParen = { link = 'Operator' },

	-- css
	cssAtRule = { link = 'Foreground' },
  cssAttributeSelector = { link = 'Number' },
	cssAttrRegion = { link = 'Foreground' },
	cssBackgroundAttr = { link = 'Foreground' },
	cssBorderAttr = { link = 'Foreground' },
	cssBoxAttr = { link = 'Foreground' },
	cssBraces = { link = 'Operator' },
	cssClassNameDot = { link = 'Function' },
	cssClassName = { link = 'Function' },
	cssColor = { link = 'Number' },
	cssCommonAttr = { link = 'Foreground' },
	cssCustomProp = { link = 'Number' },
	cssDefinition = { link = 'Definition' },
	cssFlexibleBoxAttr = { link = 'Foreground' },
	cssFontAttr = { link = 'Foreground' },
	cssFunctionComma = { link = 'Foreground' },
	cssFunction = { link = 'Function' },
	cssFunctionName = { link = 'Function' },
	cssIdentifier = { link = 'Function' },
	cssNoise = { link = 'cssBraces' },
	cssPositioningAttr = { link = 'Foreground' },
	cssPseudoClassId = { link = 'Function' },
	cssTagName = { link = 'Function' },
	cssTextAttr = { link = 'Foreground' },
	cssUIAttr = { link = 'Foreground' },
	cssUnitDecorators = { link = 'Number' },
	cssValueNumber = { link = 'Function' },
	cssValueLength = { link = 'Number' },
	cssVendor = { link = 'Foreground' },

  -- django
	djangoFilter = { link = 'Foreground' },
	djangoStatement = { link = 'Foreground' },
	djangoTagBlock = { link = 'Foreground' },
	djangoVarBlock = { link = 'Foreground' },

	-- dosini
	dosiniHeader = { link = 'Identifier' },
	dosiniLabel = { link = 'Function' },
	dosiniValue = { link = 'Foreground' },

	-- go
	goBlock = { link = 'Operator' },
	goImport = { link = 'Foreground' },
	goPackage = { link = 'Foreground' },
	goParen = { link = 'Operator' },
	goStatement = { link = 'Foreground' },
	goType = { link = 'Foreground' },

	-- html
	htmlArg = { link = 'Number' },
	htmlEndTag = { fg = c.op },
	htmlH1 = { link = 'Foreground' },
	htmlH2 = { link = 'Foreground' },
	htmlH3 = { link = 'Foreground' },
	htmlH4 = { link = 'Foreground' },
	htmlH5 = { link = 'Foreground' },
	htmlH6 = { link = 'Foreground' },
	htmlLink = { link = 'Foreground' },
	htmlN = { link = 'Comment' },
	htmlSpecialTagName = { link = 'htmlTagName' },
	htmlTag = { fg = c.op },
	htmlTagN = { fg = c.op },
	htmlTagName = { link = 'Identifier' },
	htmlTitle = { link = 'Foreground' },

	-- javascript
	javaScriptBraces = { link = 'Operator' },
	javaScriptException = { link = 'Foreground' },
	javaScriptFunction = { link = 'Function' },
	javaScriptIdentifier = { link = 'Foreground' },
	javaScriptOperator = { link = 'Foreground' },
	javaScriptStatement = { link = 'Foreground' },
	javaScriptType = { link = 'Foreground' },

	-- json
	jsonBraces = { link = 'Operator' },
	jsonCommentError = { link = 'Comment' },
	jsonFold = { link = 'Operator' },
	jsonKeyword = { link = 'Foreground' },
	jsonKeywordMatch = { link = 'Operator' },
	jsonNoise = { link = 'Operator' },
	jsonQuote = { link = 'Operator' },

	-- kitty
	KittyAction = { link = 'Foreground' },
	KittyAlt = { link = 'Foreground' },
	KittyOptionName = { link = 'Foreground' },
	KittyColor = { link = 'Number' },
	KittyCtrl = { link = 'Foreground' },
	KittyKeybind = { link = 'Function' },
	KittyKeyword = { link = 'Definition' },
	KittyMap = { link = 'Keyword' },
	KittyMod = { link = 'Function' },
	KittySt = { link = 'String' },

	-- markdown
	markdownBlockquote = { link = 'Foreground' },
	markdownCodeBlock = { link = 'Foreground' },
	markdownCodeDelimiter = { fg = c.fd },
	markdownH1 = { link = 'Foreground' },
	markdownH1Delimiter = { fg = c.fd },
	markdownH2 = { link = 'Foreground' },
	markdownH2Delimiter = { fg = c.fd },
	markdownH3 = { link = 'Foreground' },
	markdownH3Delimiter = { fg = c.fd },
	markdownH4 = { link = 'Foreground' },
	markdownH4Delimiter = { fg = c.fd },
	markdownH5 = { link = 'Foreground' },
	markdownH5Delimiter = { fg = c.fd },
	markdownH6 = { link = 'Foreground' },
	markdownH6Delimiter = { fg = c.fd },
	markdownHeadingDelimiter = { fg = c.fd },
	markdownHeadingRule = { link = 'Foreground' },
	markdownId = { link = 'Foreground' },
	markdownLinkDelimiter = { fg = c.op },
	markdownLinkTextDelimiter = { fg = c.op },
	markdownListMarker = { fg = c.op },
	markdownRule = { link = 'Foreground' },
	markdownUrl = { link = 'Foreground' },

	-- php
	phpDefine = { link = 'Foreground' },
	phpMemberSelector = { link = 'Operator' },
	phpVarSelector = { link = 'Identifier' },

	-- sh
	shArithRegion = { link = 'Operator' },
	shCmdSubRegion = { link = 'Operator' },
	shDefref = { fg = c.red },
	shDerefOp = { link = 'Foreground' },
	shDerefSimple = { link = 'shDefref' },
	shDerefVarArray = { link = 'Foreground' },
	shDerefVar = { link = 'Foreground' },
	shEcho = { link = 'Foreground' },
	shLoop = { link = 'shConditional' },
	shQuote = { link = 'String' },
  shIf = { link = 'Operator' },
	shStatement = { link = 'Function' },
	shTestOpr = { link = 'Operator' },
	shVarAssign = { link = 'Operator' },
	shVariable = { link = 'Identifier' },

	-- str
	srtNumber = { link = 'Function' },
	srtTime = { fg = c.op },

	-- toml
	tomlKey = { link = 'Foreground' },
	tomlTable = { link = 'Function' },

	-- vim
	vimAutoEvent = { link = 'Foreground' },
	vimCommand = { link = 'Foreground' },
	vimFunction = { link = 'Foreground' },
	vimFunctionName = { link = 'Function' },
	vimMap = { link = 'Function' },
	vimVarScope = { link = 'Foreground' },

	-- xml
	xmlTag = { link = 'htmlTag' },
	xmlTagName = { link = 'htmlTagName' },
	xmlAttrib = { link = 'htmlArg' },
	xmlEqual = { link = 'htmlTag' },

	-- tree-sitter
	['@attribute.builtin'] = { link = 'Special' },
	['@attribute'] = { link = 'Macro' },
	['@boolean'] = { link = 'Boolean' },
	['@character'] = { link = 'Character' },
	['@character.special'] = { link = 'SpecialChar' },
	['@comment'] = { link = 'Comment' },
	['@comment.todo'] = { link = 'Todo' },
	['@conditional'] = { link = 'Conditional' },
	['@constant.builtin'] = { link = 'Special' },
	['@constant'] = { link = 'Constant' },
	['@constant.macro'] = { link = 'Define' },
	['@constructor'] = { link = 'Special' },
	['@debug'] = { link = 'Debug' },
	['@define'] = { link = 'Define' },
	['@exception'] = { link = 'Exception' },
	['@field'] = { link = 'Identifier' },
	['@float'] = { link = 'Float' },
	['@function.builtin'] = { link = 'Special' },
	['@function.call'] = { link = 'Function' },
	['@function'] = { link = 'Function' },
	['@function.macro'] = { link = 'Macro' },
	['@function.method'] = { link = 'Function' },
	['@include'] = { link = 'Include' },
	['@keyword.conditional'] = { link = 'Conditional' },
	['@keyword'] = { link = 'Keyword' },
	['@keyword.repeat'] = { link = 'Repeat' },
	['@keyword.type'] = { link = 'Type' },
	['@label'] = { link = 'Label' },
	['@macro'] = { link = 'Macro' },
	['@method'] = { link = 'Function' },
	['@namespace'] = { link = 'Identifier' },
	['@number'] = { link = 'Number' },
	['@operator'] = { link = 'Operator' },
	['@parameter'] = { link = 'Identifier' },
	['@preproc'] = { link = 'PreProc' },
	['@property'] = { link = 'Identifier' },
	['@punctuation'] = { link = 'Delimiter' },
	['@repeat'] = { link = 'Repeat' },
	['@storageclass'] = { link = 'StorageClass' },
	['@string.escape'] = { link = 'SpecialChar' },
	['@string'] = { link = 'String' },
	['@string.special'] = { link = 'SpecialChar' },
	['@string.special.url'] = { link = 'SpecialChar' },
	['@tag.attribute'] = { link = 'Number' },
	['@tag.builtin'] = { link = 'Tag' },
	['@tag.delimiter'] = { fg = c.op },
	['@tag'] = { link = 'Tag' },
	['@type.definition'] = { link = 'Typedef' },
	['@type'] = { link = 'Type' },
	['@variable'] = { link = 'Foreground' },
	['@variable.member'] = { link = 'Identifier' },
	['@variable.parameter.builtin'] = { link = 'Special' },
	['@variable.parameter'] = { link = 'Identifier' },

	-- Diff
	['@diff.plus'] = { link = 'DiffAdd' },
	['@diff.delta'] = { link = 'DiffChange' },
	['@diff.minus'] = { link = 'DiffDelete' },

	-- lsp
	['@lsp.type.class'] = { link = 'Structure' },
	['@lsp.type.comment'] = { link = 'Comment' },
	['@lsp.type.decorator'] = { link = 'Function' },
	['@lsp.type.enum'] = { link = 'Structure' },
	['@lsp.type.enumMember'] = { link = 'Constant' },
	['@lsp.type.function'] = { link = 'Function' },
	['@lsp.type.interface'] = { link = 'Structure' },
	['@lsp.type.macro'] = { link = 'Macro' },
	['@lsp.type.method'] = { link = 'Function' },
	['@lsp.type.namespace'] = { link = 'Structure' },
	['@lsp.type.parameter'] = { link = 'Identifier' },
	['@lsp.type.property'] = { link = 'Identifier' },
	['@lsp.type.struct'] = { link = 'Structure' },
	['@lsp.type.type'] = { link = 'Type' },
	['@lsp.type.typeParameter'] = { link = 'Foreground' },
	['@lsp.type.variable'] = { link = 'Variable' },

	-- Text
	['@text.literal'] = { link = 'Comment' },
	['@text.reference'] = { link = 'Identifier' },
	['@text.title'] = { link = 'Title' },
	['@text.todo'] = { link = 'Todo' },
	['@text.underline'] = { link = 'Underlined' },
	['@text.uri'] = { fg = c.blue, underline = true },

	-- Languages

	-- bash
	['@character.special.bash'] = { link = 'Operator' },
	['@constant.bash'] = { link = 'Foreground' },
	['@function.bash'] = { link = 'Function' },
	['@function.builtin.bash'] = { link = 'Function' },
	['@function.call.bash'] = { link = 'Function' },
	['@keyword.bash'] = { link = 'Keyword' },
	['@keyword.directive.bash'] = { link = 'Comment' },
	['@keyword.function.bash'] = { link = 'Keyword' },
	['@punctuation.special.bash'] = { link = 'Foreground' },
	['@string.regexp.bash'] = { link = 'Foreground' },
	['@string.special.path.bash'] = { link = 'Operator' },
	['@variable.bash'] = { link = 'Identifier' },
	['@variable.builtin.bash'] = { link = 'Identifier' },
	['@variable.parameter.bash'] = { link = 'Foreground' },

	-- c
	['@type.builtin.c'] = { fg = c.red },

	-- css
	['@character.special.css'] = { link = 'Operator' },
	['@constant.css'] = { link = 'Function' },
	['@function.css'] = { link = 'Foreground' },
	['@keyword.css'] = { link = 'Operator' },
	['@keyword.directive.css'] = { link = 'Function' },
	['@keyword.operator.css'] = { link = 'Operator' },
	['@number.float.css'] = { link = 'Number' },
	['@property.css'] = { link = 'Foreground' },
	['@selectors.css'] = { link = 'Function' },
	['@tag.attribute.css'] = { link = 'Number' },
	['@tag.css'] = { link = 'Function' },
	['@type.css'] = { link = 'Function' },
	['@attribute.css'] = { link = 'Function' },
	['@value.css'] = { link = 'Number' },
	['@variable.css'] = { link = 'Number' },

	-- go
	['@string.escape.go'] = { link = 'String' },
	['@function.method.call.go'] = { link = 'Foreground' },

	-- html
	['@constant.html'] = { link = 'Comment' },
	['@none.html'] = { link = 'Foreground' },
	['@operator.html'] = { fg = c.op },
	['@spell.html'] = { link = 'Foreground' },
	['@string.special.url.html'] = { link = 'String' },
	['@tag.attribute.html'] = { link = 'Number' },
	['@tag.delimiter.html'] = { fg = c.op },
	['@tag.html'] = { link = 'Identifier' },

  -- javascript
	['@keyword.exception.javascript'] = { link = 'Foreground' },
	['@keyword.function.javascript'] = { link = 'Foreground' },
	['@keyword.operator.javascript'] = { link = 'Foreground' },
	['@type.javascript'] = { link = 'Foreground' },
	['@variable.javascript'] = { link = 'Foreground' },
	['@variable.member.javascript'] = { link = 'Foreground' },
	['@variable.parameter.javascript'] = { link = 'Foreground' },

  -- json
	['@conceal.json'] = { link = 'Operator' },
	['@property.json'] = { link = 'Foreground' },

	-- lua
	['@constructor.lua'] = { link = 'Operator' },
	['@function.call.lua'] = { link = 'Function' },
	['@keyword.lua'] = { link = 'Keyword' },
	['@keyword.function.lua'] = { link = 'Conditional' },
	['@keyword.return.lua'] = { link = 'Conditional' },
	['@lsp.type.parameter.lua'] = { link = 'Foreground' },
	['@lsp.type.property.lua'] = { link = 'Foreground' },
	['@property.lua'] = { link = 'Foreground' },
	['@punctuation.delimiter.lua'] = { link = 'Operator' },
	['@string.escape.lua'] = { link = 'String' },
	['@variable.member.lua'] = { link = 'Foreground' },
	['@variable.parameter.lua'] = { link = 'Foreground' },

	-- markdown
	['@label.markdown'] = { fg = c.op },
	['@markup.heading.1.markdown'] = { fg = c.fd },
	['@markup.heading.2.markdown'] = { fg = c.fd },
	['@markup.heading.3.markdown'] = { fg = c.fd },
	['@markup.heading.4.markdown'] = { fg = c.fd },
	['@markup.heading.5.markdown'] = { fg = c.fd },
	['@markup.heading.6.markdown'] = { fg = c.fd },
	['@markup.heading'] = { link = 'Foreground' },
	['@markup.link.label'] = { link = 'Foreground' },
	['@markup.link'] = { link = 'Identifier' },
	['@markup.link.markdown_inline'] = { fg = c.op },
	['@markup.link.url'] = { link = 'Underlined' },
	['@markup.link.url.markdown_inline'] = { link = 'Foreground' },
	['@markup.list.markdown'] = { fg = c.op },
	['@markup.raw'] = { link = 'Foreground' },
	['@markup.raw.block.markdown'] = { link = 'Foreground' },
	['@markup.underline'] = { link = 'Foreground' },
	['@nospell.markdown_inline'] = { link = 'Foreground' },
	['@spell.markdown'] = { link = 'Foreground' },

  -- python
	['@variable.member.python'] = { link = 'Foreground' },

	-- query
	['@document.query'] = { link = 'Function' },
	['@nospell.query'] = { link = 'Comment' },
	['@punctuation.special.query'] = { link = 'Operator' },
	['@spell.query'] = { link = 'Comment' },
	['@type.query'] = { link = 'Identifier' },
	['@variable.member.query'] = { link = 'Foreground' },
	['@variable.query'] = { link = 'Foreground' },

	-- vim
	-- ['@keyword.vim'] = { link = 'Foreground' },

	-- vimdoc
	['@comment.note.vimdoc'] = { link = 'Foreground' },
	['@label.vimdoc'] = { link = 'Keyword' },
	['@markup.link.vimdoc'] = { link = 'Function' },
	['@string.special.vimdoc'] = { link = 'Function' },
	['@string.special.url.vimdoc'] = { link = 'Function' },
	['@markup.raw.block.vimdoc'] = { link = 'Foreground' },
	['@markup.raw.vimdoc'] = { link = 'Foreground' },
	['@variable.parameter.vimdoc'] = { link = 'Number' },

	-- toml
	['@key.toml'] = { link = 'Function' },
	['@number.float.toml'] = { link = 'Number' },
	['@property.toml'] = { link = 'Foreground' },
	['@string.number.float.toml'] = { link = 'Number' },
	['@string.special.toml'] = { link = 'Number' },

  -- sxhkd
	['@variable.sxhkdrc'] = { link = 'Number' },

	-- tera
	['@keyword.tera'] = { link = 'Identifier' },
	['@variable.member.tera'] = { link = 'Foreground' },

	-- v
	['@keyword.type.v'] = { link = 'Keyword' },
	['@module.v'] = { link = 'String' },
	['@type.v'] = { link = 'Macro' },
	['@variable.builtin.v'] = { fg = c.orange },
	['@variable.member.v'] = { link = 'Foreground' },

	-- vim
	['@function.macro.vim'] = { link = 'Foreground' },

	------------------------------------------------------------
	-- Plugins
	------------------------------------------------------------

	-- codium
	CodeiumAnnotation = { link = 'Foreground' },
	CodeiumSuggestion = { fg = c.fd },

	-- mason
	MasonHeader = { link = 'Foreground' },
	MasonMutedBlock = { bg = '#88909c', fg = c.bg },
	MasonBackdrop = { bg = c.bg, blend = 100 },

	-- mini-cursorword
	MiniCursorword = { fg = c.yellow },
	MiniCursorwordCurrent = { fg = c.yellow },

	-- mini-files
	MiniFilesTitle = { fg = c.fd },
	MiniFilesTitleFocused = { link = 'Foreground' },

	-- mini-jump2d
	MiniJump2dDim = { link = 'Comment' },
	MiniJump2dSpotAhead = { fg = c.yellow },
	MiniJump2dSpot = { fg = c.red },
	MiniJump2dSpotUnique = { fg = c.red },

	-- mini-statusline
	MiniStatuslineRecording = { fg = c.red },

	-- netrw
	netrwTreeBar = { link = 'Foreground' },

	-- snacks
	SnacksBackdrop = { bg = c.bg, blend = 100 },
	SnacksIndent = { fg = c.sel },
	SnacksIndentScope = { link = 'SnacksIndent' },
	SnacksPickerCursorLine = { link = 'Foreground' },
	SnacksPickerDir = { link = 'Foreground' },
}

-- Clear colors
vim.cmd.hi('clear')

-- Reset syntax
if vim.fn.exists('syntax_on') then
	vim.cmd('syntax reset')
end

-- Set colors
for name, val in pairs(hl_groups) do
	vim.api.nvim_set_hl(0, name, val)
end

-- Load colorscheme
vim.g.colors_name = 'onedarkv'
vim.opt.termguicolors = true
