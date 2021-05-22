local awful = require('awful')
require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('configuration.apps')
-- Key bindings
local globalKeys =
  awful.util.table.join(
  -- Hotkeys
  awful.key({modkey}, 'F1', hotkeys_popup.show_help, {description = 'Show help', group = 'awesome'}),
  -- Tag browsing
  awful.key({modkey}, 'w', awful.tag.viewprev, {description = 'view previous', group = 'tag'}),
  awful.key({modkey}, 's', awful.tag.viewnext, {description = 'view next', group = 'tag'}),
  awful.key({altkey, 'Control'}, 'Up', awful.tag.viewprev, {description = 'view previous', group = 'tag'}),
  awful.key({altkey, 'Control'}, 'Down', awful.tag.viewnext, {description = 'view next', group = 'tag'}),
  awful.key({modkey}, 'Escape', awful.tag.history.restore, {description = 'go back', group = 'tag'}),
  -- Default client focus
  awful.key(
    {modkey},
    'd',
    function()
      awful.client.focus.byidx(1)
    end,
    {description = 'Focus next by index', group = 'client'}
  ),
  awful.key(
    {modkey},
    'h',
    function()
      awful.client.focus.byidx(-1)
    end,
    {description = 'Focus previous by index', group = 'client'}
  ),
  awful.key(
    {modkey},
    'r',
    function()
      awful.spawn(apps.default.rofi)
    end,
    {description = 'Main menu', group = 'awesome'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'r',
    function()
      awful.spawn('reboot')
    end,
    {description = 'Reboot Computer', group = 'awesome'}
  ),
  awful.key(
    {modkey, 'Shift'},
    's',
    function()
      awful.spawn('shutdown now')
    end,
    {description = 'Shutdown Computer', group = 'awesome'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'l',
    function()
      _G.exit_screen_show()
    end,
    {description = 'Log Out Screen', group = 'awesome'}
  ),
  -- Programms
  awful.key(
    {modkey},
    'l',
    function()
      awful.spawn(apps.default.lock)
    end,
    {description = 'Lock the screen', group = 'awesome'}
  ),
  awful.key(
    {modkey},
    'Print',
    function()
      awful.util.spawn_with_shell(apps.default.delayed_screenshot)
    end,
    {description = 'Mark an area and screenshot it 10 seconds later (clipboard)', group = 'screenshots (clipboard)'}
  ),
  awful.key(
    {modkey},
    'p',
    function()
      awful.util.spawn_with_shell(apps.default.screenshot)
    end,
    {description = 'Take a screenshot of your active monitor and copy it to clipboard', group = 'screenshots (clipboard)'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'p',
    function()
      awful.util.spawn_with_shell(apps.default.region_screenshot)
    end,
    {description = 'Mark an area and screenshot it to your clipboard', group = 'screenshots (clipboard)'}
  ),
  awful.key(
    {modkey},
    'c',
    function()
      awful.util.spawn(apps.default.editor)
    end,
    {description = 'Open a text/code editor', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'b',
    function()
      awful.util.spawn(apps.default.browser)
    end,
    {description = 'Open a browser', group = 'launcher'}
  ),
  -- Standard program
  awful.key(
    {modkey},
    'x',
    function()
      awful.spawn(apps.default.terminal)
    end,
    {description = 'Open a terminal', group = 'launcher'}
  ),
  awful.key({modkey, 'Control'}, 'r', _G.awesome.restart, {description = 'reload awesome', group = 'awesome'}),
  awful.key({modkey, 'Control'}, 'q', _G.awesome.quit, {description = 'quit awesome', group = 'awesome'}),
  awful.key(
    {modkey, 'Shift'},
    'Right',
    function()
      awful.tag.incmwfact(0.05)
    end,
    {description = 'Increase master width factor', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'Left',
    function()
      awful.tag.incmwfact(-0.05)
    end,
    {description = 'Decrease master width factor', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'Down',
    function()
      awful.client.incwfact(0.05)
    end,
    {description = 'Decrease master height factor', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'Up',
    function()
      awful.client.incwfact(-0.05)
    end,
    {description = 'Increase master height factor', group = 'layout'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'Left',
    function()
      awful.tag.incnmaster(1, nil, true)
    end,
    {description = 'Increase the number of master clients', group = 'layout'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'Right',
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {description = 'Decrease the number of master clients', group = 'layout'}
  ),
  awful.key(
    {altkey, 'Control'},
    'Left',
    function()
      awful.tag.incncol(1, nil, true)
    end,
    {description = 'Increase the number of columns', group = 'layout'}
  ),
  awful.key(
    {altkey, 'Control'},
    'Right',
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    {description = 'Decrease the number of columns', group = 'layout'}
  ),
  awful.key(
    {modkey},
    'Tab',
    function()
      awful.layout.inc(1)
    end,
    {description = 'Select next', group = 'layout'}
  ),
  awful.key(
    {altkey},
    'Tab',
    function()
      awful.spawn(apps.default.rofi_win)
    end,
    {description = 'Active applications', group = 'awesome'}
  ),
  awful.key(
    {modkey, 'Control'},
    'n',
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        _G.client.focus = c
        c:raise()
      end
    end,
    {description = 'restore minimized', group = 'client'}
  ),
  -- Dropdown application
  awful.key(
    {modkey},
    'z',
    function()
      _G.toggle_quake()
    end,
    {description = 'dropdown application', group = 'launcher'}
  ),
  -- Widgets popups
  --[[awful.key(
    {altkey},
    'h',
    function()
      if beautiful.fs then
        beautiful.fs.show(7)
      end
    end,
    {description = 'Show filesystem', group = 'widgets'}
  ),
  awful.key(
    {altkey},
    'w',
    function()
      if beautiful.weather then
        beautiful.weather.show(7)
      end
    end,
    {description = 'Show weather', group = 'widgets'}
  ),--]]
  -- Brightness
  -- awful.key(
  --   {},
  --   'XF86MonBrightnessUp',
  --   function()
  --     awful.spawn('xbacklight -inc 10')
  --   end,
  --   {description = '+10%', group = 'hotkeys'}
  -- ),
  -- awful.key(
  --   {},
  --   'XF86MonBrightnessDown',
  --   function()
  --     awful.spawn('xbacklight -dec 10')
  --   end,
  --   {description = '-10%', group = 'hotkeys'}
  -- ),
  -- ALSA volume control
  awful.key(
    {},
    'XF86AudioRaiseVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 5%+')
    end,
    {description = 'volume up', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioLowerVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 5%-')
    end,
    {description = 'volume down', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioMute',
    function()
      awful.spawn('amixer -D pulse set Master 1+ toggle')
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioNext',
    function()
      --
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86PowerDown',
    function()
      --
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86PowerOff',
    function()
      _G.exit_screen_show()
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  -- Screen management
  -- awful.key(
  --   {modkey},
  --   'o',
  --   awful.client.movetoscreen,
  --   {description = 'move window to next screen', group = 'client'}
  -- ),
  -- Open default program for tag
  awful.key(
    {modkey},
    't',
    function()
      awful.spawn(
          awful.screen.focused().selected_tag.defaultApp,
          {
            tag = _G.mouse.screen.selected_tag,
            placement = awful.placement.bottom_right
          }
        )
    end,
    {description = 'Open default program for tag/workspace', group = 'tag'}
  ),
  -- Custom hotkeys
  -- File Manager
  awful.key(
    {modkey},
    'e',
    function()
      awful.util.spawn(apps.default.files)
    end,
    {description = 'filebrowser', group = 'hotkeys'}
  ),
  -- Emoji Picker
  awful.key(
    {modkey},
    'a',
    function()
      awful.util.spawn('gnome-characters')
    end,
    {description = 'Open the ibus emoji picker to copy an emoji to your clipboard', group = 'hotkeys'}
  )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus
  if i == 1 or i == 9 then
    descr_view = {description = 'view tag #', group = 'tag'}
    descr_toggle = {description = 'toggle tag #', group = 'tag'}
    descr_move = {description = 'move focused client to tag #', group = 'tag'}
    descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
  end
  globalKeys =
    awful.util.table.join(
    globalKeys,
    -- View tag only.
    awful.key(
      {modkey},
      '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      descr_view
    ),
    -- Move client to tag.
    awful.key(
      {modkey, 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:move_to_tag(tag)
          end
        end
      end,
      descr_move
    )
  )
end

return globalKeys
