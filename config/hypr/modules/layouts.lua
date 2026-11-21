---------------
--- LAYOUTS ---
---------------
hl.config({
    dwindle = {
        force_split = 0,
        preserve_split = true, -- You probably want this
        smart_split = false,
        smart_resizing = true,
        permanent_direction_override = false,
        special_scale_factor = 1.0,
        split_width_multiplier = 1.0,
        use_active_for_splits = true,
        default_split_ratio = 1.0,
        split_bias = 0,
        precise_mouse_move = false
    },
})

hl.config({
    master = {
        new_status = "slave",
        allow_small_split = false,
        special_scale_factor = 1,
        mfact = 0.50,
        new_on_top = false,
        new_on_active = "none",
        orientation = "left",
        center_master_fallback = "left",
        slave_count_for_center_master = 2,
        smart_resizing = true,
        drop_at_cursor = true,
        always_keep_position = false
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.5,
        focus_fit_method = 1,
        follow_focus = true,
        follow_min_visible = 0.5,
        explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
        direction = "right",
    },
})

----------------
----  MISC  ----
----------------
hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = true,
    },
})
