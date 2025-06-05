-- sleezwave.nvim lualine theme
-- A synthwave-inspired lualine theme

local colors = require("sleezwave.colors").colors

local sleezwave = {}

sleezwave.normal = {
	a = { fg = colors.bg, bg = colors.electric_cyan, gui = "bold" },
	b = { fg = colors.electric_cyan, bg = colors.dark_purple },
	c = { fg = colors.fg, bg = colors.darker_purple },
}

sleezwave.insert = {
	a = { fg = colors.bg, bg = colors.electric_green, gui = "bold" },
	b = { fg = colors.electric_green, bg = colors.dark_purple },
}

sleezwave.visual = {
	a = { fg = colors.bg, bg = colors.hot_pink, gui = "bold" },
	b = { fg = colors.hot_pink, bg = colors.dark_purple },
}

sleezwave.replace = {
	a = { fg = colors.bg, bg = colors.error, gui = "bold" },
	b = { fg = colors.error, bg = colors.dark_purple },
}

sleezwave.command = {
	a = { fg = colors.bg, bg = colors.neon_yellow, gui = "bold" },
	b = { fg = colors.neon_yellow, bg = colors.dark_purple },
}

sleezwave.terminal = {
	a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
	b = { fg = colors.purple, bg = colors.dark_purple },
}

sleezwave.inactive = {
	a = { fg = colors.dark_purple, bg = colors.darker_purple },
	b = { fg = colors.dark_purple, bg = colors.darker_purple },
	c = { fg = colors.dark_purple, bg = colors.darker_purple },
}

return sleezwave
