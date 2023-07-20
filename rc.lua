pcall(require, "luarocks.loader")

-- Standard awesome library
gears = require("gears")
awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")
menubar = require("menubar")
hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
-- Load Debian menu entries
local has_fdo, freedesktop = pcall(require, "freedesktop")
require("error_handling.error_handling")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("/home/dima/.config/awesome/default/theme.lua")

-- This is used later as the default terminal and editor to run.
user_variables = require("user_variables.user_variables")
editor = user_variables.editor
editor_cmd = user_variables.editor_cmd
terminal = user_variables.terminal
browser = user_variables.browser
default_modkey = user_variables.modkey
-- Table of layouts to cover with awful.layout.inc, order matters.

main = {
        mymainmenu = require("menu.main_menu"),
        layouts = require("layouts.layouts"),
        rules = require("rules.rules"),
        tags = require("tags.tags")
}

menubar.utils.terminal = terminal -- Set the terminal for applications that require it

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

mytextclock = wibox.widget.textclock()

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)
    -- Each screen has its own tag table.
    awful.tag(main.tags, s, main.layouts)
end)
-- }}}

-- {{{ Mouse bindings
local mousekeys = require("keybindings.mouse_keys")
root.buttons(mousekeys)
-- }}}

-- {{{ Key bindings
-- local globalkeys = require("keybindings.global_keys")
client_keys_act = require("keybindings.client_keys_act")
client_keys_in = require("keybindings.client_keys_in")
global_keys_in = require("keybindings.global_keys_in")
global_keys_act = require("keybindings.global_keys_act")
global_keys = require("keybindings.global_keys")
client_keys = require("keybindings.client_keys")

-- Bind all key numbers to tags.
-- require("keybindings.keys_to_tags")
clientbuttons = require("keybindings.client_buttons")

-- Set keys
root.keys(global_keys_act)
-- }}}
awful.rules.rules = main.rules(client_keys_in, clientbuttons)

require("signals.signals")
