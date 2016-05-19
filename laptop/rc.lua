--- My laptop awesome config

--- Required files
-- {{{
local awful = require('awful')
local pass = dofile ('/home/thartman/projects/awesome-pass/awesome-pass.lua')
local beautiful = require('beautiful')
awful.client = require('awful.client')
cawful.screen = require('awful.screen')
awful.rules = require ('awful.rules')
awful.menu = require('awful.menu')
-- }}}

--- Initialize
-- {{{
-- The conf array contains and controls all elements for configuring
-- awesome. The goal is to have the awesome configuration more data
-- driven, hiding the actual implementation to modules and other libraries
conf = {}
conf.config_dir = '/home/' .. os.getenv('USER') .. '/.config/awesome/'
conf.modules_dir = conf.config_dir .. 'modules/'
-- The modkey is the primary means of interacting with awesome. By
-- default this is set to mod4, sometimes called the 'super' key or
-- 'windows' key depending on your specific keyboard layout
modkey = 'Mod4'
-- }}}

--- Theme
-- {{{
-- conf.theme = '/home/thartman/projects/awesomerc/modules/theme.lua'
-- local beautiful = require('beautiful')
-- beautiful.init(conf.theme)
-- }}}

--- Default tools and programs
-- {{{
-- Defines programs and tools for common system functions
conf.tools = {}
conf.tools.terminal_cmd = 'urxvt'
conf.tools.compmgr_cmd = 'xcompmgr'
conf.tools.compmgr_cmdopts = '-f -c -s'
conf.tools.filemanager_cmd = 'mc'
conf.tools.browser_cmd = os.getenv('BROWSER') or 'firefox'
conf.tools.editor_cmd = os.getenv('EDITOR') or 'et'
conf.tools.screenlock_cmd = 'xscreensaver-command'
conf.tools.screenlock_cmdopts = '-l'
conf.tools.background_cmd = 'nitrogen'
conf.tools.background_cmdopts = '--restore'
-- }}}

--- Common Functions
-- {{{
-- Defines common system functions for use in keybindings and menu
-- commands. Currently the defined functions are:
--    system_lock: Call the screen lock command as defined in the 'Tools
--                 and Programs' section
--    reboot: Queries the user if they really want to reboot and then calls
--            the reboot command as defined in the 'Tools and Programs' section
--    shutdown: Queries the user if they really want to shutdown the computer,
--              then calls the shutdown command as defined in the 'Tools and
--              Programs' section
--                  
conf.funcs = dofile (conf.modules_dir .. 'functions.lua')
-- }}}

-- Widget definitions
-- {{{
-- Define the various widgets that will be
-- displayed in awesome.  These will be placed in wiboxes and system
-- trays in the 'Screen, Tags, and Layouts' section
conf.widgets = {}
conf.widgets.clock = awful.widget.textclock()
local base = wibox.widget.textbox()
base:set_text("pass")
conf.widgets.pass = pass(base)
-- }}}

-- Screen, Layouts, and Tags
-- {{{
-- Define the number of screens, the number of tags per screen and the
-- layouts for the default layout for those tags. A 'screen' in this
-- case represents what will be present on the physical monitor. You
-- can define multiple screens here if you have multiple
-- monitors. Tags in awesome are what other window managers refer to
-- as workspaces or virtual desktops. The number or names of tags can
-- vary between screens. The 'layout' is how awesome will by default
-- organize the windows on that tag (tiling) 
conf.screens = {}
conf.layouts = {
   awful.layout.suit.floating,
   awful.layout.suit.tile,
   awful.layout.suit.tile.left,
   awful.layout.suit.tile.bottom,
   awful.layout.suit.tile.top,
   awful.layout.suit.fair,
   awful.layout.suit.fair.horizontal,
   awful.layout.suit.spiral,
   awful.layout.suit.spiral.dwindle,
   awful.layout.suit.max,
   awful.layout.suit.max.fullscreen,
   awful.layout.suit.magnifier
}
conf.screens[1] = {}
conf.screens[1].tags =
   { names = {'chat','code','read','surf','watch','create','system','monitor',},
     layout = { conf.layouts[3],
                conf.layouts[10],
                conf.layouts[3],
                conf.layouts[10],
                conf.layouts[1],
                conf.layouts[1],
                conf.layouts[3],
                conf.layouts[4],
     }
   }
conf.screens[1].widgets = { conf.widgets.pass,
                            conf.widgets.clock }
-- }}}

-- Menus
-- {{{ 
conf.menus = {}
conf.menus.sys = {
   { '&lock'     , conf.funcs.system_lock },
   { '&reboot'   , conf.funcs.reboot      },
   { '&shutdown' , conf.funcs.shutdown    },
}

conf.menus.awesome = {
   { '&edit config'     ,                 },
   { '&restart awesome' , awesome.restart },
   { '&quit awesome'    , awesome.quit    },
}

conf.menus.apps = {
}

conf.menus.main = {
   { '&system'  , conf.menus.sys     },
   { '&apps'    , conf.menus.apps    },
   { '&awesome' , conf.menus.awesome },
}

dofile ('/home/thartman/projects/awesomerc/modules/menu.lua')
-- }}}

--- Keybindings
-- {{{ 
conf.keys = {}
conf.keys.global = {
   { { modkey }, "F12", conf.funcs.system_lock },
   --   { { modkey }, "c"  , function () os.execute("xsel -p -i | xsel - i -b") end},
   { { modkey }, "Print",
      function () os.execute("scrot -e 'mv $f " .. conf.dirs.screenshots ..
                             " 2>/dev/null'" ) end},
}

dofile ('/home/thartman/projects/awesomerc/modules/keys.lua')
-- }}}

--- Mouse Buttons
-- {{{
dofile ('/home/thartman/projects/awesomerc/modules/mouse.lua')
-- }}}

-- Setup the screens
dofile ('/home/thartman/projects/awesomerc/modules/screens.lua')

-- Rules {{{
-- Global rules to define how certain programs are
-- handled by awesome. Primarily this is used to let certain programs
-- 'float' rather than become part of the tiled window set. This is
-- useful for popup programs or programs that have their own method
-- for running in fullscreen mode

conf.rules = {
   { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = conf.clientkeys,
                     buttons = conf.buttons.client } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    { rule = { class = "emacs" },
      properties = { tag = tags[1][2] } },
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][4] } }
}

-- Setup the windowing rules
dofile ('/home/thartman/projects/awesomerc/modules/rules.lua')
-- }}}

-- Setup client rules
dofile ('/home/thartman/projects/awesomerc/modules/client.lua')