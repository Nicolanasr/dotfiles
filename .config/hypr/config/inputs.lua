-- Input configuration

hl.config({
    input = {
    	sensitivity = 0,
        accel_profile = "adaptive",
	follow_mouse = 1,
	touchpad = {
		natural_scroll = true,
		tap_to_click = true,
		clickfinger_behavior = true,
		scroll_factor = 0.35,
		disable_while_typing = true,
	},
    },
    -- Uncomment the section below to enable software cursors; this can help with cursor display or behavior issues
    -- cursor = {
    --     no_hardware_cursors = 1,
    -- },
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "close" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left",       action = "float" })
