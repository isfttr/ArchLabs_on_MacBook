import subprocess
# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# bindings
config.bind("tt", "tab-clone")
config.bind("ch", "history-clear")
config.bind("cs", "config-source")
config.bind("pf", "fullscreen")
config.bind("po", "edit-url")

# Window taking. It is used in respect to the window you're
# typing the command. If I'm on window 1 trying to take a
# tab on window 2 I use ta. It only works with two windows.
# to position the right tab to take as number 1, go to the
# wanted tab and type `1gm`.
config.bind("ta", "tab-take 2/1")  #take forewards, f win1
config.bind("tA", "tab-take 1/1")  #take backwards, f win2

# When to show favicons in the tab bar.
# Type: String
# Valid values:
#   - always: Always show favicons.
#   - never: Always hide favicons.
#   - pinned: Show favicons only on pinned tabs.
c.tabs.favicons.show = 'never'

# Width (in pixels) of the progress indicator (0 to disable).
# Type: Int
c.tabs.indicator.width = 0

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}&ia=web'}

# Default monospace fonts. Whenever "monospace" is used in a font
# setting, it's replaced with the fonts listed here.
# Type: Font
c.fonts.monospace = 'Fira Code'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '9pt monospace'

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = 'bold 9pt monospace'

# Font used for the debugging console.
# Type: QtFont
c.fonts.debug_console = '9pt monospace'

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = '3pt monospace'

# Font used for the hints.
# Type: Font
c.fonts.hints = '8pt monospace'

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = '9pt monospace'

# Font used for error messages.
# Type: Font
c.fonts.messages.error = '9pt monospace'

# Font used for info messages.
# Type: Font
c.fonts.messages.info = '9pt monospace'

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = '9pt monospace'

# Font used for prompts.
# Type: Font
c.fonts.prompts = '9pt monospace'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '9pt monospace'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = '9pt monospace'

# COLORS

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')
c.colors.completion.fg = xresources['*.foreground']
c.colors.completion.odd.bg = xresources['*.background']
c.colors.completion.even.bg = xresources['*.background-even']
c.colors.completion.category.bg = xresources['*.background-dark']
c.colors.completion.category.border.top = xresources['*.background']
c.colors.completion.category.border.bottom = xresources['*.background']
c.colors.completion.item.selected.bg = xresources['*.foreground']
c.colors.completion.item.selected.border.bottom = xresources['*.foreground']
c.colors.completion.item.selected.border.top = xresources['*.foreground']
c.colors.completion.item.selected.fg = xresources['*.background']
c.colors.completion.match.fg = xresources['*.color9']
c.colors.completion.scrollbar.fg = xresources['*.background-even']
c.colors.completion.scrollbar.bg = xresources['*.background']
c.colors.downloads.bar.bg = xresources['*.background']
c.colors.downloads.start.bg = xresources['*.color4']
c.colors.downloads.stop.bg = xresources['*.color2']
c.colors.messages.error.fg = xresources['*.foreground']
c.colors.messages.error.bg = xresources['*.color1']
c.colors.messages.error.border = xresources['*.color1']
c.colors.messages.warning.bg = xresources['*.color3']
c.colors.messages.warning.border = xresources['*.color3']
c.colors.messages.info.bg = xresources['*.color8']
c.colors.messages.info.border = xresources['*.color8']
c.colors.prompts.bg = xresources['*.background-dark']
c.colors.prompts.fg = xresources['*.foreground']
c.colors.statusbar.normal.bg = xresources['*.background']
c.colors.statusbar.normal.fg = xresources['*.foreground']
c.colors.statusbar.insert.bg = xresources['*.background']
c.colors.statusbar.insert.fg = xresources['*.color10']
c.colors.statusbar.passthrough.fg = xresources['*.color12']
c.colors.statusbar.passthrough.bg = xresources['*.background']
c.colors.statusbar.command.fg = xresources['*.foreground']
c.colors.statusbar.command.bg = xresources['*.background']
c.colors.statusbar.url.fg = xresources['*.color8']
c.colors.statusbar.url.hover.fg = xresources['*.color7']
c.colors.statusbar.url.success.http.fg = xresources['*.color8']
c.colors.statusbar.url.success.https.fg = xresources['*.foreground']
c.colors.tabs.odd.fg = xresources['*.color8']
c.colors.tabs.odd.bg = xresources['*.background']
c.colors.tabs.even.fg = xresources['*.color8']
c.colors.tabs.even.bg = xresources['*.background']
c.colors.tabs.selected.odd.fg = xresources['*.foreground']
c.colors.tabs.selected.odd.bg = xresources['*.background-even']
c.colors.tabs.selected.even.fg = xresources['*.foreground']
c.colors.tabs.selected.even.bg = xresources['*.background-even']
c.colors.webpage.bg = "white"

# web fonts
c.fonts.web.family.serif = "Liberation Serif"
c.fonts.web.family.sans_serif = "Liberation Sans"
c.fonts.web.family.standard = "Liberation Sans"
c.fonts.web.family.fixed = "Fira Code"
# custom css
