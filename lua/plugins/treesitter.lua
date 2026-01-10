-- 文件路径示例: ~/.config/nvim/lua/plugins/treesitter.lua
-- 如果你用的是 plugins/init.lua => require("plugins.treesitter") 或直接把这个表放入 lazy.setup 插件列表

return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- 编译/安装解析器。使用 update({with_sync=true}) 会同步执行，适合 headless 安装
    build = function()
      -- 这里用 pcall 防止安装失败导致整个 Lazy sync 中断
      local ok, tsi = pcall(require, "nvim-treesitter.install")
      if ok and tsi then
        tsi.update({ with_sync = true })
      end
    end,
    -- 在插件加载后配置
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then
        -- 如果这里失败，说明插件没有正确加载/安装，打印信息方便排查
        vim.notify("nvim-treesitter: failed to require configs", vim.log.levels.ERROR)
        return
      end

      configs.setup {
        -- 推荐把你常用语言列出来，* 有时会出问题，先固定几种
        ensure_installed = { "c", "cpp", "lua", "python", "javascript", "json" },

        -- 高亮设置
        highlight = {
          enable = true,            -- 开启高亮
          additional_vim_regex_highlighting = false,
        },

        -- 缩进支持（注意：某些语言不稳定）
        indent = {
          enable = true,
        },

        -- 增强模块（按需启用）
        matchup = {
          enable = true,
        },
      }
    end,
    -- lazy.nvim 的延迟加载机制：按需或在 BufRead 之后加载
    event = { "BufReadPost", "BufNewFile" },
  },
}

