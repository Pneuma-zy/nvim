-- 自动命令组
local augroup = vim.api.nvim_create_augroup

local group = augroup("MyAutoCmds", {})

-- 保存时自动去除行尾空格
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

