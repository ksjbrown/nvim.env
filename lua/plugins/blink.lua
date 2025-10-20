return {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        cmdline = { enabled = false },
        completion = {
            documentation = {
                auto_show = false,
                auto_show_delay_ms = 500,
            },
            ghost_text = {
                enabled = true,
                show_with_menu = true,
            },
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },

            },
            menu = {
                auto_show = false,
                winhighlight =
                "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
            },
        },
        keymap = {
            preset = "default",
            ["<Tab>"] = { "accept", "fallback" },
        },
        signature = {
            enabled = true,
            window = {
                show_documentation = false,
            }
        }
    },
    build = "cargo build --release",
}
