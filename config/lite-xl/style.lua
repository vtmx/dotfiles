local HOMEDIR = os.getenv('HOME')
local style = require 'core.style'
style.font = renderer.font.load(HOMEDIR .. '/.local/share/fonts/SegoeUI/SegoeSb.ttf', 15 * SCALE, { antialiasing = 'grayscale' })
style.big_font = renderer.font.load(HOMEDIR .. '/.local/share/fonts/SegoeUI/SegoeSb.ttf', 15 * SCALE, { antialiasing = 'grayscale' })
style.code_font = renderer.font.load(HOMEDIR .. '/.local/share/fonts/BlexMonoNerdFont/BlexMonoNerdFont-Medium.ttf', 15 * SCALE, { antialiasing = 'grayscale' })
style.italic_code_font = renderer.font.load(HOMEDIR .. '/.local/share/fonts/BlexMonoNerdFont/BlexMonoNerdFont-MediumItalic.ttf', 15 * SCALE, { antialiasing = 'grayscale' })
