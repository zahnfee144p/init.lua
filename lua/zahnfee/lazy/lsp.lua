return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "rafamadriz/friendly-snippets",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "zls",
                "texlab",
            },
        })

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = "Lua 5.1" },
                    diagnostics = {
                        globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                    },
                },
            },
        })

        vim.lsp.config("zls", {
            root_dir = vim.fs.root(0, { ".git", "build.zig", "zls.json" }),
            settings = {
                zls = {
                    enable_inlay_hints = true,
                    enable_snippets = true,
                    warn_style = true,
                },
            },
        })
        vim.g.zig_fmt_parse_errors = 0
        vim.g.zig_fmt_autosave = 0

        vim.lsp.config("texlab", {
            settings = {
                texlab = {
                    rootDirectory = nil, -- figures it out by itself
                    build = {
                        executable = "latexmk",
                        args = {
                            "-lualatex",
                            "-shell-escape",
                            "-interaction=nonstopmode",
                            "-synctex=1",
                            "%f",
                        },
                        forwardSearchAfter = true,
                        onSave = true,
                    },
                    chktex = {
                        onOpenAndSave = true,
                        -- disable specific nitpicks (chktex -h)
                        -- restArgs = { "-n1",
                        -- "-n8"
                        -- },
                    },
                    forwardSearch = {
                        executable = "papers",
                        args = { "%p" },
                    },
                },
            },
        })
        vim.lsp.enable("texlab")
        -- Automatically trigger TexLab build on every file save
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = "*.tex",
            callback = function()
                vim.cmd("LspTexlabBuild")
            end,
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        require("luasnip").setup({
            updateevents = "TextChanged, TextChangedI",
        })

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        -- IDE like quickfixes
        vim.keymap.set("n", "<leader>tq", function()
            vim.lsp.buf.code_action()
        end)

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
