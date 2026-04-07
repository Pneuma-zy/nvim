if vim.fn.has("win32") == 1 then
  -- 清除环境变量中已有的 SHELL 设置（防止 pwsh 优先）
  vim.fn.setenv("SHELL", "")

  -- 明确指定旧版 PowerShell 的完整路径
  vim.o.shell = "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
  vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end
vim.diagnostic.config({
  virtual_text = true,   -- 行尾显示错误
  signs = true,          -- 行号旁显示 E/W
  underline = true,      -- 下划线标出错误位置
  update_in_insert = false,
  severity_sort = true,
  float = {
    show_header = true,
    source = "always",
    border = "rounded",
  },
})
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.number = true           -- 显示绝对行号
vim.opt.relativenumber = true   -- 显示相对行号

require("fany.fanykeymaps")
require("fany.fanyconfig")
if not vim.g.vscode then
  require("fany.fanytelescope")
  require("fany.fanyformat")
  require("fany.utils.fanyutils").set_os_info()
  require("fany.fanysnippets")
  require("fany.fanyneotree")
  require("fany.fanytoggleterm")
end
vim.opt.list = false
vim.opt.fileformat = "unix"
