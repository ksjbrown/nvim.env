-- https://github.com/nvim-lualine/lualine.nvim
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/noice.nvim",
	},
	lazy = false,
	init = function()
		vim.opt.laststatus = 3
		vim.opt.showcmd = true
		vim.opt.showcmdloc = "statusline"
	end,
	opts = {
		options = {
			disabled_filetypes = {
				statusline = {
					-- "dashboard", "snacks_dashboard",
				},
			},
		},
		sections = {
			lualine_a = {
				{
					"mode",
					fmt = function(res)
						return res:sub(1, 1)
					end,
				},
			},
			lualine_b = {
				"branch",
				"diff",
				"diagnostics",
			},
			lualine_c = {
				{
					"filetype",
					separator = "",
					icon_only = true,
					padding = {
						left = 1,
						right = 0,
					},
				},
				{
					"filename",
					file_status = true,
					path = 1,
				},
			},
			lualine_x = {
				{ "%S", separator = "" },
				{
					require("noice").api.status.mode.get,
					cond = require("noice").api.status.mode.has,
					color = { fg = "#ff9e64" },
				},
				{
					"fileformat",
				},
			},
			lualine_y = {
				{
					"progress",
					separator = "",
					padding = {
						left = 1,
						right = 0,
					},
				},
				{
					"location",
					padding = {
						left = 1,
						right = 0,
					},
				},
			},
			lualine_z = {
				{
					"datetime",
					style = "%H:%M",
				},
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
	},
}
