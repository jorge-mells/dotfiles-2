-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	-- disable annoying close confirmation prompt
	window_close_confirmation = "NeverPrompt",
	window_decorations = "NONE", -- disable title bar
	default_cursor_style = "BlinkingBar",
	color_scheme = "Tokyo Night Storm",
	font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),
	font_size = 15,
	window_padding = {
		left = 3,
		right = 3,
		top = 3,
		bottom = 0,
	},
	background = {
		-- Layer 1: Solid black base
		{
			source = { Color = "#000000" },
			width = "100%",
			height = "100%",
			opacity = 1.0,
		},
		-- Layer 2: The image
		{
			source = { File = "/home/jorgemells/.config/wezterm/backgrounds/tokyonight-blurred.png" },
			width = "100%",
			height = "100%",
			hsb = { brightness = 0.12, saturation = 1.0 },
			opacity = 1.0,
		},
		-- Layer 3: The "Tokyo Night" Tint (Deep blue overlay)
		{
			source = { Color = "#1a1b26" },
			width = "100%",
			height = "100%",
			opacity = 0.6, -- Adjust this to 0.3 if you want more image detail
		},
	},
	-- these features don't work well on wayland + gnome, annoyingly
	-- window_background_opacity = 0.8,
	-- only works in kde
	-- kde_window_background_blur = true,
}

-- NOTE: event handlers
--
-- startup fullscreen
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- return the configuration to wezterm:
return config
