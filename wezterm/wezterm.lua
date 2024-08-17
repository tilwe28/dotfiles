local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.colors = {
	foreground = "#d8d8d8",
	background = "#1a1e28",
	cursor_bg = "#c7c7c7",
	cursor_fg = "#575458",
	cursor_border = "#c7c7c7",
	selection_fg = "#000000",
	selection_bg = "#c6dcfb",

	ansi = {
		"#000000",
		"#b8301a",
		"#57bf37",
		"#fbfe54",
		"#4172f6",
		"#cd2bf6",
		"#58c2c5",
		"#d8d8d8",
	},
	brights = {
		"#666666",
		"#ed756c",
		"#7ff268",
		"#f3f06f",
		"#5284ec",
		"#ed7df8",
		"#8df9fd",
		"#feffff",
	},
}

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 25

config.adjust_window_size_when_changing_font_size = false

config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Medium" })
config.font_size = 16
config.harfbuzz_features = { "ss02", "ss03", "ss05", "ss08", "cv02", "cv16", "cv25", "cv26", "cv30" }

config.bold_brightens_ansi_colors = "BrightAndBold"
-- config.foreground_text_hsb = {
-- 	hue = 1.0,
-- 	saturation = 1.1,
-- 	brightness = 1.1,
-- }

config.freetype_interpreter_version = 40
config.max_fps = 180
config.term = "wezterm"

config.audible_bell = "Disabled"
config.automatically_reload_config = true

return config
