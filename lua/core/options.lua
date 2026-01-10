local opt = vim.opt

-- 行号
opt.number = true          -- 显示行号
opt.relativenumber = true -- 相对行号（方便跳转）

-- 缩进
opt.tabstop = 2           -- 一个 tab 显示为 2 个空格
opt.shiftwidth = 2        -- 自动缩进时使用 2 个空格
opt.expandtab = true      -- tab 转为空格

-- 搜索
opt.ignorecase = true     -- 忽略大小写
opt.smartcase = true     -- 有大写时区分大小写

-- 显示
opt.termguicolors = true -- 真彩色支持
opt.cursorline = true    -- 高亮当前行

-- 行为
opt.wrap = false          -- 不自动换行
opt.scrolloff = 8         -- 光标上下保留 8 行

