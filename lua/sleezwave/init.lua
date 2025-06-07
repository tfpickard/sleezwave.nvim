-- sleezwave.nvim
-- A synthwave-inspired colorscheme that's easy on the eyes
-- Main plugin entry point

local Sleezwave = {}

-- Default configuration
Sleezwave.config = {
	variant = "dark", -- "dark" or "light" (light coming soon)
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { bold = false },
		functions = { bold = false },
		variables = { bold = false },
	},
	integrations = {
		treesitter = true,
		telescope = true,
		lualine = true,
		nvim_tree = true,
		which_key = true,
		gitsigns = true,
		lsp = true,
		cmp = true,
		dap = true,
		notify = true,
		noice = true,
		mini = true,
		hop = true,
		leap = true,
		flash = true,
		bufferline = true,
		alpha = true,
		dashboard = true,
		indent_blankline = true,
		neo_tree = true,
		trouble = true,
		lazy = true,
		mason = true,
	},
}

-- Plugin setup function
function Sleezwave.setup(opts)
	-- Merge user config with defaults
	Sleezwave.config = vim.tbl_deep_extend("force", Sleezwave.config, opts or {})

	-- Validate variant
	if Sleezwave.config.variant ~= "dark" and Sleezwave.config.variant ~= "light" then
		vim.notify(
			"sleezwave.nvim: Invalid variant '" .. Sleezwave.config.variant .. "', using 'dark'",
			vim.log.levels.WARN
		)
		Sleezwave.config.variant = "dark"
	end
end

-- Load the colorscheme
function Sleezwave.load()
	-- Reset existing highlights
	if vim.g.colors_name then
		vim.cmd("highlight clear")
	end

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	-- Set background and name
	vim.o.background = Sleezwave.config.variant
	vim.g.colors_name = "sleezwave"

	-- Load colors and apply highlights
	local colors = require("sleezwave.colors")
	local highlights = require("sleezwave.highlights")

	-- Apply base highlights
	highlights.setup(colors, Sleezwave.config)

	-- Apply terminal colors if enabled
	if Sleezwave.config.terminal_colors then
		colors.setup_terminal()
	end
end

-- Utility function to get colors (for other plugins)
function Sleezwave.get_colors()
	return require("sleezwave.colors").colors
end

-- Auto command to reload on config change (for development)
function Sleezwave.dev_reload()
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = "*/sleezwave/*",
		callback = function()
			for name, _ in pairs(package.loaded) do
				if name:match("^sleezwave") then
					package.loaded[name] = nil
				end
			end
			Sleezwave.load()
			vim.notify("sleezwave.nvim reloaded", vim.log.levels.INFO)
		end,
		group = vim.api.nvim_create_augroup("SleezwaveDevReload", { clear = true }),
	})
end

return Sleezwave
