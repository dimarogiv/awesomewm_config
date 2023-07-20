local modkey = {}
act_mode = gears.table.join(
                -- Apps startups
                -- Window managing
                -- Other actions
                awful.key(modkey, "h", function() awful.spawn(terminal) end, {description="terminal", group="launcher"}),
                awful.key(modkey, "u", function() awful.spawn(browser) end, {description="browser", group="launcher"}),
                awful.key(modkey, "t", function() awful.client.focus.byidx(1) end, {description="focus on next", group="windows"}),
                awful.key(modkey, "e", function() awful.client.focus.byidx(-1) end, {description="focus on prev", group="windows"}),
                awful.key(modkey, "n", function() awful.client.focus.history.previous() client.focus:raise() end, {description="focus on recent", group="windows"}),
                awful.key(modkey, "a", function() awful.client.swap.byidx(1) end, {description="swap with next", group="windows"}),
                awful.key(modkey, "-", function() menubar.show() end, {description="increase the number of columns", group="windows"}),
                awful.key(modkey, "m", awful.tag.viewnext, {description="view next tag", group="tags"}),
                awful.key(modkey, "k", awful.tag.viewprev, {description="view prev tag", group="tags"}),
                awful.key(modkey, "f", awful.tag.history.restore, {description="view recent tag", group="tags"}),
                awful.key(modkey, "y", hotkeys_popup.show_help, {description="show keybindings", group="help"}),
                awful.key(modkey, "x", function() awful.spawn("wifi on") end, {description="turn wifi on", group="control"}),
                awful.key(modkey, "b", function() awful.spawn("wifi") end, {description="turn wifi off", group="control"}),
                awful.key(modkey, "w", function() awful.spawn("amixer set Master +5%") end, {description="raise volume", group="control"}),
                awful.key(modkey, "j", function() awful.spawn("amixer set Master -5%") end, {description="low volume", group="control"}),


                awful.key({"Shift"}, "@", function() 
                        root.keys(require("keybindings.global_keys_in"))
                        awful.rules.rules = main.rules(clientkeys_in, clientbuttons)
                end, {description="switch mode", group="modes"}),



                awful.key(modkey, "/", function() root.keys(require("keybindings.global_keys")) end, {description="switch to default mode", group="modes"}),



                awful.key(modkey, "v", awesome.restart, {description="reload awesome", group="modes"})
)
return act_mode
