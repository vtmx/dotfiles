-----------------------------------------------------------
-- theme
------------------------------------------------------------

local cmd = vim.cmd
local c = require('colors')

-- :hi to see colors
function hi(group, fg, bg, gui)
	local fg  = fg or 'NONE'
	local bg  = bg or 'NONE'
	local gui = gui or 'NONE'

	bg  = 'guibg=' .. bg
	fg  = 'guifg=' .. fg
	gui = 'gui=' .. gui

	cmd('hi ' .. group .. ' ' .. bg .. ' ' .. fg .. ' ' .. gui)
end

-- default
hi('Normal', c.shade7, 'NONE')

-- extras
hi('SpecialKey', c.accent4)
hi('EndOfBuffer', c.shade3)
hi('TermCursor', c.shade7)
hi('NonText', c.shade3)
hi('Directory', c.accent5)

-- search
hi('IncSearch', c.shade1, c.accent2)
hi('Search', c.shade1, c.accent2)

-- messages
hi('ErrorMsg', c.accent0)
hi('ModeMsg', c.shade7)
hi('Question', c.accent3)
hi('WinSeparator', c.shade3)

-- sintaxy
hi('Error', c.accent0)
hi('Todo', c.accent6)
hi('String', c.accent3)
hi('Constant', c.accent1)
hi('Character', c.accent3)
hi('Number', c.accent1)
hi('Boolean', c.accent1)
hi('Float', c.accent1)
hi('Function', c.accent5)
hi('Identifier', c.accent0)
hi('Conditional', c.accent6)
hi('Statement', c.accent6)
hi('Repeat', c.accent6)
hi('Label', c.accent0)
hi('Operator', c.accent4)
hi('Keyword', c.accent6)
hi('Exception', c.accent6)
hi('Include', c.accent6)

-- keys [] {} ()
hi('StorageClass', c.accent6)
hi('Type', c.accent6)
hi('Structure', c.accent6)
hi('Typedef', c.accent6)

-- line tilde blank
hi('EndOfBuffer', c.shade0)

-- cursor line
hi('CursorLine', '', c.shade4)

-- line column
hi('LineNr', c.shade2)
hi('LineNrAbove', c.shade3)
hi('LineNrBelow', c.shade3)
hi('CursorLineNr', c.shade7)
hi('CursorLineSign', c.shade7)
hi('CursorLineFold', c.shade7)

-- select text
hi('Visual', '', c.shade2)

-- pmenu
hi('Pmenu', '', c.shade1)
hi('PmenuSel', '', c.shade4)
hi('PmenuSbar', '', c.shade1)
hi('PmenuThumb', '', c.shade4)

-- cock menu
hi('CocPumMenu', '', c.shade1)
hi('CocMenuSel', '', c.shade4)
hi('CocFloatSbar', '', c.shade1)
hi('CocFloatThumb', '', c.shade4)
hi('CocSearch', c.accent5)
hi('CocPumShortcut') -- remove italic

-- line splits
hi('VertSplit', c.shade2)

-- status line
hi('StatusLine', c.shade3)
hi('StatusLineNC', c.shade3)

-- comments
hi('Comment', c.shade3, c.shade0, 'italic')

-- packker
hi('packerStatusSuccess', c.accent3)

-- hop
hi('HopNextKey', c.accent0)
hi('HopUnmatched', c.shade3)

-- indent-line
hi('IndentBlanklineChar', c.shade2)
hi('IndentBlanklineSpaceChar')

-- bufferline
hi('BufferLineIndicatorVisible', '', c.shade0)
hi('BufferLineCloseButtonVisible', '', c.shade0)

-- nvim-tree
hi('NvimTreeCursorLine', '', c.shade4)
hi('NvimTreeVertSplit', c.shade2)
hi('NvimTreeFolder', c.shade7)
hi('NvimTreeFolderIcon', c.shade7)
hi('NvimTreeFolderName', c.shade7)
hi('NvimTreeEmptyFolderName', c.shade7)
hi('NvimTreeOpenedFolderName', c.shade7)
hi('NvimTreeNormal', '', c.shade0)
hi('NvimTreeNormalNC', '', c.shade0)
hi('NvimTreeRootFolder', c.shade7)
hi('NvimTreeOpenedFile', c.shade7)
hi('NvimTreeWindowPicker', c.shade7)
