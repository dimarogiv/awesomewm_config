local modkey = { }
-- local global_keys_in = require("keybindings.global_keys_in")
-- local global_keys = require("keybindings.global_keys")
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
                awful.key(modkey, "g", function() 
                        local screen = awful.screen.focused()
                        local tag = screen.tags[1]
                        if tag then
                                tag:view_only()
                        end
                end, {description="view tag 1", group="tags"}),
                awful.key(modkey, "p", function() 
                        local screen = awful.screen.focused()
                        local tag = screen.tags[2]
                        if tag then
                                tag:view_only()
                        end
                end, {description="view tag 2", group="tags"}),
                awful.key(modkey, "c", function() 
                        local screen = awful.screen.focused()
                        local tag = screen.tags[3]
                        if tag then
                                tag:view_only()
                        end
                end, {description="view tag 3", group="tags"}),
                awful.key(modkey, ".", function() 
                        local screen = awful.screen.focused()
                        local tag = screen.tags[4]
                        if tag then
                                tag:view_only()
                        end
                end, {description="view tag 4", group="tags"}),
                awful.key(modkey, "r", function()
                        if client.focus then
                                local tag = client.focus.screen.tags[1]
                                if tag then
                                        client.focus:move_to_tag(tag)
                                end
                        end
                end, {description="move to tag 1", group="tags"}),
                awful.key(modkey, ",", function()
                        if client.focus then
                                local tag = client.focus.screen.tags[2]
                                if tag then
                                        client.focus:move_to_tag(tag)
                                end
                        end
                end, {description="move to tag 2", group="tags"}),
                awful.key(modkey, "l", function()
                        if client.focus then
                                local tag = client.focus.screen.tags[3]
                                if tag then
                                        client.focus:move_to_tag(tag)
                                end
                        end
                end, {description="move to tag 3", group="tags"}),
                awful.key(modkey, ";", function()
                        if client.focus then
                                local tag = client.focus.screen.tags[4]
                                if tag then
                                        client.focus:move_to_tag(tag)
                                end
                        end
                end, {description="move to tag 4", group="tags"}),
                awful.key(modkey, "m", awful.tag.viewnext, {description="view next tag", group="tags"}),
                awful.key(modkey, "k", awful.tag.viewprev, {description="view prev tag", group="tags"}),
                awful.key(modkey, "f", awful.tag.history.restore, {description="view recent tag", group="tags"}),
                awful.key(modkey, "y", hotkeys_popup.show_help, {description="show keybindings", group="help"}),
                awful.key(modkey, "x", function() os.execute("wifi on") end, {description="turn wifi on", group="control"}),
                awful.key(modkey, "b", function() os.execute("wifi") end, {description="turn wifi off", group="control"}),
                awful.key(modkey, "w", function() os.execute("amixer set Master 5%+") end, {description="raise volume", group="control"}),
                awful.key(modkey, "j", function() os.execute("amixer set Master 5%-") end, {description="low volume", group="control"}),


                awful.key(modkey, "@", function() 
                        root.keys(global_keys_in)
                --      awful.rules.rules = main.rules(client_keys_in, clientbuttons)
                --      require("signals.signals")
                end, {description="switch mode", group="modes"}),



                awful.key(modkey, "/", function()
                        root.keys(global_keys)
                --      awful.rules.rules = main.rules(client_keys, clientbuttons)
                --      require("signals.signals")
                end, {description="switch to default mode", group="modes"}),



                awful.key(modkey, "v", awesome.restart, {description="reload awesome", group="modes"})
)
return act_mode
