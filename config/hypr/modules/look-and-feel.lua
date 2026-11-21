-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border = {
                colors = {
                    -- default theme. ideal for catppuccin and tokyonight
                    "rgb(89b4fa)",
                    "rgb(7dd79b)",
                },
                angle = 45
            },

            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "scrolling",
    },

    decoration = {
        rounding       = 6,
        rounding_power = 7,

        active_opacity   = 0.989,
        inactive_opacity = 0.989,

        shadow = {
            enabled      = true,
            range        = 6,
            render_power = 4,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 4,
            vibrancy  = 0.1996,
            variant   = "water",

            water = {
                damping = 0.5,
                duration = 10.0,
                radius = 30.0,
                speed = 0.17,
                strength = 1.0
            },

            acrylic = {
                aberration = 0.10,
                bulb = 64.0,
                clarity = 0.2,
                refraction = 12.0,
                tint = 0x14EEF5FF
            },
        },

        wobble = {
            enabled = true,
            mesh = 32,
            stiffness = 100,
        },

        glow = {
            enabled = false,
            color = 0x14EEF5FF,
            range = 10,
            render_power = 1
        },

        motion_blur = {
            enabled = true,
            samples = 2
        },
    },

    animations = {
        enabled = true,
        workspace_wraparound = true,
    },
})
