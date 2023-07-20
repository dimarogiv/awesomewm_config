local awful = require("awful")
local beautiful = require("beautiful")
-- local debian = require("debian.menu")
-- local _ = require("user_variables")
local editor_cmd = user_variables.editor_cmd
local has_fdo, freedesktop = pcall(require, "freedesktop")

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

favorite = {
        { "falkon", "falkon" },
        { "terminal", "xterm" },
        { "writer", "soffice --writer" },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }
local menu_favorite = { "favorite", favorite }

if has_fdo then
    mymainmenu = freedesktop.menu.build({
        before = { menu_awesome, menu_favorite },
        after =  { menu_terminal }
    })
else
    mymainmenu = awful.menu({
        items = {
                  menu_awesome,
                 -- { "Debian", debian.menu.Debian_menu.Debian },
                  menu_terminal,
                }
    })
end

return mymainmenu
