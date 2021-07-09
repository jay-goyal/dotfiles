config.load_autoconfig(False)
c.backend = 'webengine'
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version} Edg/{upstream_browser_version}', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
c.downloads.location.directory = '/home/jay/Downloads'
c.downloads.location.prompt = True
c.url.default_page = 'https://search.brave.com'
c.url.searchengines = {'DEFAULT': 'https://search.brave.com/search?q=a{}', 'aw': 'https://wiki.archlinux.org/?search={}', 'yt': 'https://www.youtube.com/results?search_query={}'}
c.url.start_pages = 'https://search.brave.com/'
c.colors.webpage.darkmode.enabled = True
c.fonts.default_family = '"Roboto"'
c.fonts.default_size = '11pt'
c.fonts.completion.entry = '11pt "Roboto"'
c.fonts.debug_console = '11pt "Roboto"'
c.fonts.prompts = 'default_size Roboto'
c.fonts.statusbar = '11pt "Roboto"'

