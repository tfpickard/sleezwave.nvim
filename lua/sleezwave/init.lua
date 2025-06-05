-- sleezwave.nvim
-- A synthwave-inspired colorscheme that's easy on the eyes
-- Main plugin entry point

local M = {}

-- Default configuration
M.config = {
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
function M.setup(opts)
	-- Merge user config with defaults
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	-- Validate variant
	if M.config.variant ~= "dark" and M.config.variant ~= "light" then
		vim.notify("sleezwave.nvim: Invalid variant '" .. M.config.variant .. "', using 'dark'", vim.log.levels.WARN)
		M.config.variant = "dark"
	end
end

-- Load the colorscheme
function M.load()
	-- Reset existing highlights
	if vim.g.colors_name then
		vim.cmd("highlight clear")
	end

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	-- Set background and name
	vim.o.background = M.config.variant
	vim.g.colors_name = "sleezwave"

	-- Load colors and apply highlights
	local colors = require("sleezwave.colors")
	local highlights = require("sleezwave.highlights")

	-- Apply base highlights
	highlights.setup(colors, M.config)

	-- Apply terminal colors if enabled
	if M.config.terminal_colors then
		colors.setup_terminal()
	end
end

-- Utility function to get colors (for other plugins)
function M.get_colors()
	return require("sleezwave.colors").colors
end

-- Auto command to reload on config change (for development)
function M.dev_reload()
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = "*/sleezwave/*",
		callback = function()
			for name, _ in pairs(package.loaded) do
				if name:match("^sleezwave") then
					package.loaded[name] = nil
				end
			end
			M.load()
			vim.notify("sleezwave.nvim reloaded", vim.log.levels.INFO)
		end,
		group = vim.api.nvim_create_augroup("SleezwaveDevReload", { clear = true }),
	})
end

return M
