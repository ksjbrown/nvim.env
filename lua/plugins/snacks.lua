return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	config = function(_, opts)
		local Snacks = require("snacks")
		Snacks.setup(opts)
		Snacks.toggle.animate():map("<leader>ua")
		Snacks.toggle.diagnostics():map("<leader>ud")
		Snacks.toggle.dim():map("<leader>uD")
		Snacks.toggle.indent():map("<leader>ui")
		Snacks.toggle.inlay_hints():map("<leader>uh")
		Snacks.toggle.line_number():map("<leader>ul")
		Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
		Snacks.toggle.option("relativenumber", { name = "Relative Line Numbers" }):map("<leader>uL")
		Snacks.toggle.option("wrap", { name = "Word Wrap" }):map("<leader>uw")
		Snacks.toggle.option("list", { name = "Whitespace" }):map("<leader>uW")
		-- prevent flashing in blink.cmp
		local group = vim.api.nvim_create_augroup("snacks_blink_compat", { clear = true })
		vim.api.nvim_create_autocmd("User", {
			group = group,
			pattern = "BlinkCmpMenuOpen",
			callback = Snacks.scroll.disable,
		})
		vim.api.nvim_create_autocmd("User", {
			group = group,
			pattern = "BlinkCmpMenuClose",
			callback = Snacks.scroll.enable,
		})
	end,
	opts = {
		dashboard = {
			enabled = false,
			preset = {
				header = (function()
					local v = vim.version()
					return table.concat({
						"Neovim",
						string.format("Version: v%s.%s.%s", v.major, v.minor, v.patch),
						string.format("Build: %s", v.build or "Stable"),
					}, "\n")
				end)(),
			},
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = { 1, 0 } },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 1, 0 } },
				{ icon = " ", title = "Tools", section = "keys", indent = 2, padding = { 1, 0 } },
				{ section = "startup" },
			},
		},
		explorer = {
			replace_netrw = true,
		},
		indent = { enabled = false },
		lazygit = {},
		picker = {
			sources = {
				explorer = {
					auto_close = true,
					layout = { preset = "default", preview = true },
					hidden = true,
				}
			},
		},
		scroll = {
			animate = {
				duration = { step = 15, total = 150 },
				easing = "linear",
			},
			animate_repeat = {
				delay = 100,
				duration = { step = 5, total = 50 },
				easing = "linear",
			},
		},
		styles = {
			lazygit = {
				height = 0,
				width = 0,
			},
		},
		words = {},
	},
	keys = {
		{ "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Find" },
		{ "<leader>,",       function() Snacks.picker.buffers({ focus = "list" }) end,               desc = "Buffers" },
		{ "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
		{ "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
		{ "<leader>ec",      function() Snacks.explorer({ cwd = vim.fn.stdpath("config") }) end,     desc = "Config" },
		{ "<leader>ee",      function() Snacks.explorer({ cwd = require("util").root() }) end,       desc = "Files" },
		{ "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config" },
		{ "<leader>fd",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Diagnostics (Buffer)" },
		{ "<leader>fD",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
		{ "<leader>ff",      function() Snacks.picker.files({ cwd = require("util").root() }) end,   desc = "Files" },
		{ "<leader>fh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
		{ "<leader>fk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
		{ "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent Files" },
		{ "<leader>fs",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
		{ "<leader>ft",      function() Snacks.terminal() end,                                       desc = "Terminal" },
		{ "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
	},
}
