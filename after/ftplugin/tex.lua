vim.opt.textwidth = 110
vim.opt.colorcolumn = "110"
vim.opt.wrapmargin = 0
vim.opt.linebreak = true
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.cmd("set formatoptions+=t")
vim.keymap.set("n", "<leader>B", function()
    vim.cmd("LspTexlabBuild")
end)
vim.keymap.set("n", "<leader>F", function()
    vim.cmd("LspTexlabForward")
end)
