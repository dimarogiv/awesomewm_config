local awful = require("awful")
local gears = require("gears")
mousekeys = gears.table.join(
    awful.button({ }, 3, function () main.mymainmenu:toggle() end)
)
return mousekeys
