local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.quit_when_all_windows_are_closed = false

-- colorscheme
config.colors = {
	foreground = "#d8d8d8",
	background = "#1a1e28",
	cursor_bg = "#c7c7c7",
	cursor_fg = "#575458",
	cursor_border = "#c7c7c7",
	selection_fg = "#000000",
	selection_bg = "#c6dcfb",

	ansi = {
		"#000000", -- black
		"#b8301a", -- red
		"#57bf37", -- green
		"#fbfe54", -- yellow
		"#4172f6", -- blue
		"#cd2bf6", -- magenta
		"#58c2c5", -- cyan
		"#d8d8d8", -- white
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

-- display settings
config.freetype_interpreter_version = 40
config.max_fps = 180
config.term = "wezterm"
config.bold_brightens_ansi_colors = "BrightAndBold"
-- config.foreground_text_hsb = {
-- 	hue = 1.0,
-- 	saturation = 1.1,
-- 	brightness = 1.1,
-- }

-- background
config.background = {
	{
		source = { File = "/Users/tilwe/Pictures/saved/aurora_lake.jpeg" },
		hsb = { brightness = 0.1 },
	},
	{
		source = { Color = "#1a1e28" },
		width = "100%",
		height = "100%",
		opacity = 0.95,
	},
}

-- pane appearance
config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 1,
}

-- tab settings
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.colors.tab_bar = {
	background = "#1a1e28",

	active_tab = {
		-- bg_color = "#4172f6",
		-- fg_color = "#1a1e28",
		bg_color = "#1a1e28",
		fg_color = "#d8d8d8",
		intensity = "Bold",
	},
	inactive_tab = {
		bg_color = "#1a1e28",
		fg_color = "#666666",
		intensity = "Normal",
	},
	inactive_tab_hover = {
		bg_color = "#1a1e28",
		fg_color = "#999999",
		italic = false,
		intensity = "Bold",
	},
}

-- window settings
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 25
config.adjust_window_size_when_changing_font_size = false

-- font settings
config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Medium" })
config.font_size = 16
config.harfbuzz_features = { "ss02", "ss03", "ss05", "ss08", "cv02", "cv16", "cv25", "cv26", "cv30" }

-- misc
config.audible_bell = "Disabled"
config.animation_fps = 60

-- multiplexing keybinds
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "|",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "m",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "r",
		action = wezterm.action.RotatePanes("CounterClockwise"),
	},
	{
		mods = "LEADER",
		key = "s",
		action = wezterm.action.PaneSelect({ mode = "SwapWithActiveKeepFocus", alphabet = "123456789" }),
	},

	-- pane navigation
	-- {
	-- 	mods = "CTRL",
	-- 	key = "h",
	-- 	action = wezterm.action.ActivatePaneDirection("Left"),
	-- },
	-- {
	-- 	mods = "CTRL",
	-- 	key = "j",
	-- 	action = wezterm.action.ActivatePaneDirection("Down"),
	-- },
	-- {
	-- 	mods = "CTRL",
	-- 	key = "k",
	-- 	action = wezterm.action.ActivatePaneDirection("Up"),
	-- },
	-- {
	-- 	mods = "CTRL",
	-- 	key = "l",
	-- 	action = wezterm.action.ActivatePaneDirection("Right"),
	-- },

	-- tab navigation
	{
		mods = "SHIFT",
		key = "RightArrow",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "SHIFT",
		key = "LeftArrow",
		action = wezterm.action.ActivateTabRelative(-1),
	},

	-- create a new workspace
	{
		mods = "LEADER",
		key = "w",
		action = wezterm.action.PromptInputLine({
			description = "Enter workspace name",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(wezterm.action.SwitchToWorkspace({ name = line }), pane)
				end
			end),
		}),
	},
	{
		mods = "LEADER",
		key = "Enter",
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
	-- rename tab
	{
		mods = "LEADER",
		key = ":",
		action = wezterm.action.PromptInputLine({
			description = "Enter tab name",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	{
		mods = "LEADER",
		key = "y",
		action = wezterm.action.ActivateCopyMode,
	},

	-- open configuration file
	{
		mods = "CMD",
		key = ",",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			args = {
				"/opt/homebrew/bin/nvim",
				os.getenv("WEZTERM_CONFIG_DIR"),
			},
		}),
	},
}

-- tab navigation by index
for i = 0, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

-- status bar
wezterm.on("update-status", function(window, pane)
	-- leader key indication
	local bg_color = { Color = "#5284ec" }
	local fg_color = { Color = "#1a1e28" }
	local workspace = wezterm.mux.get_active_workspace()

	if workspace == "default" then
		bg_color = { Color = "#666666" }
	end

	if window:leader_is_active() then
		bg_color = { Color = "#57bf37" }
	end

	window:set_left_status(wezterm.format({
		{ Background = bg_color },
		{ Foreground = fg_color },
		{ Attribute = { Intensity = "Bold" } },
		{ Text = " " .. workspace .. " " },
	}))

	-- pane zoom indication
	local zoomed = ""
	local panes = pane:tab():panes_with_info()

	for _, p in pairs(panes) do
		if p.is_active and p.is_zoomed then
			zoomed = utf8.char(0x1f50e) .. " "
		end
	end

	window:set_right_status(zoomed)
end)

-- domains (persistant workspaces)
config.unix_domains = {
	{
		name = "unix",
	},
}
config.default_gui_startup_args = { "connect", "unix" }
config.default_domain = "unix"

-- smart splits
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
smart_splits.apply_to_config(config, {
	direction_keys = { "h", "j", "k", "l" },
	modifiers = {
		move = "CTRL",
		resize = "META",
	},
})

return config
