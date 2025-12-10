#!/usr/bin/env python3

def hsl2hex(h: int, s: int, l: int) -> str:
    h = h % 360
    s = s / 100.0
    l = l / 100.0

    c = (1 - abs(2 * l - 1)) * s
    x = c * (1 - abs((h / 60) % 2 - 1))
    m = l - c / 2

    if h < 60:
        r, g, b = c, x, 0
    elif h < 120:
        r, g, b = x, c, 0
    elif h < 180:
        r, g, b = 0, c, x
    elif h < 240:
        r, g, b = 0, x, c
    elif h < 300:
        r, g, b = x, 0, c
    else:
        r, g, b = c, 0, x

    r = int((r + m) * 255 + 0.5)
    g = int((g + m) * 255 + 0.5)
    b = int((b + m) * 255 + 0.5)

    return f'#{r:02x}{g:02x}{b:02x}'

font = {'family': 'BlexMono Nerd Font Medium', 'size': 11}
cursor = {'color': '#abb2bf', 'shape': 'block', 'blink_interval': 0.5}
padding = {'x': 8, 'y': 8}

color = {}
color['scheme'] = 'dark'

if color['scheme'] == 'light':
    print('no light baby')
else:
    color['hue'] = 220
    color['sat'] = 15
    color['lgt'] = 70

color['bg'] = hsl2hex(color['hue'], color['sat'], 15)
color['fg'] = hsl2hex(color['hue'], color['sat'], 70)

# Roda de 12 cores
hue_current = 0
for i in range(1, 13):
    if hue_current >= 360:
        hue_current -= 360
    color[str(i)] = hsl2hex(hue_current, color['sat'], color['lgt'])
    print(hue_current)
    hue_current += 30

color['selection_bg'] = '#61afef'
color['selection_fg'] = '#282c34'

# Imprime exatamente como no Lua
for k in sorted(color):
    if k.isdigit() or k.startswith('selection_') or k in ('bg', 'fg'):
        print(f'color[{k}] = {color[k]}')
