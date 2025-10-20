return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
			{ "igorlfs/nvim-dap-view" },
		},
		config = function(_,_)
			require("dap")
			vim.api.nvim_set_hl(0, 'RedCursor', { fg='#F38BA8' })
			vim.api.nvim_set_hl(0, 'YellowCursor', { fg='#FFCC00' })
			vim.api.nvim_set_hl(0, 'YellowBack', { bg="#4C4C19" })
			vim.fn.sign_define('DapBreakpoint', {text='', texthl='RedCursor', linehl='', numhl=''})
			vim.fn.sign_define('DapStopped', { text='', texthl='YellowCursor', linehl='YellowBack', numhl=''})
			vim.api.nvim_set_hl(0, "DapCurrentLine", { default = true, link = "Visual" })
			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
		end,
		keys = {
			{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
			{ "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
			{ "<leader>dc", function() require("dap").continue() end,                                             desc = "Run/Continue" },
			{ "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
			{ "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to Line (No Execute)" },
			{ "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
			{ "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
			{ "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
			{ "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
			{ "<leader>do", function() require("dap").step_over() end,                                            desc = "Step Over" },
			{ "<leader>dO", function() require("dap").step_out() end,                                             desc = "Step Out" },
			{ "<leader>dP", function() require("dap").pause() end,                                                desc = "Pause" },
			{ "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
			{ "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
			{ "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
			{ "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = {
			"python",
		},
		dependencies = {
			{"mfussenegger/nvim-dap" }
		},
		config = function(_, _)
			require("dap-python").setup("python3")
		end,
	},
	{
		"igorlfs/nvim-dap-view",
		opts = {
			winbar = {
				show = true,
				sections = { "repl", "console", "scopes", "breakpoints", "watches", "exceptions", "threads", },
				default_section = "scopes",
				custom_sections = {},
				controls = {
					enabled = true,
					position = "right",
					buttons = {
						"play",
						"step_into",
						"step_over",
						"step_out",
						"step_back",
						"run_last",
						"terminate",
						"disconnect",
					},
					custom_buttons = {},
				},
			},
			icons = {
				disabled = "",
				disconnect = "",
				enabled = "",
				filter = "󰈲",
				negate = " ",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = "",
			},
			auto_toggle = true,
		},
	},
}
