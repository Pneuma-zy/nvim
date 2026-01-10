-- lazy.nvim 安装路径
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 如果没安装，就 clone
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

-- 加入 runtimepath
vim.opt.rtp:prepend(lazypath)

-- 启动 lazy
require("lazy").setup({
  -- 插件列表
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  require("plugins.lsp"),
  require("plugins.treesitter"),
  require("plugins.cmp"),
  require("plugins.telescope"),
  require("plugins.filetree"),
  require("plugins.statusline"),
  require("plugins.git"),

})

