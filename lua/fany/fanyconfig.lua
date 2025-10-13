vim.opt.timeoutlen = 200
if vim.g.neovide then
  vim.cmd.colorscheme("tokyonight-moon")
end

-- 设置 visual 模式下选中的背景高亮色
vim.cmd("highlight Visual guibg=#135564")

-- 设置光标的颜色默认为拉姆的发(fà)色
vim.cmd("highlight Cursor gui=NONE guifg=bg guibg=#ffb6c1")

-- hop
-- 设置单字符高亮的颜色为 notion 中的暗色模式下的砖红色
vim.api.nvim_command("highlight HopNextKey guifg=#FF7369 guibg=none gui=none ctermfg=none cterm=bold")

-- 解决 python 在定义函数参数时按下 : 会自动缩进的问题
vim.api.nvim_command("set indentkeys-=<:>")

vim.g.neovide_fullscreen = true
vim.o.termguicolors = true  -- init.lua
-- I dont know why write powershell_es config here will be effective for codeFormatting, but in lspconfig it will not work
if not vim.g.vscode then
  require("lspconfig").powershell_es.setup({
    filetypes = { "ps1", "psm1", "psd1" },
    bundle_path = "~/AppData/Local/nvim-data/mason/packages/powershell-editor-services",
    settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
    init_options = {
      enableProfileLoading = false,
    },
  })
end

-- 添加 clangd 配置解决头文件问题
require("lspconfig").clangd.setup({
  capabilities = capabilities,
  cmd = { "C:/msys64/mingw64/bin/clangd.exe",
    "--query-driver=C:/msys64/mingw64/bin/g++.exe",
    "--background-index",
    "--clang-tidy" ,
    "--header-insertion=never"},
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  --init_options = {
  --  clangdFileStatus = true,
  --  替换为您的实际 MinGW 路径（示例路径，请根据实际修改）
    -- fallbackFlags = {
    --   "-IC:/msys64/mingw64/include/c++/15.1.0",
    --   "-IC:/msys64/mingw64/include/c++/15.1.0/x86_64-w64-mingw32",
    --   "-IC:/msys64/mingw64/include"
    -- }
  --},
  capabilities = {
    offsetEncoding = "utf-8",  -- 解决 Windows 上的编码问题
  }
})
