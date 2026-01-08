import sys, webbrowser

# Check if arguments
if len(sys.argv) < 2:
  print('Uso: python keywords.py <key> [search]')
  sys.exit(1)

# Get vars
arg_key = sys.argv[1]
arg_search = sys.argv[2] if len(sys.argv) > 2 else ''

# Get bookmark list
bookmarks = [
  { 
    'key': 'a1',
    'name': 'A1',
    'url': 'ht1'
  },
  { 
    'key': 'a2',
    'name': 'A2',
    'url': 'https://google/%s'
  }
]

# Loop for bookmarks
for bookmark in bookmarks:
  if arg_key == bookmark['key']:
    if '%s' in bookmark['url']:
      url = bookmark['url'].replace('%s', arg_search)
    else:
      url = bookmark['url']

    print(f'Abrindo: {url}')
    webbrowser.open_new_tab(url)
    sys.exit(0)

print('Key não encontrada.')
