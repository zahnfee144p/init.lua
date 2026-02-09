vim.keymap.set("n", "<leader>t]", function()
    require("trouble").next("diagnostics", { jump = true, skip_groups = true })
    require("trouble").jump("diagnostics", { jump = true, skip_groups = true })
end)
return {
    "folke/trouble.nvim",
    opts = {
        auto_close = true,
        follow = false,
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>tT",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>tt",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>tL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>tQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
        {
            "]t",
            "<cmd>Trouble diagnostics next skip_groups=true jump=true filter.buf=0<cr>",
            desc = "Next Trouble Item",
        },
        {
            "[t",
            "<cmd>Trouble diagnostics prev skip_groups=true jump=true filter.buf=0<cr>",
            desc = "Previous Trouble Item (Current Buffer)",
        },
        {
            "]T",
            "<cmd>Trouble diagnostics next skip_groups=true jump=true<cr>",
            desc = "Next Trouble Item",
        },
        {
            "[T",
            "<cmd>Trouble diagnostics prev skip_groups=true jump=true<cr>",
            desc = "Previous Trouble Item (Current Buffer)",
        },
    },
    win = {
        modes = {
            preview_float = {
                mode = "diagnostics",
                preview = {
                    type = "float",
                    relative = "editor",
                    border = "rounded",
                    title = "Preview",
                    title_pos = "center",
                    position = { 0, -2 },
                    size = { width = 0.3, height = 0.3 },
                    zindex = 200,
                },
            },
        },
    },
}
