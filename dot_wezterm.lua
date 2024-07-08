-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("format-tab-title", function(tab)
	return {
		{ Attribute = { Intensity = "Bold" } },
		{ Text = "  " },
		{ Text = tab.active_pane.title },
		{ Text = "  " },
	}
end)
-- Show time and date on statusbar
wezterm.on("update-right-status", function(window)
	window:set_right_status(wezterm.format({
		{ Attribute = { Intensity = "Bold" } },
		{ Text = wezterm.strftime(" %d %B %Y %I:%M %p ") },
	}))
end)
-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 13
config.cell_width = 0.9
config.color_scheme = "Catppuccin Macchiato"
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 10,
	right = 0,
	top = 10,
	bottom = 0,
}
config.tab_bar_at_bottom = true
config.show_tab_index_in_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_max_width = 50
config.show_update_window = true
-- config.win32_system_backdrop = "Acrylic"
-- and finally, return the configuration to wezterm
return config
