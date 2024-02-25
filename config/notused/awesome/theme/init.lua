local dpi = require('beautiful.xresources').apply_dpi
local gfs = require('gears.filesystem')
local theme_assets = require('beautiful.theme_assets')
local themes_path = gfs.get_themes_dir()

local c = {
  bg     = '#23272e',
  bgd    = '#1e2227',
  bgl    = '#2c313c',
  fg     = '#abb2bf',
  fgd    = '#5c6370',
  red    = '#e06c75',
  orange = '#d19a66',
  yellow = '#e5c07b',
  green  = '#98c379',
  cyan   = '#56b6c2',
  blue   = '#61afef',
  purple = '#c678dd',
}

local theme = {}

theme.font          = 'Segoe UI 11'
theme.wallpaper     = '/home/vitor/Pictures/wallpapers/wallhaven/games/stray00.jpg'

theme.bg_normal     = c.bgd
theme.bg_focus      = c.bgl
theme.bg_urgent     = c.red
theme.bg_minimize   = c.fg
theme.bg_systray    = c.bgd

theme.fg_normal     = c.fgd
theme.fg_focus      = c.fg
theme.fg_urgent     = c.red
theme.fg_minimize   = c.fgd

theme.useless_gap   = 4
theme.border_width  = 4
theme.border_normal = c.fg
theme.border_focus  = c.fgd
theme.border_marked = c.blue

-- Enable gaps only more clients
theme.gap_single_client = false

-- Squaresize taglist
local taglist_square_size = 2

theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
  taglist_square_size, theme.fg_normal
)

theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
  taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
theme.notification_font = 14
theme.notification_width = 100
theme.notification_height = 30
theme.notification_margin = 10 
theme.notification_bg = c.red
theme.notification_fg = c.fg
theme.notification_border_width = 1
theme.notification_border_color = c.bdl

-- Menu
theme.menu_width  = dpi(100)
theme.menu_height = 15
theme.menu_bg_normal = c.bgd
theme.menu_fg_normal = c.fg
theme.menu_bg_focus = c.bgl
theme.menu_fg_focus = c.fg
theme.menu_border_width = 1
theme.menu_border_color = c.bgl
theme.menu_submenu_icon = themes_path..'default/submenu.png'

-- Define the image to load
theme.titlebar_close_button_normal = themes_path..'default/titlebar/close_normal.png'
theme.titlebar_close_button_focus  = themes_path..'default/titlebar/close_focus.png'

theme.titlebar_minimize_button_normal = themes_path..'default/titlebar/minimize_normal.png'
theme.titlebar_minimize_button_focus  = themes_path..'default/titlebar/minimize_focus.png'

theme.titlebar_ontop_button_normal_inactive = themes_path..'default/titlebar/ontop_normal_inactive.png'
theme.titlebar_ontop_button_focus_inactive  = themes_path..'default/titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_active = themes_path..'default/titlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_active  = themes_path..'default/titlebar/ontop_focus_active.png'

theme.titlebar_sticky_button_normal_inactive = themes_path..'default/titlebar/sticky_normal_inactive.png'
theme.titlebar_sticky_button_focus_inactive  = themes_path..'default/titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_active = themes_path..'default/titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_active  = themes_path..'default/titlebar/sticky_focus_active.png'

theme.titlebar_floating_button_normal_inactive = themes_path..'default/titlebar/floating_normal_inactive.png'
theme.titlebar_floating_button_focus_inactive  = themes_path..'default/titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_active = themes_path..'default/titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_active  = themes_path..'default/titlebar/floating_focus_active.png'

theme.titlebar_maximized_button_normal_inactive = themes_path..'default/titlebar/maximized_normal_inactive.png'
theme.titlebar_maximized_button_focus_inactive  = themes_path..'default/titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_active = themes_path..'default/titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_active  = themes_path..'default/titlebar/maximized_focus_active.png'

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path..'default/layouts/fairhw.png'
theme.layout_fairv = themes_path..'default/layouts/fairvw.png'
theme.layout_floating  = themes_path..'default/layouts/floatingw.png'
theme.layout_magnifier = themes_path..'default/layouts/magnifierw.png'
theme.layout_max = themes_path..'default/layouts/maxw.png'
theme.layout_fullscreen = themes_path..'default/layouts/fullscreenw.png'
theme.layout_tilebottom = themes_path..'default/layouts/tilebottomw.png'
theme.layout_tileleft   = themes_path..'default/layouts/tileleftw.png'
theme.layout_tile = themes_path..'default/layouts/tilew.png'
theme.layout_tiletop = themes_path..'default/layouts/tiletopw.png'
theme.layout_spiral  = themes_path..'default/layouts/spiralw.png'
theme.layout_dwindle = themes_path..'default/layouts/dwindlew.png'
theme.layout_cornernw = themes_path..'default/layouts/cornernww.png'
theme.layout_cornerne = themes_path..'default/layouts/cornernew.png'
theme.layout_cornersw = themes_path..'default/layouts/cornersww.png'
theme.layout_cornerse = themes_path..'default/layouts/cornersew.png'

-- Generate Awesome icon
theme.awesome_icon = theme_assets.awesome_icon(
  theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used
theme.icon_theme = nil

return theme

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- notification_[border_color|border_width|shape|opacity]
-- Example:
-- theme.taglist_bg_focus = '#ff0000'

-- Reference
-- https://awesomewm.org/doc/api/documentation/06-appearance.md.html
