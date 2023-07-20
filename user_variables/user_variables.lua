terminal = "xterm"
browser = "falkon"
editor = os.getenv("EDITOR") or "vim"
modkey = "Mod1"

vars = {
        terminal = terminal,
        editor = editor,
        editor_cmd = terminal .. " -e " .. editor,
        modkey = modkey,
        browser = browser
}
return vars
