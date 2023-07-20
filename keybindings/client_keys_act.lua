local modkey = { } 
client_act_mode = gears.table.join(
                awful.key(modkey, "o", function(c) c.maximized = not c.maximized c:raise() end, {description="maximize", group="windows"}),
                awful.key(modkey, "s", function(c) c:kill() end, {description="close", group="windows"})
                )
return client_act_mode
