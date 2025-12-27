local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local tabSymbols = {"🈲", "🈂️", "🈯", "🈚"};

-- [General]
config.default_cwd = "C:/main"
config.default_prog = {"C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"}

-- [Window]
config.window_decorations = "RESIZE"
config.window_background_opacity = 1.0
config.window_padding = {
  left = 0, right = 0, top = 15, bottom = 0,
}

-- [Tabs]
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom =  true
config.hide_tab_bar_if_only_one_tab = true
config.colors = { tab_bar = { background = "#282828", active_tab = { bg_color = "#af3a03", fg_color = "#f9f5d7" },}}

-- [Font]
config.font = wezterm.font("Fira Code", {weight="Medium", stretch="Normal", style="Normal"})

-- [Keybinds]
config.leader = {key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {key = 'w', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain'},
  { key = 'k', mods = 'LEADER', action = wezterm.action.CloseCurrentTab {confirm  = false}},
}

for i = 1, 8 do
  table.insert(config.keys, { key = tostring(i), mods = 'LEADER', action = wezterm.action.ActivateTab(i - 1)});
end

-- [Events]
wezterm.on('format-tab-title',
function(tab, tabs, panes, config, hover, max_width)
  local title = tabSymbols[tab.tab_index + 1];
  return title;
end);


-- [Theme]
config.color_scheme = 'Dissonance (Gogh)'
-- [error]
config.warn_about_missing_glyphs = false

return config
