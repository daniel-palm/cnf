import subprocess
import os
from qutebrowser.api import interceptor

"""

qutebrowser settings for video

for more settings check out
https://qutebrowser.org/doc/help/settings.html
"""

# ================== Youtube Add Blocking ======================= {{{
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
    ):
        info.block()


interceptor.register(filter_yt)
# }}}
# =================== Launch Qutebrowser from Dmenu ====== {{{

"""
#!/bin/sh

# Originally from lukesmith with some changes
# Gives a dmenu prompt to search DuckDuckGo.
# Without input, will open DuckDuckGo.com.
# Anything else, it search it.

LAUNCER="dmenu -l 5 -i -p "
[ -z "${DISPLAY}" ] && LAUNCER="fzf --prompt "

localBROWSER="$BROWSER "
[ -n "$*" ] && localBROWSER="$*"
[ -z "${DISPLAY}" ] && localBROWSER="w3m "

if [ -f ~/.config/bookmarks ]; then
	choice=$( (echo "🦆" && cat ~/.config/bookmarks) | $LAUNCER"Search:") || exit 1
else
	choice=$(echo "🦆" | $LAUNCER -i -p "Search DuckDuckGo:") || exit 1
fi

case "$choice" in
*🦆*)
	$localBROWSER"https://duckduckgo.com"
	exit
	;;
http*)
	$localBROWSER"$(echo $choice | awk '{print $1}')"
	exit
	;;
*) $localBROWSER"https://duckduckgo.com/?q=$choice"
	exit
	;;
esac
#vim:ft=sh
"""

# }}}



"""
" PART OF MY VIMRC
" I used minisnip to execute the vimscript but you could just use autocommands

" Simple implementation of org-capture using minisnip
function! CreateCapture(window, ...)
        " file used to store all captures
	let g:org_refile='~/Documents/org/refile.org'
	if a:0 == 1 && a:1 == 'qutebrowser'
		exec a:window . ' ' . g:org_refile
		exec '$read ' . globpath(&rtp, 'extra/org/templateQUTE.org')
	endif
	call feedkeys("i\\<Plug>(minisnip)", 'i')
endfunction
"""

"""
" ~/.vim/extra/org/templateQUTE.org
* TODO {{+~getreg('+')+}}
SCHEDULED: <{{+~strftime(g:org_date_format)+}}>
"""
# }}}
# ======================= External Open =================== {{{
config.bind("V", "hint links spawn " + os.environ["BROWSER"] + ' "{hint-url}"')
config.bind("v", 'hint links spawn funnel "{hint-url}"')
config.bind("\\", 'spawn dmenuhandler "{url}"')
# }}}
# ======================= Redline Insert Mode ============= {{{

config.bind("<Ctrl-h>", "fake-key <Backspace>", "insert")
#config.bind("<Ctrl-a>", "fake-key <Home>", "insert")
config.bind("<Ctrl-e>", "fake-key <End>", "insert")
config.bind("<Ctrl-b>", "fake-key <Left>", "insert")
config.bind("<Mod1-b>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Ctrl-f>", "fake-key <Right>", "insert")
config.bind("<Mod1-f>", "fake-key <Ctrl-Right>", "insert")
config.bind("<Ctrl-p>", "fake-key <Up>", "insert")
config.bind("<Ctrl-n>", "fake-key <Down>", "insert")
config.bind("<Mod1-d>", "fake-key <Ctrl-Delete>", "insert")
config.bind("<Ctrl-d>", "fake-key <Delete>", "insert")
config.bind("<Ctrl-w>", "fake-key <Ctrl-Backspace>", "insert")
config.bind("<Ctrl-u>", "fake-key <Shift-Home><Delete>", "insert")
config.bind("<Ctrl-r>", ":reload")
config.bind("<Ctrl-x><Ctrl-e>", "open-editor", "insert")
config.bind("<ctrl+o>", "set-cmd-text -s :open -t")
config.bind("<Shift+b>", "set-cmd-text -s :bookmark-add")
config.bind("<b>", "set-cmd-text -s :bookmark-load")
config.bind("<ctrl+b>", "set-cmd-text -s :bookmark-load -t")
config.bind("<q>", "set-cmd-text -s :quickmark-load")
config.bind("<ctrl+q>", "set-cmd-text -s :quickmark-load -t")
config.bind("<shift+q>", ":quickmark-save")
config.bind("<shift+r>", ":set-cmd-text -s :set content.user_stylesheets coolsheet.css")
config.bind("<j>", ":scroll down")
config.bind("<k>", ":scroll up")
config.bind("<d>", ":scroll up")
config.bind("<m>", ":tab-mute")
config.bind("<ctrl+h>", ":back")
config.bind("<ctrl+l>", ":forward")
config.bind("<shift+h>", ":open -t qute://history/")
config.bind("<ctrl+p>", ":open -p")
#config.bind("<pp>", "spawn --userscript qute-pass --dmenu-invocation dmenu")
config.bind(',p', 'spawn --userscript qute-pass --dmenu-invocation dmenu')
config.bind(',P', 'spawn --userscript qute-pass --dmenu-invocation dmenu --password-only')
config.bind("<shift+G>", ":set-cmd-text -s :open -t https://marve.basefarm.com/?search=")
#tabs
config.bind("<Alt-k>", "tab-prev")
config.bind("<Alt-j>", "tab-next")
config.bind("<Alt+r>", ":config-source ~/.config/qutebrowser/config.py")
config.bind("<Alt-t>", "tab-pin")

# }}}
# ====================== xresources ======================= {{{
# taken from https://qutebrowser.org/doc/help/configuring.html
def read_xresources(prefix):
    """
    read settings from xresources
    """
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props

config.load_autoconfig(False)
xresources = read_xresources("*")
c.colors.statusbar.normal.bg = xresources['*background']
c.colors.statusbar.command.bg = xresources["*background"]
c.colors.statusbar.command.fg = xresources["*foreground"]
c.colors.statusbar.normal.fg = xresources["*background"]
c.colors.statusbar.url.success.https.fg = xresources["*color17"]
#private mode
c.colors.statusbar.private.bg = xresources["*color18"]
c.colors.statusbar.private.fg = xresources["*color0"]

c.statusbar.show = "always"

c.colors.tabs.even.bg = xresources["*background"]
c.colors.tabs.odd.bg = xresources["*background"]
c.colors.tabs.even.fg = xresources["*foreground"]
c.colors.tabs.odd.fg = xresources["*foreground"]
c.colors.tabs.selected.even.bg = xresources["*color1"]
c.colors.tabs.selected.odd.bg = xresources["*color1"]
c.colors.tabs.selected.even.fg = xresources["*background"]
c.colors.tabs.selected.odd.fg = xresources["*background"]
c.colors.hints.bg = xresources["*foreground"]
c.colors.hints.fg = xresources["*background"]
c.tabs.show = "multiple"
c.tabs.pinned.shrink
c.colors.tabs.bar.bg = xresources["*background"]
c.colors.tabs.pinned.even.bg = xresources["*color5"]
c.colors.tabs.pinned.odd.bg = xresources["*color5"]
c.colors.tabs.pinned.even.fg = xresources["*background"]
c.colors.tabs.pinned.odd.fg = xresources["*background"]
c.colors.tabs.pinned.selected.even.bg = xresources["*color13"]
c.colors.tabs.pinned.selected.odd.bg = xresources["*color13"]
c.colors.tabs.pinned.selected.even.fg = xresources["*background"]
c.colors.tabs.pinned.selected.odd.fg = xresources["*background"]



c.tabs.position = 'Left'
c.tabs.width = 170
c.tabs.padding = {"bottom": 3, "left": 5, "right": 5, "top": 3}

#right click menu
c.colors.contextmenu.menu.bg = xresources["*color13"]
c.colors.contextmenu.menu.fg = xresources["*color20"]
c.colors.contextmenu.selected.bg = xresources["*color6"]
c.colors.contextmenu.selected.fg = xresources["*color20"]


#:set menu
c.colors.completion.item.selected.bg = xresources["*color10"]
c.colors.completion.item.selected.fg = xresources["*background"]
c.colors.completion.item.selected.border.bottom = xresources["*color10"]
c.colors.completion.item.selected.border.top = xresources["*color10"]
c.colors.completion.category.border.bottom = xresources["*color1"]
c.colors.completion.category.border.top = xresources["*color1"]
c.colors.completion.category.bg = xresources["*color9"]
c.colors.completion.category.fg = xresources["*background"]
c.colors.completion.fg = xresources["*foreground"]
c.colors.completion.even.bg = xresources["*background"]
c.colors.completion.odd.bg = xresources["*background"]

#download menu
c.colors.downloads.bar.bg = xresources["*background"]
c.colors.downloads.stop.bg = xresources["*color2"]
c.colors.downloads.stop.fg = xresources["*background"]



# change title format
c.tabs.title.format = "{audio}{current_title}"

# fontsooo
c.fonts.web.size.default = 12
c.fonts.hints = '9pt JetBrainsMono'
c.fonts.statusbar = '8pt JetBrainsMono'
c.fonts.downloads = '8pt JetBrainsMono'
c.fonts.contextmenu = '8pt JetBrainsMono'
c.fonts.tabs.selected = '8pt JetbrainsMono'
c.fonts.tabs.unselected = '8pt JetBrainsMono'
c.fonts.completion.entry = '8pt JetBrainsMono'
c.fonts.completion.category = '8pt JetBrainsMono'
c.fonts.completion.entry = '8pt JetBrainsMono'
#JetbrainsMono


# If not in light theme
if xresources["*background"] != "#ffffff":
    # c.qt.args = ['blink-settings=darkMode=4']
    # c.colors.webpage.prefers_color_scheme_dark = True
    c.colors.webpage.darkmode.enabled = True
    c.hints.border = "1px solid #FFFFFF"
#c.content.user_stylesheets = ['/home/derpalm/.config/qutebrowser/stylesheet.css']
c.content.user_stylesheets = ['~/.config/qutebrowser/coolsheet.css'] 
#c.content.user_stylesheets = ['/home/derpalm/.config/qutebrowser/whitelist.user.js']

#:set content.user_stylesheets coolsheet.css

#Set homepage
#c.url.start_pages = ['/home/derpalm/.config/qutebrowser/home.html']
#c.url.default_page = '/home/derpalm/.config/qutebrowser/home.html'

#c.url.start_pages = ['https://skaar513.github.io/newdir/newhome.html']
#c.url.default_page = 'https://skaar513.github.io/newdir/newhome.html'
#Adblock

c.content.blocking.adblock.lists = [ \
        "https://easylist.to/easylist/easylist.txt", \
        "https://easylist.to/easylist/easyprivacy.txt", \
        "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt", \
        "https://easylist.to/easylist/fanboy-annoyance.txt", \
        "https://secure.fanboy.co.nz/fanboy-annoyance.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt", \
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt" \
        ]

c.content.blocking.enabled = True
c.content.blocking.hosts.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
c.content.blocking.method = 'both'
c.content.autoplay = False

# USERSCRIPTS
#
# personally I use
# - for password managment
#   - qute-pass
# - for chrome casting I use
#   - cast
#   - I have been looking at using catt instead of castnow

# }}}
