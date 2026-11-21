----------------
--- INCLUDES ---
----------------
-- For Noctalia Color templates
require("noctalia").apply_theme()

-- base
require("modules.animations")
require("modules.binds")
require(".modules.input")
require("modules.layouts")
require("modules.look-and-feel")
require("modules.wokrspaces-and-window-rules")

-- themes
-- For Noctalia Color templates
require("noctalia").apply_theme()
require("modules.themes.catppuccin")
require("modules.themes.gruvbox")
require("modules.themes.kanagawa")
require("modules.themes.tokyonight")

------------------
---- MONITORS ----
------------------
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function ()
--    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("nm-applet")
--    hl.exec_cmd("waybar")
--    hl.exec_cmd("pipewire &")
--    hl.exec_cmd("pipewire-pulse &")
--    hl.exec_cmd("wireplumber &")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
