local HOMEDIR = os.getenv('HOME')
local style = require 'core.style'
style.font = renderer.font.load(HOMEDIR .. '/.local/share/fonts/Segoe UI/SegoeSb.ttf', 15 * SCALE, { antialiasing = 'grayscale' })
style.big_font = renderer.font.load(HOMEDIR .. '/.local/share/fonts/Segoe UI/SegoeSb.ttf', 15 * SCALE, { antialiasing = 'grayscale' })
style.code_font = renderer.font.load(HOMEDIR .. '/.local/share/fonts/Blex Mono Nerd Font/BlexMonoNerdFont-Medium.ttf', 15 * SCALE, { antialiasing = 'grayscale' })
style.italic_code_font = renderer.font.load(HOMEDIR .. '/.local/share/fonts/Blex Mono Nerd Font/BlexMonoNerdFont-MediumItalic.ttf', 15 * SCALE, { antialiasing = 'grayscale' })
