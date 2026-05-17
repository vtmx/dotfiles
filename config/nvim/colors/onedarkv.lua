local c = {
	bg      = '#23272e',
	bl      = '#2c313c',
	fd      = '#5f6672',
	fg      = '#abb2bf',
  fl      = '#88909c',
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
	Foreground = { link = 'Foreground' },

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
	Keyword = { fg = c.red },
	Label = { fg = c.fg },
	Macro = { fg = c.red  },
	Number = { fg = c.orange },
	Operator = { fg = c.fl },
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
	DiagnosticVirtualTextError = { fg = c.red },
	DiagnosticVirtualTextHint = { fg = c.cyan },
	DiagnosticVirtualTextInfo = { fg = c.blue },
	DiagnosticVirtualTextOk = { fg = c.green },
	DiagnosticVirtualTextWarn = { fg = c.yellow },
	DiagnosticWarn = { fg = c.yellow },
	QuickFixLine = { fg = c.cyan },

	-- Diff
	DiffAdd = { bg = '#31392b' },
	DiffChange = { bg = '#1c3448' },
	DiffDelete = { bg = '#382b2c' },
	DiffText = { bg = '#2c5372' },

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
	cssAtRule = { link = 'Function' },
	cssAttrRegion = { link = 'Foreground' },
	cssBackgroundAttr = { link = 'Foreground' },
	cssBorderAttr = { link = 'Foreground' },
	cssBoxAttr = { link = 'Foreground' },
	cssBraces = { link = 'Operator' },
	cssClassNameDot = { link = 'Function' },
	cssClassName = { link = 'Function' },
	cssColor = { link = 'Number' },
	cssCommonAttr = { link = 'Foreground' },
	cssDefinition = { link = 'Definition' },
	cssFlexibleBoxAttr = { link = 'Foreground' },
	cssFontAttr = { link = 'Foreground' },
	cssFunction = { link = 'Function' },
	cssFunctionName = { link = 'Function' },
	cssIdentifier = { link = 'Function' },
	cssNoise = { link = 'cssBraces' },
	cssPositioningAttr = { link = 'Foreground' },
	cssPseudoClassId = { link = 'Function' },
	cssTagName = { link = 'Function' },
	cssTextAttr = { link = 'Foreground' },
	cssUIAttr = { link = 'Foreground' },
	cssUnitDecorators = { link = 'Foreground' },
	cssValueLength = { link = 'Foreground' },
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
	htmlArg = { link = 'Foreground' },
	htmlEndTag = { link = 'Operator' },
	htmlH1 = { link = 'Foreground' },
	htmlH2 = { link = 'Foreground' },
	htmlH3 = { link = 'Foreground' },
	htmlH4 = { link = 'Foreground' },
	htmlH5 = { link = 'Foreground' },
	htmlH6 = { link = 'Foreground' },
	htmlLink = { link = 'Foreground' },
	htmlN = { link = 'Comment' },
	htmlSpecialTagName = { link = 'htmlTagName' },
	htmlTag = { link = 'Operator' },
	htmlTagN = { link = 'Operator' },
	htmlTagName = { link = 'Keyword' },
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
	jsonFold = { link = 'Operator' },
	jsonKeyword = { link = 'Foreground' },
	jsonKeywordMatch = { link = 'Operator' },
	jsonNoise = { link = 'Operator' },
	jsonQuote = { link = 'Operator' },
	jsonCommentError = { link = 'Comment' },

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
	markdownCodeDelimiter = { link = 'Foreground' },
	markdownH1Delimiter = { link = 'Foreground' },
	markdownH1 = { link = 'Foreground' },
	markdownH2Delimiter = { link = 'Foreground' },
	markdownH2 = { link = 'Foreground' },
	markdownH3Delimiter = { link = 'Foreground' },
	markdownH3 = { link = 'Foreground' },
	markdownH4Delimiter = { link = 'Foreground' },
	markdownH4 = { link = 'Foreground' },
	markdownH5Delimiter = { link = 'Foreground' },
	markdownH5 = { link = 'Foreground' },
	markdownH6Delimiter = { link = 'Foreground' },
	markdownH6 = { link = 'Foreground' },
	markdownHeadingDelimiter = { link = 'Foreground' },
	markdownHeadingRule = { link = 'Foreground' },
	markdownId = { link = 'Foreground' },
	markdownListMarker = { link = 'Foreground' },
	markdownRule = { link = 'Foreground' },
	markdownUrl = { link = 'Foreground' },

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
	shVariable = { link = 'Foreground' },

	-- str
	srtNumber = { link = 'Function' },
	srtTime = { link = 'Operator' },

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

	-- tree-sitter

	-- Constants
	['@boolean'] = { link = 'Boolean' },
	['@character'] = { link = 'Character' },
	['@character.special'] = { link = 'SpecialChar' },
	['@constant.builtin'] = { link = 'Special' },
	['@constant'] = { link = 'Constant' },
	['@constant.macro'] = { link = 'Define' },
	['@define'] = { link = 'Define' },
	['@float'] = { link = 'Float' },
	['@macro'] = { link = 'Macro' },
	['@number'] = { link = 'Number' },
	['@string.escape'] = { link = 'SpecialChar' },
	['@string'] = { link = 'String' },
	['@string.special'] = { link = 'SpecialChar' },
	['@string.special.url'] = { link = 'SpecialChar' },

	-- Comments
	['@comment'] = { link = 'Comment' },
	['@comment.todo'] = { link = 'Todo' },
	['@punctuation'] = { link = 'Delimiter' },

	-- Diff
	['@diff.plus'] = { link = 'DiffAdd' },
	['@diff.delta'] = { link = 'DiffChange' },
	['@diff.minus'] = { link = 'DiffDelete' },

	-- Functions
	['@function'] = { link = 'Function' },
	['@function.builtin'] = { link = 'Special' },
	['@function.call'] = { link = 'Function' },
	['@function.macro'] = { link = 'Macro' },
	['@function.method'] = { link = 'Function' },
	['@parameter'] = { link = 'Identifier' },
	['@method'] = { link = 'Function' },
	['@field'] = { link = 'Identifier' },
	['@property'] = { link = 'Identifier' },
	['@constructor'] = { link = 'Special' },
	['@variable.parameter'] = { link = 'Identifier' },
	['@variable.parameter.builtin'] = { link = 'Special' },
	['@variable.member'] = { link = 'Identifier' },
	['@attribute'] = { link = 'Macro' },
	['@attribute.builtin'] = { link = 'Special' },

	-- Keywords
	['@conditional'] = { link = 'Conditional' },
	['@debug'] = { link = 'Debug' },
	['@exception'] = { link = 'Exception' },
	['@include'] = { link = 'Include' },
	['@keyword.conditional'] = { link = 'Conditional' },
	['@keyword'] = { link = 'Keyword' },
	['@keyword.repeat'] = { link = 'Repeat' },
	['@keyword.type'] = { link = 'Structure' },
	['@label'] = { link = 'Label' },
	['@namespace'] = { link = 'Identifier' },
	['@operator'] = { link = 'Operator' },
	['@preproc'] = { link = 'PreProc' },
	['@repeat'] = { link = 'Repeat' },
	['@storageclass'] = { link = 'StorageClass' },
	['@tag'] = { link = 'Tag' },
	['@tag.builtin'] = { link = 'Tag' },
	['@tag.attribute'] = { link = 'Number' },
	['@tag.delimiter'] = { link = 'Foreground' },
	['@type.definition'] = { link = 'Typedef' },
	['@type'] = { link = 'Type' },
	['@variable'] = { link = 'Foreground' },

	-- LSP semantic tokens
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
	['@lsp.type.typeParameter'] = { link = 'TypeDef' },
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
	['@punctuation.special.bash'] = { link = 'Operator' },
	['@string.regexp.bash'] = { link = 'Foreground' },
	['@string.special.path.bash'] = { link = 'Operator' },
	['@variable.bash'] = { link = 'Foreground' },
	['@variable.builtin.bash'] = { fg = c.red },
	['@variable.parameter.bash'] = { link = 'Foreground' },

	-- c
	['@type.builtin.c'] = { fg = c.red },

	-- css
	['@function.css'] = { link = 'Foreground' },
	['@keyword.css'] = { link = 'Operator' },
	['@keyword.directive.css'] = { link = 'Function' },
	['@keyword.operator.css'] = { link = 'Operator' },
	['@property.css'] = { link = 'Foreground' },
	['@selectors.css'] = { link = 'Function' },
	['@value.css'] = { link = 'Number' },

	-- go
	['@string.escape.go'] = { link = 'String' },
	['@function.method.call.go'] = { link = 'Foreground' },

	-- html
	['@constant.html'] = { link = 'Comment' },
	['@none.html'] = { link = 'Foreground' },
	['@spell.html'] = { link = 'Foreground' },
	['@string.special.url.html'] = { link = 'String' },
	['@tag.attribute.html'] = { link = 'Foreground' },
	['@tag.delimiter.html'] = { link = 'Operator' },
	['@tag.html'] = { link = 'Keyword' },

  -- javascript
	['@keyword.exception.javascript'] = { link = 'Foreground' },
	['@keyword.function.javascript'] = { link = 'Foreground' },
	['@keyword.operator.javascript'] = { link = 'Foreground' },
	['@type.javascript'] = { link = 'Foreground' },
	['@variable.javascript'] = { link = 'Foreground' },
	['@variable.member.javascript'] = { link = 'Foreground' },
	['@variable.parameter.javascript'] = { link = 'Foreground' },

  -- json
	['@property.json'] = { link = 'Foreground' },

	-- lua
	['@constructor.lua'] = { link = 'Operator' },
	['@function.call.lua'] = { link = 'Function' },
	['@keyword.lua'] = { fg = c.red },
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
	['@label.markdown'] = { link = 'Operator' },
	['@markup.heading.1.markdown'] = { link = 'Foreground' },
	['@markup.heading.2.markdown'] = { link = 'Foreground' },
	['@markup.heading.3.markdown'] = { link = 'Foreground' },
	['@markup.heading.4.markdown'] = { link = 'Foreground' },
	['@markup.heading.5.markdown'] = { link = 'Foreground' },
	['@markup.heading.6.markdown'] = { link = 'Foreground' },
	['@markup.heading'] = { link = 'Title' },
	['@markup.link.label'] = { link = 'Foreground' },
	['@markup.link'] = { link = 'Identifier' },
	['@markup.link.markdown_inline'] = { link = 'Operator' },
	['@markup.link.url'] = { link = 'Underlined' },
	['@markup.link.url.markdown_inline'] = { link = 'Foreground' },
	['@markup.list.markdown'] = { link = 'Operator' },
	['@markup.raw.block'] = { link = 'Foreground' },
	['@markup.raw'] = { link = 'Foreground' },
	['@markup.underline'] = { link = 'Foreground' },
	['@nospell.markdown_inline'] = { link = 'Foreground' },
	['@spell.markdown'] = { link = 'Foreground' },

  -- python
	['@variable.member.python'] = { link = 'Foreground' },

	-- query
	['@document.query'] = { link = 'Function' },
	['@nospell.query'] = { link = 'Comment' },
	['@spell.query'] = { link = 'Comment' },
	['@variable.member.query'] = { link = 'Foreground' },

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
