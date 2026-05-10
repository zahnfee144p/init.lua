return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function ()
        require('nvim-treesitter').setup {
            require('nvim-treesitter').install { 'lua', 'luadoc', 'bash', 'zig', 'go' , 'vimdoc', 'zsh' }
        }
    end
}
