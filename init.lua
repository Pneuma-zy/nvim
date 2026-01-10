-- Neovim 启动时只会读取这个文件
-- 其他所有 lua 文件都是从这里 require 进去的

-- 加载基础设置
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- 加载插件系统
require("plugins")

