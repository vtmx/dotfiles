local style = require 'core.style'
local HOMEDIR = os.getenv('HOME')
-- DATADIR is the location of the installed Lite XL Lua code, default color schemes and fonts.
-- USERDIR is the location of the Lite XL configuration directory.

-- Fonts
-- style.font          : user interface
-- style.big_font      : big text in welcome screen
-- style.icon_font     : icons
-- style.icon_big_font : toolbar icons
-- style.code_font     : code
-- the function to load the font accept a 3rd optional argument like:
-- {antialiasing='grayscale', hinting='full', bold=true, italic=true, underline=true, smoothing=true, strikethrough=true}
-- possible values are:
-- antialiasing: grayscale, subpixel
-- hinting: none, slight, full
-- bold: true, false
-- italic: true, false
-- underline: true, false
-- smoothing: true, false
-- strikethrough: true, false
style.font = renderer.font.load(HOMEDIR .. '/.local/share/fonts/Segoe UI/SegoeSb.ttf', 15 * SCALE)
style.big_font = renderer.font.load(HOMEDIR .. '/.local/share/fonts/Segoe UI/SegoeSb.ttf', 15 * SCALE)
style.code_font = renderer.font.load(HOMEDIR .. '/.local/share/fonts/BlexMonoNerdFont/BlexMonoNerdFont-Medium.ttf', 15 * SCALE)
style.italic_code_font = renderer.font.load(HOMEDIR .. '/.local/share/fonts/BlexMonoNerdFont/BlexMonoNerdFont-MediumItalic.ttf', 15 * SCALE)
style.syntax_fonts['comment'] = style.italic_code_font
