-- sleezwave.nvim colors
-- Color palette definitions

local Sleezwave = {}

-- Core sleezwave color palette
Sleezwave.colors = {
	-- Base colors
	bg = "#1a0d2e",
	fg = "#c9a9dd",

	-- Accent colors (main synthwave palette)
	hot_pink = "#ff6bcb",
	electric_blue = "#3d5afe",
	electric_cyan = "#00e5ff",
	electric_green = "#69ff94",
	neon_yellow = "#ffeb3b",
	purple = "#ab47bc",

	-- Muted variants (for better readability)
	muted_pink = "#ff8fab",
	muted_blue = "#5c6bc0",
	muted_cyan = "#4dd0e1",
	muted_green = "#7dffb3",
	muted_yellow = "#fff176",
	muted_purple = "#ce93d8",

	-- UI colors
	dark_purple = "#352040",
	darker_purple = "#2d1b3d",
	light_purple = "#e1c4f7",

	-- Status colors
	error = "#ff6b9d",
	warning = "#ffeb3b",
	info = "#00e5ff",
	hint = "#ab47bc",
	success = "#69ff94",

	-- Additional UI elements
	none = "NONE",
	selection = "#2d1b3d",
	cursor = "#ff6bcb",
	line_number = "#352040",
	cursor_line_nr = "#00e5ff",

	-- Git colors
	git_add = "#69ff94",
	git_change = "#ffeb3b",
	git_delete = "#ff6b9d",
	git_conflict = "#ff6bcb",

	-- Diff colors
	diff_add = "#1a3d2e",
	diff_delete = "#3d1a2e",
	diff_change = "#3d3d1a",
	diff_text = "#5c6bc0",
}

-- Light variant colors (for future implementation)
Sleezwave.light_colors = {
	bg = "#f8f0ff",
	fg = "#4a2c5a",
	-- ... (to be implemented)
}

-- Setup terminal colors
function Sleezwave.setup_terminal()
	-- Terminal color palette (0-15)
	vim.g.terminal_color_0 = Sleezwave.colors.bg -- black
	vim.g.terminal_color_1 = Sleezwave.colors.error -- red
	vim.g.terminal_color_2 = Sleezwave.colors.success -- green
	vim.g.terminal_color_3 = Sleezwave.colors.warning -- yellow
	vim.g.terminal_color_4 = Sleezwave.colors.electric_blue -- blue
	vim.g.terminal_color_5 = Sleezwave.colors.purple -- magenta
	vim.g.terminal_color_6 = Sleezwave.colors.electric_cyan -- cyan
	vim.g.terminal_color_7 = Sleezwave.colors.fg -- white

	-- Bright variants
	vim.g.terminal_color_8 = Sleezwave.colors.dark_purple -- bright black
	vim.g.terminal_color_9 = Sleezwave.colors.muted_pink -- bright red
	vim.g.terminal_color_10 = Sleezwave.colors.muted_green -- bright green
	vim.g.terminal_color_11 = Sleezwave.colors.muted_yellow -- bright yellow
	vim.g.terminal_color_12 = Sleezwave.colors.muted_blue -- bright blue
	vim.g.terminal_color_13 = Sleezwave.colors.muted_purple -- bright magenta
	vim.g.terminal_color_14 = Sleezwave.colors.muted_cyan -- bright cyan
	vim.g.terminal_color_15 = Sleezwave.colors.light_purple -- bright white
end

-- Utility functions for color manipulation
function Sleezwave.darken(color, amount)
	if color == "NONE" then
		return color
	end
	local r = tonumber(color:sub(2, 3), 16)
	local g = tonumber(color:sub(4, 5), 16)
	local b = tonumber(color:sub(6, 7), 16)

	r = math.max(0, math.floor(r * (1 - amount)))
	g = math.max(0, math.floor(g * (1 - amount)))
	b = math.max(0, math.floor(b * (1 - amount)))

	return string.format("#%02x%02x%02x", r, g, b)
end

function Sleezwave.lighten(color, amount)
	if color == "NONE" then
		return color
	end
	local r = tonumber(color:sub(2, 3), 16)
	local g = tonumber(color:sub(4, 5), 16)
	local b = tonumber(color:sub(6, 7), 16)

	r = math.min(255, math.floor(r + (255 - r) * amount))
	g = math.min(255, math.floor(g + (255 - g) * amount))
	b = math.min(255, math.floor(b + (255 - b) * amount))

	return string.format("#%02x%02x%02x", r, g, b)
end

function Sleezwave.blend(color1, color2, ratio)
	if color1 == "NONE" or color2 == "NONE" then
		return color1
	end

	local r1 = tonumber(color1:sub(2, 3), 16)
	local g1 = tonumber(color1:sub(4, 5), 16)
	local b1 = tonumber(color1:sub(6, 7), 16)

	local r2 = tonumber(color2:sub(2, 3), 16)
	local g2 = tonumber(color2:sub(4, 5), 16)
	local b2 = tonumber(color2:sub(6, 7), 16)

	local r = math.floor(r1 * (1 - ratio) + r2 * ratio)
	local g = math.floor(g1 * (1 - ratio) + g2 * ratio)
	local b = math.floor(b1 * (1 - ratio) + b2 * ratio)

	return string.format("#%02x%02x%02x", r, g, b)
end

return Sleezwave
