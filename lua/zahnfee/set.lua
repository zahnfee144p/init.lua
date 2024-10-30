vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true 

vim.opt.wrap = false

-- maybe use this
vim.opt.swapfile = false
vim.opt.backup = false

-- useful, also look at this: https://github.com/kevinhwang91/nvim-fundo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- maybe do this, depends on plugin responsiveness
vim.opt.updatetime = 50 

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
-- needs plugin(s) to work properly
-- vim.opt.signcolumn = "yes"
-- don't know what this does exactly, may be useful
-- vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"
