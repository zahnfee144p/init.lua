return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({
            pickers = {
                find_files = {
                    push_tagstack_on_edit = true,
                },
            },
        })

        local builtin = require('telescope.builtin')
        -- project files
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        -- git files
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
        -- project word search
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        -- project WORD (line) search
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        -- project search
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
