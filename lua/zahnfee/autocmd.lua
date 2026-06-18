-- Automatically trigger TexLab build on every file save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = function()
    vim.cmd("LspTexlabBuild")
  end,
})
