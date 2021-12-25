# Vivaldi

## Enable experiments
vivaldi://experiments/
[x] Allow for using CSS modifications.

## Style location
/opt/vivaldi/resources/vivaldi/browser.html
/opt/vivaldi/resources/vivaldi/style/commons.css

## Open Dev Tools in IU
- Open vivaldi://inspect/#apps/ and click “inspect” beneath the first line (Vivaldi browser.html)
- Open vivaldi://settings/, or vivaldi://experiments/, or vivaldi://mail/ and load DevTools with a keyboard shortcut

## One Dark

- Background: #1e222a
- Foreground: #abb2bf
- Hightlight: #abb2bf
- Accent: #394551 > opera
- Background Custom Color: #1d2126

## Opera

- Background: #191d21
- Foreground: #fafafa
- Hightlight: #45b0e6
- Accent: #394551

## Shortcuts

vivaldi-stable

## CSS
/opt/vivaldi/resources/vivaldi/style/

```
body {
	font-family:  -apple-system, BlinkMacSystemFont, "Segoe UI", Arial, sans-serif;
}

.toolbar-mainbar {
  --ToolbarItemGap: 0;
  flex-shrink: 0;
  color: var(--colorFg);
  background-color: var(--colorBg);
  position: relative;
  z-index: 4;
  height: 42px;
}
```

## Links

vivaldi://experiments/
vivaldi://settings/appearance/
https://achekulaev.medium.com/darkopera-theme-for-vivaldi-browser-89f2998742e

